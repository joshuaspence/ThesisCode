module basic (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        a,
        b,
        c
)/*synthesis syn_black_box*/;
input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
input  [7:0] a;
input  [7:0] b;
output  [7:0] c;
endmodule

