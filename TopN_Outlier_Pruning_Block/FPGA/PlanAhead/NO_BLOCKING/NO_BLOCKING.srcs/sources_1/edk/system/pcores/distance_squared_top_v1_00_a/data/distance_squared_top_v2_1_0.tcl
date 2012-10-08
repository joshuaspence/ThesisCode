# ELABORATE_PROC entry
proc elaborate {mhsinst} {
    ## 1. Search xco files
    set mpd [xget_hw_mpd_handle $mhsinst]
    set pcore_dir [xget_hw_pcore_dir_from_mpd $mpd]
    # hint: pcore_dir = <pcore>/data
    set synhdl_dir [file normalize [file join $pcore_dir .. synhdl]]
    set xcos [glob -nocomplain [file join $synhdl_dir * *.xco]]

    ## 2. Iterate all xcos
    foreach xco $xcos {
        ## 2.1. Get paths of result files
        set result_files [get_result_files $xco]

        ## 2.2. Check if the result files need to be (re)generated
        if {[check_result_files $result_files $xco]} {
            continue
        }

        ## 2.3. Invoke coregen
        set coregen_dir [file join $pcore_dir __coregen_tmp__]
        file delete -force $coregen_dir
        file mkdir $coregen_dir
        invoke_coregen $coregen_dir $xco

        ## 2.4. Add files
        foreach dst_file $result_files {
            set rtl [file tail $dst_file]
            set src_file [file join $coregen_dir $rtl]
            set dst_dir [file dirname $dst_file]
            if {![file exists $dst_dir]} {
                file mkdir $dst_dir
            }
            file copy -force $src_file $dst_file
        }

        ## 2.5. Delete coregen temp dir
        file delete -force $coregen_dir
    }

    ## 3. Copy mif to sim dir if caller is 'simgen'
    set caller [xget_nameofexecutable]
    if {[string equal -nocase $caller "simgen"]} {
        ## get output dir
        set output_dir [xget_tool_output_dir]
        if {$output_dir == "" && $output_dir == "NOT_SET"} {
            set output_dir [file join simulation behavioral]
        }
        if {![file isdir $output_dir]} {
            file mkdir $output_dir
        }
        ## copy mif file(s)
        foreach mif [glob -nocomplain [file join $pcore_dir .. simhdl * *.mif]] {
            file copy -force $mif $output_dir
        }
    }

    ## 4. Copy ngc to implementation dir if caller is 'platgen'
    if {[string equal -nocase $caller "platgen"]} {
        set inst_name [xget_hw_name $mhsinst]
        set output_dir [file join [pwd] implementation ${inst_name}_wrapper]
        ## copy ngc file(s)
        foreach ngc [glob -nocomplain [file join $pcore_dir .. netlist *.ngc]] {
            file copy -force $ngc $output_dir
        }
    }
}

# get result file list
proc get_result_files {xco} {
    ## get ip name and language
    set ip_name [file root [file tail $xco]]
    set lang [file tail [file dirname $xco]]
    if {$lang == "vhdl"} {
        set ext ".vhd"
    } else {
        set ext ".v"
    }

    ## get gen files
    set ret ""
    # rtl
    set hdldir [file dirname $xco]
    lappend ret [file join $hdldir ${ip_name}${ext}]
    lappend ret [file join $hdldir .. .. simhdl $lang ${ip_name}${ext}]
    # mif
    set coe [file root $xco].coe
    if {[file isfile $coe]} {
        lappend ret [file join $hdldir .. .. simhdl $lang ${ip_name}.mif]
    }
    # ngc
    set ngcdir [file join $hdldir .. .. netlist]
    lappend ret [file join $ngcdir ${ip_name}.ngc]

    return $ret
}

# check result files
# return : 0 - need to be (re)generated
#        : 1 - don't need to be (re)generated
proc check_result_files {files xco} {
    foreach f $files {
        # check if the file exists
        if {![file isfile $f]} {
            return 0
        }
        # check if the file is newer than xco
        if {[file mtime $f] < [file mtime $xco]} {
            return 0
        }
        # check if the file is 'empty'
        set fl [open $f r]
        set s [read $fl]
        close $fl
        if {[regexp {(?n)^This is an empty file.$} $s]} {
            return 0
        }
    }
    return 1
}

# run coregen to generate ngc and rtl simulation model
proc invoke_coregen {coregen_dir xco} {
    ## 1. Copy xco and coe to coregen_dir
    file copy -force $xco $coregen_dir
    set coe "[file root $xco].coe"
    if {[file isfile $coe]} {
        file copy -force $coe $coregen_dir
    }

    ## 2. Enter coregen_dir
    set cur_dir [pwd]
    cd $coregen_dir

    ## 3. Generate an empty coregen project and run coregen
    set project "project.cgp"
    close [open $project w]
    puts "Generating IP([file tail $xco]) ..."
    if {[catch {exec coregen -b $xco -p $project -intstyle silent >& log} err_msg]} {
        puts "Failed to generate IP '[file tail $xco]'!"
        return -code error
    }
    puts "Done!"

    ## 3. Go back to cur_dir
    cd $cur_dir
}

# vim: set ts=4 sw=4 et:
