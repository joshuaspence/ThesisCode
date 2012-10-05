-- Version: release . Copyright (C) 2011 XILINX, Inc.

library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
-- synthesis translate_off
use std.textio.all;
-- synthesis translate_on
package AESL_components is

  function esl_seteq(v1, v2 : unsigned) return Boolean;
  function esl_seteq(v1 : std_logic_vector; v2 : std_logic) return Boolean;
  function esl_seteq(v1, v2 : std_logic_vector) return Boolean;
  function esl_seteq(v1 : std_logic; v2 : std_logic) return Boolean;

  function esl_setne(v1, v2 : unsigned) return Boolean;
  function esl_setne(v1, v2 : std_logic_vector) return Boolean;

  function esl_not(v : Boolean) return Boolean;
  function esl_not(v : std_logic) return Boolean;
  function esl_not(v : std_logic) return std_logic;

  function esl_setle(v1, v2 : unsigned) return Boolean;
  function esl_setle(v1, v2 : std_logic_vector) return Boolean;
  
  function esl_setge(v1, v2 : unsigned) return Boolean;
  function esl_setge(v1, v2 : std_logic_vector) return Boolean;
  
  function esl_setlt(v1, v2 : unsigned) return Boolean;
  function esl_setlt(v1, v2 : std_logic_vector) return Boolean;
  
  function esl_setgt(v1, v2 : unsigned) return Boolean;
  function esl_setgt(v1, v2 : std_logic_vector) return Boolean;

  function esl_icmp_eq(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
  function esl_icmp_ne(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
  function esl_icmp_ugt(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
  function esl_icmp_uge(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
  function esl_icmp_ult(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
  function esl_icmp_ule(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;

  function esl_icmp_sgt(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
  function esl_icmp_sge(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
  function esl_icmp_slt(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
  function esl_icmp_sle(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;

  function esl_ctlz(v: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
  function esl_cttz(v: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;

--////////////////////////////////////////////////////////////////
--// Conversions
--////////////////////////////////////////////////////////////////

  function esl_trunc(v : STD_LOGIC_VECTOR; res_len : natural) return STD_LOGIC_VECTOR;

  function esl_sext(v : STD_LOGIC_VECTOR; res_len : natural) return STD_LOGIC_VECTOR;

  function esl_zext(v : STD_LOGIC_VECTOR; res_len : natural) return STD_LOGIC_VECTOR;

  function esl_bitcast(v: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
  function esl_bitconcatenate(v0: STD_LOGIC_VECTOR; v1: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
  function esl_bitselect(v0, v1 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
  function esl_bitset(v0, v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;


  function esl_partselect(v0, vlo, vhi: STD_LOGIC_VECTOR; reslen : natural) return STD_LOGIC_VECTOR;
  function esl_partset(v0, v1, vlo, vhi: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;

  function esl_andreduce(arg: std_logic_vector) return std_logic_vector;
  function esl_nandreduce(arg: std_logic_vector) return std_logic_vector;
  function esl_orreduce(arg: std_logic_vector) return std_logic_vector;
  function esl_norreduce(arg: std_logic_vector) return std_logic_vector;
  function esl_xorreduce(arg: std_logic_vector) return std_logic_vector;
  function esl_xnorreduce(arg: std_logic_vector) return std_logic_vector;


--////////////////////////////////////////////////////////////////
--// Logic/Arithmetic operations
--////////////////////////////////////////////////////////////////
  function esl_shl(arg, c : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;

  function esl_lshr(arg, c : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;

  function esl_ashr(arg, c : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;

  function esl_add(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
  function esl_add(v1, v2 : unsigned) return unsigned;

  function esl_sub(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;

  function esl_mul(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;

  function esl_sdiv(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
  function esl_udiv(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;

  function esl_srem(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;
  function esl_urem(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR;

  function esl_mul_uu(v1, v2 : STD_LOGIC_VECTOR; reslen : natural) return STD_LOGIC_VECTOR;
  function esl_mul_us(v1, v2 : STD_LOGIC_VECTOR; reslen : natural) return STD_LOGIC_VECTOR;
  function esl_mul_su(v1, v2 : STD_LOGIC_VECTOR; reslen : natural) return STD_LOGIC_VECTOR;
  function esl_mul_ss(v1, v2 : STD_LOGIC_VECTOR; reslen : natural) return STD_LOGIC_VECTOR;


-- ////////////////////////////////////////////////////////////////
-- // Other operations
-- ////////////////////////////////////////////////////////////////

--///address operation for bus
   function esl_getelementptr(v1, v2: std_logic_vector) return std_logic_vector;

end package;

package body AESL_components is

  --=========================Local Subprograms =================================

  function MAX (LEFT, RIGHT: INTEGER) return INTEGER is
  begin
    if LEFT > RIGHT then return LEFT;
    else return RIGHT;
    end if;
  end MAX;

  function MIN (LEFT, RIGHT: INTEGER) return INTEGER is
  begin
    if LEFT < RIGHT then return LEFT;
    else return RIGHT;
    end if;
  end MIN;


  --=========== Public routines =============
  

  ----------------------------------------------------------------
  -- Conditional comparison functions
  ----------------------------------------------------------------
  
  function esl_seteq(v1, v2 : unsigned) return Boolean is
    variable res : boolean;
    begin
      res := (v1 = v2);
      return res;
    end function;

  function esl_seteq(v1 : std_logic_vector; v2 : std_logic) return Boolean is
    variable res : boolean;
    begin
      res := (v1(0) = v2);
      return res;
    end function;

  function esl_seteq(v1, v2 : std_logic_vector) return Boolean is
    variable res : boolean;
    begin
      res := (v1 = v2);
      return res;
    end function;

  function esl_seteq(v1 : std_logic; v2 : std_logic) return Boolean is
    variable res : boolean;
    begin
      res := (v1 = v2);
      return res;
    end function;
    
  function esl_setne(v1, v2 : unsigned) return Boolean is
    variable res : boolean;
    begin
      res := not (v1 = v2);
      return res;
    end function;

  function esl_setne(v1, v2 : std_logic_vector) return Boolean is
    variable res : boolean;
    begin
      res := not (v1 = v2);
      return res;
    end function;

  function esl_not(v : Boolean) return Boolean is
    variable res : boolean;
    begin
      res := not (v);
      return res;
    end function;

  function esl_not(v : std_logic) return Boolean is
    variable res : boolean;
    begin
      res := (v = '0');
      return res;
    end function;

  function esl_not(v : std_logic) return std_logic is
    variable res : std_logic;
    begin
      res := not (v);
      return res;
    end function;
    
  function esl_setle(v1, v2 : unsigned) return Boolean is
    variable res : boolean;
    begin
      res := (v1 <= v2);
      return res;
    end function;
  
  function esl_setle(v1, v2 : std_logic_vector) return Boolean is
    variable res : boolean;
    begin
      res := (unsigned(v1) <= unsigned(v2));
      return res;
    end function;
    
  function esl_setge(v1, v2 : unsigned) return Boolean is
    variable res : boolean;
    begin
      res := (v1 >= v2);
      return res;
    end function;

  function esl_setge(v1, v2 : std_logic_vector) return Boolean is
    variable res : boolean;
    begin
      res := (unsigned(v1) >= unsigned(v2));
      return res;
    end function;
    
  function esl_setlt(v1, v2 : unsigned) return Boolean is
    variable res : boolean;
    begin
      res := (v1 < v2);
      return res;
    end function;
  
  function esl_setlt(v1, v2 : std_logic_vector) return Boolean is
    variable res : boolean;
    begin
      res := (unsigned(v1) < unsigned(v2));
      return res;
    end function;
    
  function esl_setgt(v1, v2 : unsigned) return Boolean is
    variable res : boolean;
    begin
      res := (v1 > v2);
      return res;
    end function;
  
  function esl_setgt(v1, v2 : std_logic_vector) return Boolean is
    variable res : boolean;
    begin
      res := (unsigned(v1) > unsigned(v2));
      return res;
    end function;


    
  ----------------------------------------------------------------
  -- Comparators
  ----------------------------------------------------------------

  function esl_icmp_eq(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
    variable res : STD_LOGIC_VECTOR(0 downto 0);
    begin
      if v1 = v2 then
        res := "1";
      else
        res := "0";
      end if;
      return res;
    end function;

    
  function esl_icmp_ne(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
    variable res : STD_LOGIC_VECTOR(0 downto 0);
    begin
      if v1 = v2 then
        res := "0";
      else
        res := "1";
      end if;
      return res;
    end function;


  function esl_icmp_ugt(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
    variable res : STD_LOGIC_VECTOR(0 downto 0);
    begin
      if unsigned(v1) > unsigned(v2) then
        res := "1";
      else
        res := "0";
      end if;
      return res;
    end function;

  function esl_icmp_uge(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
    variable res : STD_LOGIC_VECTOR(0 downto 0);
    begin
      if unsigned(v1) >= unsigned(v2) then
        res := "1";
      else
        res := "0";
      end if;
      return res;
    end function;

  function esl_icmp_ult(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
    variable res : STD_LOGIC_VECTOR(0 downto 0);
    begin
      if unsigned(v1) < unsigned(v2) then
        res := "1";
      else
        res := "0";
      end if;
      return res;
    end function;

  function esl_icmp_ule(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
    variable res : STD_LOGIC_VECTOR(0 downto 0);
    begin
      if unsigned(v1) <= unsigned(v2) then
        res := "1";
      else
        res := "0";
      end if;
      return res;
    end function;

  function esl_icmp_sgt(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
    variable res : STD_LOGIC_VECTOR(0 downto 0);
    begin
      if signed(v1) > signed(v2) then
        res := "1";
      else
        res := "0";
      end if;
      return res;
    end function;

  function esl_icmp_sge(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
    variable res : STD_LOGIC_VECTOR(0 downto 0);
    begin
      if signed(v1) >= signed(v2) then
        res := "1";
      else
        res := "0";
      end if;
      return res;
    end function;

  function esl_icmp_slt(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
    variable res : STD_LOGIC_VECTOR(0 downto 0);
    begin
      if signed(v1) < signed(v2) then
        res := "1";
      else
        res := "0";
      end if;
      return res;
    end function;

  function esl_icmp_sle(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
    variable res : STD_LOGIC_VECTOR(0 downto 0);
    begin
      if signed(v1) <= signed(v2) then
        res := "1";
      else
        res := "0";
      end if;
      return res;
    end function;


    
  ----------------------------------------------------------------
  -- Convertors
  ----------------------------------------------------------------

  function esl_trunc(v : STD_LOGIC_VECTOR; res_len : natural) return STD_LOGIC_VECTOR is
    variable res : STD_LOGIC_VECTOR(res_len-1 downto 0);
    begin
      res := v(res_len - 1 downto 0);
      return res;
    end function;
      
  function esl_sext(v : STD_LOGIC_VECTOR; res_len : natural) return STD_LOGIC_VECTOR is
    variable res : STD_LOGIC_VECTOR(res_len-1 downto 0);
    begin
      res(v'length-1 downto 0) := v;
      res(res_len - 1 downto v'length) := (others => v(v'length - 1));
      return res;
    end function;

  function esl_zext(v : STD_LOGIC_VECTOR; res_len : natural) return STD_LOGIC_VECTOR is 
  variable res : STD_LOGIC_VECTOR(res_len-1 downto 0);
  begin
    res(v'length-1 downto 0) := v;
    res(res_len - 1 downto v'length) := (others => '0');
    return res;
  end function;

  function esl_bitcast(v : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is 
  begin
    return v;
  end function;

  function esl_bitconcatenate(v0 : STD_LOGIC_VECTOR; v1: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
  begin
    return (v0 & v1);
  end function;

  function esl_bitselect(v0, v1 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
    variable idx : integer;
    variable ret : STD_LOGIC_VECTOR(0 downto 0);
  begin
    idx := to_integer(UNSIGNED(v1));
    if idx >= v0'low and idx <= v0'high then
        ret(0) := v0(idx);
    else
        ret(0) := '-';
    end if;
    return ret;
  end function;

  function esl_bitset(v0, v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
    variable idx : integer;
    variable res : STD_LOGIC_VECTOR(v0'length - 1 downto 0);
    variable res1 : STD_LOGIC_VECTOR(0 downto 0);
  begin
    idx := to_integer(UNSIGNED(v1));
    res := v0;
    res1 := esl_orreduce(v2);
    if idx >= v0'low and idx <= v0'high then
        res(idx) := res1(0);
    end if;
    return res;
  end function;
 
  function esl_partselect(v0, vlo, vhi: STD_LOGIC_VECTOR; reslen : natural) return STD_LOGIC_VECTOR is
      variable vlo_cpy : STD_LOGIC_VECTOR(v0'length + vlo'length -1 downto 0);
      variable vhi_cpy : STD_LOGIC_VECTOR(v0'length + vhi'length -1 downto 0);
      variable v0_cpy : STD_LOGIC_VECTOR(v0'length -1 downto 0);
      variable address_range, i, shift : integer;
      variable section : STD_LOGIC_VECTOR(v0'length-1 downto 0);
      variable tmp_mask : STD_LOGIC_VECTOR(v0'length-1 downto 0);
      variable resvalue, res_value, res_mask : STD_LOGIC_VECTOR(v0'length - 1 downto 0);
  begin
      address_range := 0;
      shift := 1;
      while (shift < v0'length) loop
          address_range := address_range + 1;
          shift := shift *2;
      end loop;
      vlo_cpy := (others => '0');
      vlo_cpy(address_range -1 downto 0) := vlo(address_range -1 downto 0);
      vhi_cpy := (others => '0');
      vhi_cpy(address_range -1 downto 0) := vhi(address_range -1 downto 0);
      v0_cpy := v0;
      if (vlo_cpy(address_range-1 downto 0) > vhi_cpy(address_range-1 downto 0)) then
          vhi_cpy(address_range -1 downto 0) :=std_logic_vector(v0'length-1-unsigned(vhi(address_range-1 downto 0)));
          vlo_cpy(address_range -1 downto 0) :=std_logic_vector(v0'length-1-unsigned(vlo(address_range-1 downto 0)));
          for i in 0 to v0'length -1 loop
            v0_cpy(i) := v0(v0'length-1 -i);
          end loop;
      end if;

      res_value := esl_lshr(v0_cpy, vlo_cpy(address_range-1 downto 0));

      section := (others=>'0');
      section(address_range-1 downto 0) := std_logic_vector(unsigned(vhi_cpy(address_range-1 downto 0)) - unsigned(vlo_cpy(address_range-1 downto 0)));
      tmp_mask := (others => '1');
      res_mask := esl_shl(tmp_mask, section);
      res_mask := res_mask(v0'length-2 downto 0) & '0';

      resvalue := res_value and not res_mask;
      return resvalue(reslen-1 downto 0);
    end function;

    function esl_partset(v0, v1, vlo, vhi: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
        variable vlo_cpy : STD_LOGIC_VECTOR(v0'length + vlo'length -1 downto 0);
        variable vhi_cpy : STD_LOGIC_VECTOR(v0'length + vhi'length -1 downto 0);
        variable v1_shift : STD_LOGIC_VECTOR(v0'length -1 downto 0);
        variable tmp : STD_LOGIC_VECTOR(v0'length-1 downto 0);
        variable v1_reverse : boolean;
        variable v1_cpy : STD_LOGIC_VECTOR(v0'length + v1'length -1 downto 0);
        variable address_range, i, shift : integer;
        variable tmp_v1, tmp_mask_low, tmp_mask_hi : STD_LOGIC_VECTOR(v0'length-1 downto 0);
        variable res_v1, res_mask, res_mask_low, res_mask_hi : STD_LOGIC_VECTOR(v0'length - 1 downto 0);
    begin
        address_range := 0;
        shift := 1;
        while (shift < v0'length) loop
            address_range := address_range + 1;
            shift := shift *2;
        end loop;
        vlo_cpy := (others => '0');
        vlo_cpy(address_range -1 downto 0) := vlo(address_range-1 downto 0);
        vhi_cpy := (others => '0');
        vhi_cpy(address_range -1 downto 0) := vhi(address_range-1 downto 0);
        v1_shift := (others => '0');
        v1_shift(address_range-1 downto 0) := vlo_cpy(address_range-1 downto 0);
        v1_reverse := false;
        if (vlo_cpy > vhi_cpy) then
            v1_shift(address_range-1 downto 0) := std_logic_vector(v0'length -1 -unsigned(vlo_cpy(address_range-1 downto 0)));
            v1_reverse := true;
            tmp := (others => '0');
            tmp(address_range - 1 downto 0) := vhi_cpy(address_range-1 downto 0);
            vhi_cpy(address_range -1 downto 0) := vlo(address_range-1 downto 0);
            vlo_cpy(address_range -1 downto 0) := tmp(address_range-1 downto 0);
        end if;
        v1_cpy := (others => '0');
        v1_cpy(v1'length -1 downto 0) := v1;

        tmp_mask_low := (others => '1');
        res_mask_low := esl_shl (tmp_mask_low, vlo_cpy);

        tmp_mask_hi := (others => '1');
        res_mask_hi := esl_shl (tmp_mask_hi, vhi_cpy);

        res_mask := (res_mask_hi(v0'length-2 downto 0) & '0') or not res_mask_low;

        tmp_v1 := esl_shl(v1_cpy(v0'length-1 downto 0), v1_shift);
        if v1_reverse then
            for i in 0 to v0'length-1 loop
                res_v1(i) := tmp_v1(v0'length-1-i);
            end loop;
        else
            res_v1 := tmp_v1;
        end if;

        return ((v0 and res_mask) or (res_v1 and not res_mask)); 
    end function;

  ----------------------------------------------------------------
  -- Arithmetic operators
  ----------------------------------------------------------------
  
  function esl_add(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
    variable res : unsigned(v1'length-1 downto 0);
    begin
      res := unsigned(v1) + unsigned(v2);
      return std_logic_vector(res);
    end function;

  function esl_add(v1, v2 : unsigned) return unsigned is
    variable res : unsigned(v1'length-1 downto 0);
    begin
      res := v1 + v2;
      return res;
    end function;


  function esl_sub(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
    variable res : unsigned(v1'length-1 downto 0);
    begin
      res := unsigned(v1) - unsigned(v2);
      return std_logic_vector(res);
    end function;


  function esl_mul(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
    variable res : unsigned (v1'length+v2'length-1 downto 0);
  begin
    res := unsigned(v1) * unsigned(v2);
    return STD_LOGIC_VECTOR(res(v1'length-1 downto 0));
  end function;

  function esl_udiv(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
    variable res : unsigned (v1'length-1 downto 0);
  begin
    res := unsigned(v1) / unsigned(v2);
    return STD_LOGIC_VECTOR(res);
  end function;

  function esl_sdiv(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
    variable res : signed (v1'length-1 downto 0);
  begin
    res := signed(v1) / signed(v2);
    return STD_LOGIC_VECTOR(res);
  end function;

  function esl_urem(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
    variable res : unsigned (v2'length-1 downto 0);
  begin
    res := unsigned(v1) rem unsigned(v2);
    return STD_LOGIC_VECTOR(res);
  end function;

  function esl_srem(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
    variable res : signed (v2'length-1 downto 0);
  begin
    res := signed(v1) rem signed(v2);
    return STD_LOGIC_VECTOR(res);
  end function;

  function esl_mul_uu(v1, v2 : STD_LOGIC_VECTOR; reslen : natural) return STD_LOGIC_VECTOR is
    variable res_i : unsigned (v1'length+v2'length-1 downto 0);
    variable res : unsigned (reslen-1 downto 0);
  begin
    res_i := unsigned(v1) * unsigned(v2);
    res := resize(res_i, reslen);
    return STD_LOGIC_VECTOR(res);
  end function;

  function esl_mul_us(v1, v2 : STD_LOGIC_VECTOR; reslen : natural) return STD_LOGIC_VECTOR is
    variable tmpv1 : std_logic_vector(v1'length downto 0);
    variable res : signed (v1'length+v2'length downto 0);
    variable ures : unsigned (v1'length+v2'length downto 0);
    variable sres : signed (v1'length+v2'length downto 0);
  begin
    tmpv1 := '0' & v1;
    res := signed(tmpv1) * signed(v2);
    if (reslen > v1'length+v2'length) then
        sres := signed(STD_LOGIC_VECTOR(res));
        return STD_LOGIC_VECTOR(resize(sres, reslen));
    else
        ures := unsigned(STD_LOGIC_VECTOR(res));
        return STD_LOGIC_VECTOR(resize(ures, reslen));
    end if;
  end function;
  
  function esl_mul_su(v1, v2 : STD_LOGIC_VECTOR; reslen : natural) return STD_LOGIC_VECTOR is
    variable tmpv2 : std_logic_vector(v2'length downto 0);
    variable res : signed (v1'length+v2'length downto 0);
    variable ures : unsigned (v1'length+v2'length downto 0);
    variable sres : signed (v1'length+v2'length downto 0);
  begin
    tmpv2 := '0' & v2;
    res := signed(v1) * signed(tmpv2);
    if (reslen > v1'length+v2'length) then
        sres := signed(STD_LOGIC_VECTOR(res));
        return STD_LOGIC_VECTOR(resize(sres, reslen));
    else
        ures := unsigned(STD_LOGIC_VECTOR(res));
        return STD_LOGIC_VECTOR(resize(ures, reslen));
    end if;
  end function;
  
  function esl_mul_ss(v1, v2 : STD_LOGIC_VECTOR; reslen : natural) return STD_LOGIC_VECTOR is
    variable res : signed (v1'length+v2'length-1 downto 0);
    variable ures : unsigned (v1'length+v2'length-1 downto 0);
    variable sres : signed (v1'length+v2'length-1 downto 0);
  begin
    res := signed(v1) * signed(v2);
    if (reslen > v1'length+v2'length) then
        sres := signed(STD_LOGIC_VECTOR(res));
        return STD_LOGIC_VECTOR(resize(sres, reslen));
    else
        ures := unsigned(STD_LOGIC_VECTOR(res));
        return STD_LOGIC_VECTOR(resize(ures, reslen));
    end if;
  end function;


  function esl_shl(arg, c : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
    constant TMP_SHW : NATURAL := MIN(c'length, 31);
    variable shc : std_logic_vector(TMP_SHW downto 0);
    variable count : integer;
    variable res : std_logic_vector(arg'length-1 downto 0);
  begin
    shc := '0' & c(TMP_SHW-1 downto 0);
    count := to_integer(unsigned(shc));
    res := std_logic_vector(shift_left(unsigned(arg), count));
    return res;
  end function;

  
  function esl_ashr(arg, c: std_logic_vector) return std_logic_vector is
    alias av : std_logic_vector (arg'length-1 downto 0) is arg;
    constant TMP_SHW : NATURAL := MIN(c'length, 31);
    variable shc : std_logic_vector(TMP_SHW downto 0);
    variable res : std_logic_vector (arg'length-1 downto 0);
    variable count : integer;
  begin
    shc := '0' & c(TMP_SHW-1 downto 0);
    count := to_integer(unsigned(shc));
    res := std_logic_vector(shift_right(signed(arg), count));
    return res;
  end function;

  
  function esl_lshr(arg, c: std_logic_vector) return std_logic_vector is
    alias av : std_logic_vector (arg'length-1 downto 0) is arg;
    constant TMP_SHW : NATURAL := MIN(c'length, 31);
    variable shc : std_logic_vector(TMP_SHW downto 0);
    variable res : std_logic_vector (arg'length-1 downto 0);
    variable count : integer;
  begin
    shc := '0' & c(TMP_SHW-1 downto 0);
    count := to_integer(unsigned(shc));
    res := std_logic_vector(shift_right(unsigned(arg), count));
    return res;
  end function;


  function esl_ctlz(v: std_logic_vector) return std_logic_vector is
    constant IN_WIDTH : NATURAL := v'length;
    constant OUT_WIDTH : NATURAL := v'length;    
    alias x : std_logic_vector (IN_WIDTH - 1 downto 0) is v;
    variable tmp : unsigned(OUT_WIDTH - 1 downto 0);
    variable res : std_logic_vector (OUT_WIDTH - 1 downto 0);
  begin
    res := std_logic_vector(to_unsigned(IN_WIDTH, OUT_WIDTH));

    for i in IN_WIDTH-1 downto 0 loop
      if x(i) = '1' then
        res := std_logic_vector(to_unsigned(IN_WIDTH-1-i, OUT_WIDTH));
        exit ;
      end if;
    end loop;
    
    return res;
  end function;


  function esl_cttz(v: std_logic_vector) return std_logic_vector is
    constant IN_WIDTH : NATURAL := v'length;
    constant OUT_WIDTH : NATURAL := v'length;    
    alias x : std_logic_vector (IN_WIDTH - 1 downto 0) is v;
    variable tmp : unsigned(OUT_WIDTH - 1 downto 0);
    variable res : std_logic_vector (OUT_WIDTH - 1 downto 0);
  begin
    res := std_logic_vector(to_unsigned(IN_WIDTH, OUT_WIDTH));

    for i in 0 to IN_WIDTH-1 loop
      if x(i) = '1' then
        res := std_logic_vector(to_unsigned(i, OUT_WIDTH));
        exit ;
      end if;
    end loop;
    
    return res;
  end function;


  function esl_andreduce(arg: std_logic_vector) return std_logic_vector is
    variable result: std_logic;
    variable ret: std_logic_vector(0 downto 0);
  begin
    result := '1';
    for i in arg'range loop
      result := result and arg(i);
    end loop;
    ret(0) := result;
    return ret;
  end;

  function esl_nandreduce(arg: std_logic_vector) return std_logic_vector is
    variable result: std_logic_vector(0 downto 0);
  begin
      result := esl_andreduce(arg);
      result(0) := not result(0);
      return result;
  end;

  function esl_orreduce(arg: std_logic_vector) return std_logic_vector is
    variable result: std_logic;
    variable ret: std_logic_vector(0 downto 0);
  begin
    result := '0';
    for i in arg'range loop
      result := result or arg(i);
    end loop;
    ret(0) := result;
    return ret;
  end;

  function esl_norreduce(arg: std_logic_vector) return std_logic_vector is
    variable result: std_logic_vector(0 downto 0);
  begin
    result := esl_orreduce(arg);
    result(0) := not result(0);
    return result;
  end;

  function esl_xorreduce(arg: std_logic_vector) return std_logic_vector is
    variable result: std_logic;
    variable ret: std_logic_vector(0 downto 0);
  begin
    result := '0';
    for i in arg'range loop
      result := result xor arg(i);
    end loop;
    ret(0) := result;
    return ret;
  end;

  function esl_xnorreduce(arg: std_logic_vector) return std_logic_vector is
    variable result: std_logic_vector(0 downto 0);
  begin
    result := esl_xorreduce(arg);
    result(0) := not result(0);
    return result;
  end;

  function esl_getelementptr(v1, v2 : std_logic_vector) return std_logic_vector
  is
  begin
    return esl_add(v1, v2);
  end;

end package body;




