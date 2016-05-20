--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: O.76xd
--  \   \         Application: netgen
--  /   /         Filename: fir_1d_synthesis.vhd
-- /___/   /\     Timestamp: Fri Apr 01 20:43:25 2016
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -filter F:/add/MCU_Project/design_env/ISE/Lab1/Ex1/FIR_1x5_const_coeff/iseconfig/filter.filter -intstyle ise -ar Structure -tm fir_1d -w -dir netgen/synthesis -ofmt vhdl -sim fir_1d_trn.ngc fir_1d_synthesis.vhd 
-- Device	: xc6slx150t-3-fgg676
-- Input file	: fir_1d_trn.ngc
-- Output file	: \\vboxsrv\studium\add\MCU_Project\design_env\ISE\Lab1\Ex1\FIR_1x5_const_coeff\netgen\synthesis\fir_1d_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: fir_1d_trn
-- Xilinx	: C:\Xilinx\13.3\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity fir_1d is
  port (
    ce_1 : in STD_LOGIC := 'X'; 
    clk_1 : in STD_LOGIC := 'X'; 
    load : in STD_LOGIC := 'X'; 
    coef : in STD_LOGIC_VECTOR ( 6 downto 0 ); 
    din : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
    out_data : out STD_LOGIC_VECTOR ( 18 downto 0 ) 
  );
end fir_1d;

architecture Structure of fir_1d is
  signal din_7_IBUF_0 : STD_LOGIC; 
  signal din_6_IBUF_1 : STD_LOGIC; 
  signal din_5_IBUF_2 : STD_LOGIC; 
  signal din_4_IBUF_3 : STD_LOGIC; 
  signal din_3_IBUF_4 : STD_LOGIC; 
  signal din_2_IBUF_5 : STD_LOGIC; 
  signal din_1_IBUF_6 : STD_LOGIC; 
  signal din_0_IBUF_7 : STD_LOGIC; 
  signal ce_1_IBUF_8 : STD_LOGIC; 
  signal clk_1_BUFGP_9 : STD_LOGIC; 
  signal out_data_18_OBUF_56 : STD_LOGIC; 
  signal inreg_11_stage_4_18_add_1_OUT_9_Q : STD_LOGIC; 
  signal inreg_11_stage_4_18_add_1_OUT_8_Q : STD_LOGIC; 
  signal inreg_11_stage_4_18_add_1_OUT_7_Q : STD_LOGIC; 
  signal inreg_11_stage_4_18_add_1_OUT_6_Q : STD_LOGIC; 
  signal inreg_11_stage_4_18_add_1_OUT_5_Q : STD_LOGIC; 
  signal inreg_11_stage_4_18_add_1_OUT_4_Q : STD_LOGIC; 
  signal inreg_11_stage_4_18_add_1_OUT_3_Q : STD_LOGIC; 
  signal inreg_11_stage_4_18_add_1_OUT_2_Q : STD_LOGIC; 
  signal inreg_11_stage_3_18_add_2_OUT_11_Q : STD_LOGIC; 
  signal inreg_11_stage_3_18_add_2_OUT_10_Q : STD_LOGIC; 
  signal inreg_11_stage_3_18_add_2_OUT_9_Q : STD_LOGIC; 
  signal inreg_11_stage_3_18_add_2_OUT_8_Q : STD_LOGIC; 
  signal inreg_11_stage_3_18_add_2_OUT_7_Q : STD_LOGIC; 
  signal inreg_11_stage_3_18_add_2_OUT_6_Q : STD_LOGIC; 
  signal inreg_11_stage_3_18_add_2_OUT_5_Q : STD_LOGIC; 
  signal inreg_11_stage_3_18_add_2_OUT_4_Q : STD_LOGIC; 
  signal inreg_11_stage_3_18_add_2_OUT_3_Q : STD_LOGIC; 
  signal inreg_11_stage_2_18_add_3_OUT_12_Q : STD_LOGIC; 
  signal inreg_11_stage_2_18_add_3_OUT_11_Q : STD_LOGIC; 
  signal inreg_11_stage_2_18_add_3_OUT_10_Q : STD_LOGIC; 
  signal inreg_11_stage_2_18_add_3_OUT_9_Q : STD_LOGIC; 
  signal inreg_11_stage_2_18_add_3_OUT_8_Q : STD_LOGIC; 
  signal inreg_11_stage_2_18_add_3_OUT_7_Q : STD_LOGIC; 
  signal inreg_11_stage_2_18_add_3_OUT_6_Q : STD_LOGIC; 
  signal inreg_11_stage_2_18_add_3_OUT_5_Q : STD_LOGIC; 
  signal inreg_11_stage_2_18_add_3_OUT_4_Q : STD_LOGIC; 
  signal inreg_11_stage_2_18_add_3_OUT_3_Q : STD_LOGIC; 
  signal inreg_11_stage_2_18_add_3_OUT_2_Q : STD_LOGIC; 
  signal inreg_11_stage_1_18_add_4_OUT_13_Q : STD_LOGIC; 
  signal inreg_11_stage_1_18_add_4_OUT_12_Q : STD_LOGIC; 
  signal inreg_11_stage_1_18_add_4_OUT_11_Q : STD_LOGIC; 
  signal inreg_11_stage_1_18_add_4_OUT_10_Q : STD_LOGIC; 
  signal inreg_11_stage_1_18_add_4_OUT_9_Q : STD_LOGIC; 
  signal inreg_11_stage_1_18_add_4_OUT_8_Q : STD_LOGIC; 
  signal inreg_11_stage_1_18_add_4_OUT_7_Q : STD_LOGIC; 
  signal inreg_11_stage_1_18_add_4_OUT_6_Q : STD_LOGIC; 
  signal inreg_11_stage_1_18_add_4_OUT_5_Q : STD_LOGIC; 
  signal inreg_11_stage_1_18_add_4_OUT_4_Q : STD_LOGIC; 
  signal inreg_11_stage_1_18_add_4_OUT_3_Q : STD_LOGIC; 
  signal inreg_11_stage_1_18_add_4_OUT_2_Q : STD_LOGIC; 
  signal inreg_11_stage_1_18_add_4_OUT_1_Q : STD_LOGIC; 
  signal Madd_inreg_11_stage_4_18_add_1_OUT_lut_2_Q_111 : STD_LOGIC; 
  signal Madd_inreg_11_stage_4_18_add_1_OUT_cy_2_Q_112 : STD_LOGIC; 
  signal Madd_inreg_11_stage_4_18_add_1_OUT_lut_3_Q_113 : STD_LOGIC; 
  signal Madd_inreg_11_stage_4_18_add_1_OUT_cy_3_Q_114 : STD_LOGIC; 
  signal Madd_inreg_11_stage_4_18_add_1_OUT_lut_4_Q_115 : STD_LOGIC; 
  signal Madd_inreg_11_stage_4_18_add_1_OUT_cy_4_Q_116 : STD_LOGIC; 
  signal Madd_inreg_11_stage_4_18_add_1_OUT_lut_5_Q_117 : STD_LOGIC; 
  signal Madd_inreg_11_stage_4_18_add_1_OUT_cy_5_Q_118 : STD_LOGIC; 
  signal Madd_inreg_11_stage_4_18_add_1_OUT_lut_6_Q_119 : STD_LOGIC; 
  signal Madd_inreg_11_stage_4_18_add_1_OUT_cy_6_Q_120 : STD_LOGIC; 
  signal Madd_inreg_11_stage_4_18_add_1_OUT_lut_7_Q_121 : STD_LOGIC; 
  signal Madd_inreg_11_stage_4_18_add_1_OUT_cy_7_Q_122 : STD_LOGIC; 
  signal Madd_inreg_11_stage_4_18_add_1_OUT_lut_8_Q_123 : STD_LOGIC; 
  signal Madd_inreg_11_stage_4_18_add_1_OUT_cy_8_Q_124 : STD_LOGIC; 
  signal Madd_inreg_11_stage_4_18_add_1_OUT_cy_9_Q_125 : STD_LOGIC; 
  signal Madd_inreg_11_stage_3_18_add_2_OUT_lut_3_Q_126 : STD_LOGIC; 
  signal Madd_inreg_11_stage_3_18_add_2_OUT_cy_3_Q_127 : STD_LOGIC; 
  signal Madd_inreg_11_stage_3_18_add_2_OUT_lut_4_Q_128 : STD_LOGIC; 
  signal Madd_inreg_11_stage_3_18_add_2_OUT_cy_4_Q_129 : STD_LOGIC; 
  signal Madd_inreg_11_stage_3_18_add_2_OUT_lut_5_Q_130 : STD_LOGIC; 
  signal Madd_inreg_11_stage_3_18_add_2_OUT_cy_5_Q_131 : STD_LOGIC; 
  signal Madd_inreg_11_stage_3_18_add_2_OUT_lut_6_Q_132 : STD_LOGIC; 
  signal Madd_inreg_11_stage_3_18_add_2_OUT_cy_6_Q_133 : STD_LOGIC; 
  signal Madd_inreg_11_stage_3_18_add_2_OUT_lut_7_Q_134 : STD_LOGIC; 
  signal Madd_inreg_11_stage_3_18_add_2_OUT_cy_7_Q_135 : STD_LOGIC; 
  signal Madd_inreg_11_stage_3_18_add_2_OUT_lut_8_Q_136 : STD_LOGIC; 
  signal Madd_inreg_11_stage_3_18_add_2_OUT_cy_8_Q_137 : STD_LOGIC; 
  signal Madd_inreg_11_stage_3_18_add_2_OUT_lut_9_Q_138 : STD_LOGIC; 
  signal Madd_inreg_11_stage_3_18_add_2_OUT_cy_9_Q_139 : STD_LOGIC; 
  signal Madd_inreg_11_stage_3_18_add_2_OUT_lut_10_Q_140 : STD_LOGIC; 
  signal Madd_inreg_11_stage_3_18_add_2_OUT_cy_10_Q_141 : STD_LOGIC; 
  signal Madd_inreg_11_stage_2_18_add_3_OUT_lut_2_Q_142 : STD_LOGIC; 
  signal Madd_inreg_11_stage_2_18_add_3_OUT_cy_2_Q_143 : STD_LOGIC; 
  signal Madd_inreg_11_stage_2_18_add_3_OUT_lut_3_Q_144 : STD_LOGIC; 
  signal Madd_inreg_11_stage_2_18_add_3_OUT_cy_3_Q_145 : STD_LOGIC; 
  signal Madd_inreg_11_stage_2_18_add_3_OUT_lut_4_Q_146 : STD_LOGIC; 
  signal Madd_inreg_11_stage_2_18_add_3_OUT_cy_4_Q_147 : STD_LOGIC; 
  signal Madd_inreg_11_stage_2_18_add_3_OUT_lut_5_Q_148 : STD_LOGIC; 
  signal Madd_inreg_11_stage_2_18_add_3_OUT_cy_5_Q_149 : STD_LOGIC; 
  signal Madd_inreg_11_stage_2_18_add_3_OUT_lut_6_Q_150 : STD_LOGIC; 
  signal Madd_inreg_11_stage_2_18_add_3_OUT_cy_6_Q_151 : STD_LOGIC; 
  signal Madd_inreg_11_stage_2_18_add_3_OUT_lut_7_Q_152 : STD_LOGIC; 
  signal Madd_inreg_11_stage_2_18_add_3_OUT_cy_7_Q_153 : STD_LOGIC; 
  signal Madd_inreg_11_stage_2_18_add_3_OUT_lut_8_Q_154 : STD_LOGIC; 
  signal Madd_inreg_11_stage_2_18_add_3_OUT_cy_8_Q_155 : STD_LOGIC; 
  signal Madd_inreg_11_stage_2_18_add_3_OUT_lut_9_Q_156 : STD_LOGIC; 
  signal Madd_inreg_11_stage_2_18_add_3_OUT_cy_9_Q_157 : STD_LOGIC; 
  signal Madd_inreg_11_stage_2_18_add_3_OUT_cy_10_Q_158 : STD_LOGIC; 
  signal Madd_inreg_11_stage_2_18_add_3_OUT_cy_11_Q_159 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_lut_1_Q_160 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_cy_1_Q_161 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_lut_2_Q_162 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_cy_2_Q_163 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_lut_3_Q_164 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_cy_3_Q_165 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_lut_4_Q_166 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_cy_4_Q_167 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_lut_5_Q_168 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_cy_5_Q_169 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_lut_6_Q_170 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_cy_6_Q_171 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_lut_7_Q_172 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_cy_7_Q_173 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_lut_8_Q_174 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_cy_8_Q_175 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_cy_9_Q_176 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_cy_10_Q_177 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_cy_11_Q_178 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_cy_12_Q_179 : STD_LOGIC; 
  signal Madd_inreg_11_stage_4_18_add_1_OUT_cy_9_rt_209 : STD_LOGIC; 
  signal Madd_inreg_11_stage_2_18_add_3_OUT_cy_10_rt_210 : STD_LOGIC; 
  signal Madd_inreg_11_stage_2_18_add_3_OUT_cy_11_rt_211 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_cy_9_rt_212 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_cy_10_rt_213 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_cy_11_rt_214 : STD_LOGIC; 
  signal Madd_inreg_11_stage_1_18_add_4_OUT_cy_12_rt_215 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal Mshreg_inreg_2_217 : STD_LOGIC; 
  signal Mshreg_inreg_0_218 : STD_LOGIC; 
  signal Mshreg_inreg_1_219 : STD_LOGIC; 
  signal Mshreg_inreg_3_220 : STD_LOGIC; 
  signal Mshreg_inreg_4_221 : STD_LOGIC; 
  signal Mshreg_inreg_5_222 : STD_LOGIC; 
  signal Mshreg_inreg_6_223 : STD_LOGIC; 
  signal Mshreg_inreg_7_224 : STD_LOGIC; 
  signal Mshreg_stage_1_1_225 : STD_LOGIC; 
  signal NLW_Mshreg_inreg_2_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mshreg_inreg_0_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mshreg_inreg_1_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mshreg_inreg_3_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mshreg_inreg_4_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mshreg_inreg_5_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mshreg_inreg_6_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mshreg_inreg_7_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mshreg_stage_1_1_Q15_UNCONNECTED : STD_LOGIC; 
  signal inreg : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal stage_4 : STD_LOGIC_VECTOR ( 8 downto 2 ); 
  signal stage_3 : STD_LOGIC_VECTOR ( 10 downto 2 ); 
  signal stage_2 : STD_LOGIC_VECTOR ( 11 downto 2 ); 
  signal stage_1 : STD_LOGIC_VECTOR ( 12 downto 1 ); 
  signal stage_0 : STD_LOGIC_VECTOR ( 13 downto 1 ); 
begin
  XST_GND : GND
    port map (
      G => out_data_18_OBUF_56
    );
  stage_4_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg(1),
      Q => stage_4(2)
    );
  stage_4_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg(2),
      Q => stage_4(3)
    );
  stage_4_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg(3),
      Q => stage_4(4)
    );
  stage_4_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg(4),
      Q => stage_4(5)
    );
  stage_4_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg(5),
      Q => stage_4(6)
    );
  stage_4_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg(6),
      Q => stage_4(7)
    );
  stage_4_8 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg(7),
      Q => stage_4(8)
    );
  stage_3_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_4_18_add_1_OUT_2_Q,
      Q => stage_3(2)
    );
  stage_3_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_4_18_add_1_OUT_3_Q,
      Q => stage_3(3)
    );
  stage_3_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_4_18_add_1_OUT_4_Q,
      Q => stage_3(4)
    );
  stage_3_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_4_18_add_1_OUT_5_Q,
      Q => stage_3(5)
    );
  stage_3_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_4_18_add_1_OUT_6_Q,
      Q => stage_3(6)
    );
  stage_3_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_4_18_add_1_OUT_7_Q,
      Q => stage_3(7)
    );
  stage_3_8 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_4_18_add_1_OUT_8_Q,
      Q => stage_3(8)
    );
  stage_3_9 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_4_18_add_1_OUT_9_Q,
      Q => stage_3(9)
    );
  stage_3_10 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => Madd_inreg_11_stage_4_18_add_1_OUT_cy_9_Q_125,
      Q => stage_3(10)
    );
  stage_2_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => stage_3(2),
      Q => stage_2(2)
    );
  stage_2_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_3_18_add_2_OUT_3_Q,
      Q => stage_2(3)
    );
  stage_2_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_3_18_add_2_OUT_4_Q,
      Q => stage_2(4)
    );
  stage_2_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_3_18_add_2_OUT_5_Q,
      Q => stage_2(5)
    );
  stage_2_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_3_18_add_2_OUT_6_Q,
      Q => stage_2(6)
    );
  stage_2_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_3_18_add_2_OUT_7_Q,
      Q => stage_2(7)
    );
  stage_2_8 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_3_18_add_2_OUT_8_Q,
      Q => stage_2(8)
    );
  stage_2_9 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_3_18_add_2_OUT_9_Q,
      Q => stage_2(9)
    );
  stage_2_10 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_3_18_add_2_OUT_10_Q,
      Q => stage_2(10)
    );
  stage_2_11 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_3_18_add_2_OUT_11_Q,
      Q => stage_2(11)
    );
  stage_1_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_2_18_add_3_OUT_2_Q,
      Q => stage_1(2)
    );
  stage_1_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_2_18_add_3_OUT_3_Q,
      Q => stage_1(3)
    );
  stage_1_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_2_18_add_3_OUT_4_Q,
      Q => stage_1(4)
    );
  stage_1_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_2_18_add_3_OUT_5_Q,
      Q => stage_1(5)
    );
  stage_1_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_2_18_add_3_OUT_6_Q,
      Q => stage_1(6)
    );
  stage_1_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_2_18_add_3_OUT_7_Q,
      Q => stage_1(7)
    );
  stage_1_8 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_2_18_add_3_OUT_8_Q,
      Q => stage_1(8)
    );
  stage_1_9 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_2_18_add_3_OUT_9_Q,
      Q => stage_1(9)
    );
  stage_1_10 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_2_18_add_3_OUT_10_Q,
      Q => stage_1(10)
    );
  stage_1_11 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_2_18_add_3_OUT_11_Q,
      Q => stage_1(11)
    );
  stage_1_12 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_2_18_add_3_OUT_12_Q,
      Q => stage_1(12)
    );
  stage_0_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_1_18_add_4_OUT_1_Q,
      Q => stage_0(1)
    );
  stage_0_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_1_18_add_4_OUT_2_Q,
      Q => stage_0(2)
    );
  stage_0_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_1_18_add_4_OUT_3_Q,
      Q => stage_0(3)
    );
  stage_0_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_1_18_add_4_OUT_4_Q,
      Q => stage_0(4)
    );
  stage_0_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_1_18_add_4_OUT_5_Q,
      Q => stage_0(5)
    );
  stage_0_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_1_18_add_4_OUT_6_Q,
      Q => stage_0(6)
    );
  stage_0_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_1_18_add_4_OUT_7_Q,
      Q => stage_0(7)
    );
  stage_0_8 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_1_18_add_4_OUT_8_Q,
      Q => stage_0(8)
    );
  stage_0_9 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_1_18_add_4_OUT_9_Q,
      Q => stage_0(9)
    );
  stage_0_10 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_1_18_add_4_OUT_10_Q,
      Q => stage_0(10)
    );
  stage_0_11 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_1_18_add_4_OUT_11_Q,
      Q => stage_0(11)
    );
  stage_0_12 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_1_18_add_4_OUT_12_Q,
      Q => stage_0(12)
    );
  stage_0_13 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => inreg_11_stage_1_18_add_4_OUT_13_Q,
      Q => stage_0(13)
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_lut_2_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_4(2),
      I1 => inreg(0),
      O => Madd_inreg_11_stage_4_18_add_1_OUT_lut_2_Q_111
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_cy_2_Q : MUXCY
    port map (
      CI => out_data_18_OBUF_56,
      DI => inreg(0),
      S => Madd_inreg_11_stage_4_18_add_1_OUT_lut_2_Q_111,
      O => Madd_inreg_11_stage_4_18_add_1_OUT_cy_2_Q_112
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_xor_2_Q : XORCY
    port map (
      CI => out_data_18_OBUF_56,
      LI => Madd_inreg_11_stage_4_18_add_1_OUT_lut_2_Q_111,
      O => inreg_11_stage_4_18_add_1_OUT_2_Q
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_lut_3_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_4(3),
      I1 => inreg(1),
      O => Madd_inreg_11_stage_4_18_add_1_OUT_lut_3_Q_113
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_cy_3_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_4_18_add_1_OUT_cy_2_Q_112,
      DI => inreg(1),
      S => Madd_inreg_11_stage_4_18_add_1_OUT_lut_3_Q_113,
      O => Madd_inreg_11_stage_4_18_add_1_OUT_cy_3_Q_114
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_xor_3_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_4_18_add_1_OUT_cy_2_Q_112,
      LI => Madd_inreg_11_stage_4_18_add_1_OUT_lut_3_Q_113,
      O => inreg_11_stage_4_18_add_1_OUT_3_Q
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_lut_4_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_4(4),
      I1 => inreg(2),
      O => Madd_inreg_11_stage_4_18_add_1_OUT_lut_4_Q_115
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_cy_4_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_4_18_add_1_OUT_cy_3_Q_114,
      DI => inreg(2),
      S => Madd_inreg_11_stage_4_18_add_1_OUT_lut_4_Q_115,
      O => Madd_inreg_11_stage_4_18_add_1_OUT_cy_4_Q_116
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_xor_4_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_4_18_add_1_OUT_cy_3_Q_114,
      LI => Madd_inreg_11_stage_4_18_add_1_OUT_lut_4_Q_115,
      O => inreg_11_stage_4_18_add_1_OUT_4_Q
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_lut_5_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_4(5),
      I1 => inreg(3),
      O => Madd_inreg_11_stage_4_18_add_1_OUT_lut_5_Q_117
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_cy_5_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_4_18_add_1_OUT_cy_4_Q_116,
      DI => inreg(3),
      S => Madd_inreg_11_stage_4_18_add_1_OUT_lut_5_Q_117,
      O => Madd_inreg_11_stage_4_18_add_1_OUT_cy_5_Q_118
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_xor_5_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_4_18_add_1_OUT_cy_4_Q_116,
      LI => Madd_inreg_11_stage_4_18_add_1_OUT_lut_5_Q_117,
      O => inreg_11_stage_4_18_add_1_OUT_5_Q
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_lut_6_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_4(6),
      I1 => inreg(4),
      O => Madd_inreg_11_stage_4_18_add_1_OUT_lut_6_Q_119
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_cy_6_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_4_18_add_1_OUT_cy_5_Q_118,
      DI => inreg(4),
      S => Madd_inreg_11_stage_4_18_add_1_OUT_lut_6_Q_119,
      O => Madd_inreg_11_stage_4_18_add_1_OUT_cy_6_Q_120
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_xor_6_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_4_18_add_1_OUT_cy_5_Q_118,
      LI => Madd_inreg_11_stage_4_18_add_1_OUT_lut_6_Q_119,
      O => inreg_11_stage_4_18_add_1_OUT_6_Q
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_lut_7_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_4(7),
      I1 => inreg(5),
      O => Madd_inreg_11_stage_4_18_add_1_OUT_lut_7_Q_121
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_cy_7_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_4_18_add_1_OUT_cy_6_Q_120,
      DI => inreg(5),
      S => Madd_inreg_11_stage_4_18_add_1_OUT_lut_7_Q_121,
      O => Madd_inreg_11_stage_4_18_add_1_OUT_cy_7_Q_122
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_xor_7_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_4_18_add_1_OUT_cy_6_Q_120,
      LI => Madd_inreg_11_stage_4_18_add_1_OUT_lut_7_Q_121,
      O => inreg_11_stage_4_18_add_1_OUT_7_Q
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_lut_8_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_4(8),
      I1 => inreg(6),
      O => Madd_inreg_11_stage_4_18_add_1_OUT_lut_8_Q_123
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_cy_8_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_4_18_add_1_OUT_cy_7_Q_122,
      DI => inreg(6),
      S => Madd_inreg_11_stage_4_18_add_1_OUT_lut_8_Q_123,
      O => Madd_inreg_11_stage_4_18_add_1_OUT_cy_8_Q_124
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_xor_8_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_4_18_add_1_OUT_cy_7_Q_122,
      LI => Madd_inreg_11_stage_4_18_add_1_OUT_lut_8_Q_123,
      O => inreg_11_stage_4_18_add_1_OUT_8_Q
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_cy_9_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_4_18_add_1_OUT_cy_8_Q_124,
      DI => out_data_18_OBUF_56,
      S => Madd_inreg_11_stage_4_18_add_1_OUT_cy_9_rt_209,
      O => Madd_inreg_11_stage_4_18_add_1_OUT_cy_9_Q_125
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_xor_9_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_4_18_add_1_OUT_cy_8_Q_124,
      LI => Madd_inreg_11_stage_4_18_add_1_OUT_cy_9_rt_209,
      O => inreg_11_stage_4_18_add_1_OUT_9_Q
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_lut_3_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_3(3),
      I1 => inreg(0),
      O => Madd_inreg_11_stage_3_18_add_2_OUT_lut_3_Q_126
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_cy_3_Q : MUXCY
    port map (
      CI => out_data_18_OBUF_56,
      DI => inreg(0),
      S => Madd_inreg_11_stage_3_18_add_2_OUT_lut_3_Q_126,
      O => Madd_inreg_11_stage_3_18_add_2_OUT_cy_3_Q_127
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_xor_3_Q : XORCY
    port map (
      CI => out_data_18_OBUF_56,
      LI => Madd_inreg_11_stage_3_18_add_2_OUT_lut_3_Q_126,
      O => inreg_11_stage_3_18_add_2_OUT_3_Q
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_lut_4_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_3(4),
      I1 => inreg(1),
      O => Madd_inreg_11_stage_3_18_add_2_OUT_lut_4_Q_128
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_cy_4_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_3_18_add_2_OUT_cy_3_Q_127,
      DI => inreg(1),
      S => Madd_inreg_11_stage_3_18_add_2_OUT_lut_4_Q_128,
      O => Madd_inreg_11_stage_3_18_add_2_OUT_cy_4_Q_129
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_xor_4_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_3_18_add_2_OUT_cy_3_Q_127,
      LI => Madd_inreg_11_stage_3_18_add_2_OUT_lut_4_Q_128,
      O => inreg_11_stage_3_18_add_2_OUT_4_Q
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_lut_5_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_3(5),
      I1 => inreg(2),
      O => Madd_inreg_11_stage_3_18_add_2_OUT_lut_5_Q_130
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_cy_5_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_3_18_add_2_OUT_cy_4_Q_129,
      DI => inreg(2),
      S => Madd_inreg_11_stage_3_18_add_2_OUT_lut_5_Q_130,
      O => Madd_inreg_11_stage_3_18_add_2_OUT_cy_5_Q_131
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_xor_5_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_3_18_add_2_OUT_cy_4_Q_129,
      LI => Madd_inreg_11_stage_3_18_add_2_OUT_lut_5_Q_130,
      O => inreg_11_stage_3_18_add_2_OUT_5_Q
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_lut_6_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_3(6),
      I1 => inreg(3),
      O => Madd_inreg_11_stage_3_18_add_2_OUT_lut_6_Q_132
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_cy_6_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_3_18_add_2_OUT_cy_5_Q_131,
      DI => inreg(3),
      S => Madd_inreg_11_stage_3_18_add_2_OUT_lut_6_Q_132,
      O => Madd_inreg_11_stage_3_18_add_2_OUT_cy_6_Q_133
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_xor_6_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_3_18_add_2_OUT_cy_5_Q_131,
      LI => Madd_inreg_11_stage_3_18_add_2_OUT_lut_6_Q_132,
      O => inreg_11_stage_3_18_add_2_OUT_6_Q
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_lut_7_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_3(7),
      I1 => inreg(4),
      O => Madd_inreg_11_stage_3_18_add_2_OUT_lut_7_Q_134
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_cy_7_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_3_18_add_2_OUT_cy_6_Q_133,
      DI => inreg(4),
      S => Madd_inreg_11_stage_3_18_add_2_OUT_lut_7_Q_134,
      O => Madd_inreg_11_stage_3_18_add_2_OUT_cy_7_Q_135
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_xor_7_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_3_18_add_2_OUT_cy_6_Q_133,
      LI => Madd_inreg_11_stage_3_18_add_2_OUT_lut_7_Q_134,
      O => inreg_11_stage_3_18_add_2_OUT_7_Q
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_lut_8_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_3(8),
      I1 => inreg(5),
      O => Madd_inreg_11_stage_3_18_add_2_OUT_lut_8_Q_136
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_cy_8_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_3_18_add_2_OUT_cy_7_Q_135,
      DI => inreg(5),
      S => Madd_inreg_11_stage_3_18_add_2_OUT_lut_8_Q_136,
      O => Madd_inreg_11_stage_3_18_add_2_OUT_cy_8_Q_137
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_xor_8_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_3_18_add_2_OUT_cy_7_Q_135,
      LI => Madd_inreg_11_stage_3_18_add_2_OUT_lut_8_Q_136,
      O => inreg_11_stage_3_18_add_2_OUT_8_Q
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_lut_9_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_3(9),
      I1 => inreg(6),
      O => Madd_inreg_11_stage_3_18_add_2_OUT_lut_9_Q_138
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_cy_9_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_3_18_add_2_OUT_cy_8_Q_137,
      DI => inreg(6),
      S => Madd_inreg_11_stage_3_18_add_2_OUT_lut_9_Q_138,
      O => Madd_inreg_11_stage_3_18_add_2_OUT_cy_9_Q_139
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_xor_9_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_3_18_add_2_OUT_cy_8_Q_137,
      LI => Madd_inreg_11_stage_3_18_add_2_OUT_lut_9_Q_138,
      O => inreg_11_stage_3_18_add_2_OUT_9_Q
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_lut_10_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_3(10),
      I1 => inreg(7),
      O => Madd_inreg_11_stage_3_18_add_2_OUT_lut_10_Q_140
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_cy_10_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_3_18_add_2_OUT_cy_9_Q_139,
      DI => inreg(7),
      S => Madd_inreg_11_stage_3_18_add_2_OUT_lut_10_Q_140,
      O => Madd_inreg_11_stage_3_18_add_2_OUT_cy_10_Q_141
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_xor_10_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_3_18_add_2_OUT_cy_9_Q_139,
      LI => Madd_inreg_11_stage_3_18_add_2_OUT_lut_10_Q_140,
      O => inreg_11_stage_3_18_add_2_OUT_10_Q
    );
  Madd_inreg_11_stage_3_18_add_2_OUT_xor_11_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_3_18_add_2_OUT_cy_10_Q_141,
      LI => out_data_18_OBUF_56,
      O => inreg_11_stage_3_18_add_2_OUT_11_Q
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_lut_2_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_2(2),
      I1 => inreg(0),
      O => Madd_inreg_11_stage_2_18_add_3_OUT_lut_2_Q_142
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_cy_2_Q : MUXCY
    port map (
      CI => out_data_18_OBUF_56,
      DI => inreg(0),
      S => Madd_inreg_11_stage_2_18_add_3_OUT_lut_2_Q_142,
      O => Madd_inreg_11_stage_2_18_add_3_OUT_cy_2_Q_143
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_xor_2_Q : XORCY
    port map (
      CI => out_data_18_OBUF_56,
      LI => Madd_inreg_11_stage_2_18_add_3_OUT_lut_2_Q_142,
      O => inreg_11_stage_2_18_add_3_OUT_2_Q
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_lut_3_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_2(3),
      I1 => inreg(1),
      O => Madd_inreg_11_stage_2_18_add_3_OUT_lut_3_Q_144
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_cy_3_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_2_Q_143,
      DI => inreg(1),
      S => Madd_inreg_11_stage_2_18_add_3_OUT_lut_3_Q_144,
      O => Madd_inreg_11_stage_2_18_add_3_OUT_cy_3_Q_145
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_xor_3_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_2_Q_143,
      LI => Madd_inreg_11_stage_2_18_add_3_OUT_lut_3_Q_144,
      O => inreg_11_stage_2_18_add_3_OUT_3_Q
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_lut_4_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_2(4),
      I1 => inreg(2),
      O => Madd_inreg_11_stage_2_18_add_3_OUT_lut_4_Q_146
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_cy_4_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_3_Q_145,
      DI => inreg(2),
      S => Madd_inreg_11_stage_2_18_add_3_OUT_lut_4_Q_146,
      O => Madd_inreg_11_stage_2_18_add_3_OUT_cy_4_Q_147
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_xor_4_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_3_Q_145,
      LI => Madd_inreg_11_stage_2_18_add_3_OUT_lut_4_Q_146,
      O => inreg_11_stage_2_18_add_3_OUT_4_Q
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_lut_5_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_2(5),
      I1 => inreg(3),
      O => Madd_inreg_11_stage_2_18_add_3_OUT_lut_5_Q_148
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_cy_5_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_4_Q_147,
      DI => inreg(3),
      S => Madd_inreg_11_stage_2_18_add_3_OUT_lut_5_Q_148,
      O => Madd_inreg_11_stage_2_18_add_3_OUT_cy_5_Q_149
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_xor_5_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_4_Q_147,
      LI => Madd_inreg_11_stage_2_18_add_3_OUT_lut_5_Q_148,
      O => inreg_11_stage_2_18_add_3_OUT_5_Q
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_lut_6_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_2(6),
      I1 => inreg(4),
      O => Madd_inreg_11_stage_2_18_add_3_OUT_lut_6_Q_150
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_cy_6_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_5_Q_149,
      DI => inreg(4),
      S => Madd_inreg_11_stage_2_18_add_3_OUT_lut_6_Q_150,
      O => Madd_inreg_11_stage_2_18_add_3_OUT_cy_6_Q_151
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_xor_6_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_5_Q_149,
      LI => Madd_inreg_11_stage_2_18_add_3_OUT_lut_6_Q_150,
      O => inreg_11_stage_2_18_add_3_OUT_6_Q
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_lut_7_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_2(7),
      I1 => inreg(5),
      O => Madd_inreg_11_stage_2_18_add_3_OUT_lut_7_Q_152
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_cy_7_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_6_Q_151,
      DI => inreg(5),
      S => Madd_inreg_11_stage_2_18_add_3_OUT_lut_7_Q_152,
      O => Madd_inreg_11_stage_2_18_add_3_OUT_cy_7_Q_153
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_xor_7_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_6_Q_151,
      LI => Madd_inreg_11_stage_2_18_add_3_OUT_lut_7_Q_152,
      O => inreg_11_stage_2_18_add_3_OUT_7_Q
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_lut_8_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_2(8),
      I1 => inreg(6),
      O => Madd_inreg_11_stage_2_18_add_3_OUT_lut_8_Q_154
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_cy_8_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_7_Q_153,
      DI => inreg(6),
      S => Madd_inreg_11_stage_2_18_add_3_OUT_lut_8_Q_154,
      O => Madd_inreg_11_stage_2_18_add_3_OUT_cy_8_Q_155
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_xor_8_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_7_Q_153,
      LI => Madd_inreg_11_stage_2_18_add_3_OUT_lut_8_Q_154,
      O => inreg_11_stage_2_18_add_3_OUT_8_Q
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_lut_9_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_2(9),
      I1 => inreg(7),
      O => Madd_inreg_11_stage_2_18_add_3_OUT_lut_9_Q_156
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_cy_9_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_8_Q_155,
      DI => inreg(7),
      S => Madd_inreg_11_stage_2_18_add_3_OUT_lut_9_Q_156,
      O => Madd_inreg_11_stage_2_18_add_3_OUT_cy_9_Q_157
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_xor_9_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_8_Q_155,
      LI => Madd_inreg_11_stage_2_18_add_3_OUT_lut_9_Q_156,
      O => inreg_11_stage_2_18_add_3_OUT_9_Q
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_cy_10_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_9_Q_157,
      DI => out_data_18_OBUF_56,
      S => Madd_inreg_11_stage_2_18_add_3_OUT_cy_10_rt_210,
      O => Madd_inreg_11_stage_2_18_add_3_OUT_cy_10_Q_158
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_xor_10_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_9_Q_157,
      LI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_10_rt_210,
      O => inreg_11_stage_2_18_add_3_OUT_10_Q
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_cy_11_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_10_Q_158,
      DI => out_data_18_OBUF_56,
      S => Madd_inreg_11_stage_2_18_add_3_OUT_cy_11_rt_211,
      O => Madd_inreg_11_stage_2_18_add_3_OUT_cy_11_Q_159
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_xor_11_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_10_Q_158,
      LI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_11_rt_211,
      O => inreg_11_stage_2_18_add_3_OUT_11_Q
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_xor_12_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_2_18_add_3_OUT_cy_11_Q_159,
      LI => out_data_18_OBUF_56,
      O => inreg_11_stage_2_18_add_3_OUT_12_Q
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_lut_1_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_1(1),
      I1 => inreg(0),
      O => Madd_inreg_11_stage_1_18_add_4_OUT_lut_1_Q_160
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_cy_1_Q : MUXCY
    port map (
      CI => out_data_18_OBUF_56,
      DI => inreg(0),
      S => Madd_inreg_11_stage_1_18_add_4_OUT_lut_1_Q_160,
      O => Madd_inreg_11_stage_1_18_add_4_OUT_cy_1_Q_161
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_xor_1_Q : XORCY
    port map (
      CI => out_data_18_OBUF_56,
      LI => Madd_inreg_11_stage_1_18_add_4_OUT_lut_1_Q_160,
      O => inreg_11_stage_1_18_add_4_OUT_1_Q
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_lut_2_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_1(2),
      I1 => inreg(1),
      O => Madd_inreg_11_stage_1_18_add_4_OUT_lut_2_Q_162
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_cy_2_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_1_Q_161,
      DI => inreg(1),
      S => Madd_inreg_11_stage_1_18_add_4_OUT_lut_2_Q_162,
      O => Madd_inreg_11_stage_1_18_add_4_OUT_cy_2_Q_163
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_xor_2_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_1_Q_161,
      LI => Madd_inreg_11_stage_1_18_add_4_OUT_lut_2_Q_162,
      O => inreg_11_stage_1_18_add_4_OUT_2_Q
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_lut_3_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_1(3),
      I1 => inreg(2),
      O => Madd_inreg_11_stage_1_18_add_4_OUT_lut_3_Q_164
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_cy_3_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_2_Q_163,
      DI => inreg(2),
      S => Madd_inreg_11_stage_1_18_add_4_OUT_lut_3_Q_164,
      O => Madd_inreg_11_stage_1_18_add_4_OUT_cy_3_Q_165
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_xor_3_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_2_Q_163,
      LI => Madd_inreg_11_stage_1_18_add_4_OUT_lut_3_Q_164,
      O => inreg_11_stage_1_18_add_4_OUT_3_Q
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_lut_4_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_1(4),
      I1 => inreg(3),
      O => Madd_inreg_11_stage_1_18_add_4_OUT_lut_4_Q_166
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_cy_4_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_3_Q_165,
      DI => inreg(3),
      S => Madd_inreg_11_stage_1_18_add_4_OUT_lut_4_Q_166,
      O => Madd_inreg_11_stage_1_18_add_4_OUT_cy_4_Q_167
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_xor_4_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_3_Q_165,
      LI => Madd_inreg_11_stage_1_18_add_4_OUT_lut_4_Q_166,
      O => inreg_11_stage_1_18_add_4_OUT_4_Q
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_lut_5_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_1(5),
      I1 => inreg(4),
      O => Madd_inreg_11_stage_1_18_add_4_OUT_lut_5_Q_168
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_cy_5_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_4_Q_167,
      DI => inreg(4),
      S => Madd_inreg_11_stage_1_18_add_4_OUT_lut_5_Q_168,
      O => Madd_inreg_11_stage_1_18_add_4_OUT_cy_5_Q_169
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_xor_5_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_4_Q_167,
      LI => Madd_inreg_11_stage_1_18_add_4_OUT_lut_5_Q_168,
      O => inreg_11_stage_1_18_add_4_OUT_5_Q
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_lut_6_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_1(6),
      I1 => inreg(5),
      O => Madd_inreg_11_stage_1_18_add_4_OUT_lut_6_Q_170
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_cy_6_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_5_Q_169,
      DI => inreg(5),
      S => Madd_inreg_11_stage_1_18_add_4_OUT_lut_6_Q_170,
      O => Madd_inreg_11_stage_1_18_add_4_OUT_cy_6_Q_171
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_xor_6_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_5_Q_169,
      LI => Madd_inreg_11_stage_1_18_add_4_OUT_lut_6_Q_170,
      O => inreg_11_stage_1_18_add_4_OUT_6_Q
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_lut_7_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_1(7),
      I1 => inreg(6),
      O => Madd_inreg_11_stage_1_18_add_4_OUT_lut_7_Q_172
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_cy_7_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_6_Q_171,
      DI => inreg(6),
      S => Madd_inreg_11_stage_1_18_add_4_OUT_lut_7_Q_172,
      O => Madd_inreg_11_stage_1_18_add_4_OUT_cy_7_Q_173
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_xor_7_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_6_Q_171,
      LI => Madd_inreg_11_stage_1_18_add_4_OUT_lut_7_Q_172,
      O => inreg_11_stage_1_18_add_4_OUT_7_Q
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_lut_8_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => stage_1(8),
      I1 => inreg(7),
      O => Madd_inreg_11_stage_1_18_add_4_OUT_lut_8_Q_174
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_cy_8_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_7_Q_173,
      DI => inreg(7),
      S => Madd_inreg_11_stage_1_18_add_4_OUT_lut_8_Q_174,
      O => Madd_inreg_11_stage_1_18_add_4_OUT_cy_8_Q_175
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_xor_8_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_7_Q_173,
      LI => Madd_inreg_11_stage_1_18_add_4_OUT_lut_8_Q_174,
      O => inreg_11_stage_1_18_add_4_OUT_8_Q
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_cy_9_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_8_Q_175,
      DI => out_data_18_OBUF_56,
      S => Madd_inreg_11_stage_1_18_add_4_OUT_cy_9_rt_212,
      O => Madd_inreg_11_stage_1_18_add_4_OUT_cy_9_Q_176
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_xor_9_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_8_Q_175,
      LI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_9_rt_212,
      O => inreg_11_stage_1_18_add_4_OUT_9_Q
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_cy_10_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_9_Q_176,
      DI => out_data_18_OBUF_56,
      S => Madd_inreg_11_stage_1_18_add_4_OUT_cy_10_rt_213,
      O => Madd_inreg_11_stage_1_18_add_4_OUT_cy_10_Q_177
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_xor_10_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_9_Q_176,
      LI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_10_rt_213,
      O => inreg_11_stage_1_18_add_4_OUT_10_Q
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_cy_11_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_10_Q_177,
      DI => out_data_18_OBUF_56,
      S => Madd_inreg_11_stage_1_18_add_4_OUT_cy_11_rt_214,
      O => Madd_inreg_11_stage_1_18_add_4_OUT_cy_11_Q_178
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_xor_11_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_10_Q_177,
      LI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_11_rt_214,
      O => inreg_11_stage_1_18_add_4_OUT_11_Q
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_cy_12_Q : MUXCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_11_Q_178,
      DI => out_data_18_OBUF_56,
      S => Madd_inreg_11_stage_1_18_add_4_OUT_cy_12_rt_215,
      O => Madd_inreg_11_stage_1_18_add_4_OUT_cy_12_Q_179
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_xor_12_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_11_Q_178,
      LI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_12_rt_215,
      O => inreg_11_stage_1_18_add_4_OUT_12_Q
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_xor_13_Q : XORCY
    port map (
      CI => Madd_inreg_11_stage_1_18_add_4_OUT_cy_12_Q_179,
      LI => out_data_18_OBUF_56,
      O => inreg_11_stage_1_18_add_4_OUT_13_Q
    );
  din_7_IBUF : IBUF
    port map (
      I => din(7),
      O => din_7_IBUF_0
    );
  din_6_IBUF : IBUF
    port map (
      I => din(6),
      O => din_6_IBUF_1
    );
  din_5_IBUF : IBUF
    port map (
      I => din(5),
      O => din_5_IBUF_2
    );
  din_4_IBUF : IBUF
    port map (
      I => din(4),
      O => din_4_IBUF_3
    );
  din_3_IBUF : IBUF
    port map (
      I => din(3),
      O => din_3_IBUF_4
    );
  din_2_IBUF : IBUF
    port map (
      I => din(2),
      O => din_2_IBUF_5
    );
  din_1_IBUF : IBUF
    port map (
      I => din(1),
      O => din_1_IBUF_6
    );
  din_0_IBUF : IBUF
    port map (
      I => din(0),
      O => din_0_IBUF_7
    );
  ce_1_IBUF : IBUF
    port map (
      I => ce_1,
      O => ce_1_IBUF_8
    );
  out_data_18_OBUF : OBUF
    port map (
      I => out_data_18_OBUF_56,
      O => out_data(18)
    );
  out_data_17_OBUF : OBUF
    port map (
      I => out_data_18_OBUF_56,
      O => out_data(17)
    );
  out_data_16_OBUF : OBUF
    port map (
      I => out_data_18_OBUF_56,
      O => out_data(16)
    );
  out_data_15_OBUF : OBUF
    port map (
      I => out_data_18_OBUF_56,
      O => out_data(15)
    );
  out_data_14_OBUF : OBUF
    port map (
      I => out_data_18_OBUF_56,
      O => out_data(14)
    );
  out_data_13_OBUF : OBUF
    port map (
      I => stage_0(13),
      O => out_data(13)
    );
  out_data_12_OBUF : OBUF
    port map (
      I => stage_0(12),
      O => out_data(12)
    );
  out_data_11_OBUF : OBUF
    port map (
      I => stage_0(11),
      O => out_data(11)
    );
  out_data_10_OBUF : OBUF
    port map (
      I => stage_0(10),
      O => out_data(10)
    );
  out_data_9_OBUF : OBUF
    port map (
      I => stage_0(9),
      O => out_data(9)
    );
  out_data_8_OBUF : OBUF
    port map (
      I => stage_0(8),
      O => out_data(8)
    );
  out_data_7_OBUF : OBUF
    port map (
      I => stage_0(7),
      O => out_data(7)
    );
  out_data_6_OBUF : OBUF
    port map (
      I => stage_0(6),
      O => out_data(6)
    );
  out_data_5_OBUF : OBUF
    port map (
      I => stage_0(5),
      O => out_data(5)
    );
  out_data_4_OBUF : OBUF
    port map (
      I => stage_0(4),
      O => out_data(4)
    );
  out_data_3_OBUF : OBUF
    port map (
      I => stage_0(3),
      O => out_data(3)
    );
  out_data_2_OBUF : OBUF
    port map (
      I => stage_0(2),
      O => out_data(2)
    );
  out_data_1_OBUF : OBUF
    port map (
      I => stage_0(1),
      O => out_data(1)
    );
  out_data_0_OBUF : OBUF
    port map (
      I => out_data_18_OBUF_56,
      O => out_data(0)
    );
  Madd_inreg_11_stage_4_18_add_1_OUT_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => inreg(7),
      O => Madd_inreg_11_stage_4_18_add_1_OUT_cy_9_rt_209
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => stage_2(10),
      O => Madd_inreg_11_stage_2_18_add_3_OUT_cy_10_rt_210
    );
  Madd_inreg_11_stage_2_18_add_3_OUT_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => stage_2(11),
      O => Madd_inreg_11_stage_2_18_add_3_OUT_cy_11_rt_211
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => stage_1(9),
      O => Madd_inreg_11_stage_1_18_add_4_OUT_cy_9_rt_212
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => stage_1(10),
      O => Madd_inreg_11_stage_1_18_add_4_OUT_cy_10_rt_213
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => stage_1(11),
      O => Madd_inreg_11_stage_1_18_add_4_OUT_cy_11_rt_214
    );
  Madd_inreg_11_stage_1_18_add_4_OUT_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => stage_1(12),
      O => Madd_inreg_11_stage_1_18_add_4_OUT_cy_12_rt_215
    );
  clk_1_BUFGP : BUFGP
    port map (
      I => clk_1,
      O => clk_1_BUFGP_9
    );
  XST_VCC : VCC
    port map (
      P => N6
    );
  Mshreg_inreg_2 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => out_data_18_OBUF_56,
      A1 => out_data_18_OBUF_56,
      A2 => out_data_18_OBUF_56,
      A3 => N6,
      CE => ce_1_IBUF_8,
      CLK => clk_1_BUFGP_9,
      D => din_2_IBUF_5,
      Q => Mshreg_inreg_2_217,
      Q15 => NLW_Mshreg_inreg_2_Q15_UNCONNECTED
    );
  inreg_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => Mshreg_inreg_2_217,
      Q => inreg(2)
    );
  Mshreg_inreg_0 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => out_data_18_OBUF_56,
      A1 => out_data_18_OBUF_56,
      A2 => out_data_18_OBUF_56,
      A3 => N6,
      CE => ce_1_IBUF_8,
      CLK => clk_1_BUFGP_9,
      D => din_0_IBUF_7,
      Q => Mshreg_inreg_0_218,
      Q15 => NLW_Mshreg_inreg_0_Q15_UNCONNECTED
    );
  inreg_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => Mshreg_inreg_0_218,
      Q => inreg(0)
    );
  Mshreg_inreg_1 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => out_data_18_OBUF_56,
      A1 => out_data_18_OBUF_56,
      A2 => out_data_18_OBUF_56,
      A3 => N6,
      CE => ce_1_IBUF_8,
      CLK => clk_1_BUFGP_9,
      D => din_1_IBUF_6,
      Q => Mshreg_inreg_1_219,
      Q15 => NLW_Mshreg_inreg_1_Q15_UNCONNECTED
    );
  inreg_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => Mshreg_inreg_1_219,
      Q => inreg(1)
    );
  Mshreg_inreg_3 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => out_data_18_OBUF_56,
      A1 => out_data_18_OBUF_56,
      A2 => out_data_18_OBUF_56,
      A3 => N6,
      CE => ce_1_IBUF_8,
      CLK => clk_1_BUFGP_9,
      D => din_3_IBUF_4,
      Q => Mshreg_inreg_3_220,
      Q15 => NLW_Mshreg_inreg_3_Q15_UNCONNECTED
    );
  inreg_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => Mshreg_inreg_3_220,
      Q => inreg(3)
    );
  Mshreg_inreg_4 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => out_data_18_OBUF_56,
      A1 => out_data_18_OBUF_56,
      A2 => out_data_18_OBUF_56,
      A3 => N6,
      CE => ce_1_IBUF_8,
      CLK => clk_1_BUFGP_9,
      D => din_4_IBUF_3,
      Q => Mshreg_inreg_4_221,
      Q15 => NLW_Mshreg_inreg_4_Q15_UNCONNECTED
    );
  inreg_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => Mshreg_inreg_4_221,
      Q => inreg(4)
    );
  Mshreg_inreg_5 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => out_data_18_OBUF_56,
      A1 => out_data_18_OBUF_56,
      A2 => out_data_18_OBUF_56,
      A3 => N6,
      CE => ce_1_IBUF_8,
      CLK => clk_1_BUFGP_9,
      D => din_5_IBUF_2,
      Q => Mshreg_inreg_5_222,
      Q15 => NLW_Mshreg_inreg_5_Q15_UNCONNECTED
    );
  inreg_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => Mshreg_inreg_5_222,
      Q => inreg(5)
    );
  Mshreg_inreg_6 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => out_data_18_OBUF_56,
      A1 => out_data_18_OBUF_56,
      A2 => out_data_18_OBUF_56,
      A3 => N6,
      CE => ce_1_IBUF_8,
      CLK => clk_1_BUFGP_9,
      D => din_6_IBUF_1,
      Q => Mshreg_inreg_6_223,
      Q15 => NLW_Mshreg_inreg_6_Q15_UNCONNECTED
    );
  inreg_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => Mshreg_inreg_6_223,
      Q => inreg(6)
    );
  Mshreg_inreg_7 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => out_data_18_OBUF_56,
      A1 => out_data_18_OBUF_56,
      A2 => out_data_18_OBUF_56,
      A3 => N6,
      CE => ce_1_IBUF_8,
      CLK => clk_1_BUFGP_9,
      D => din_7_IBUF_0,
      Q => Mshreg_inreg_7_224,
      Q15 => NLW_Mshreg_inreg_7_Q15_UNCONNECTED
    );
  inreg_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => Mshreg_inreg_7_224,
      Q => inreg(7)
    );
  Mshreg_stage_1_1 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => out_data_18_OBUF_56,
      A1 => N6,
      A2 => out_data_18_OBUF_56,
      A3 => out_data_18_OBUF_56,
      CE => ce_1_IBUF_8,
      CLK => clk_1_BUFGP_9,
      D => inreg(0),
      Q => Mshreg_stage_1_1_225,
      Q15 => NLW_Mshreg_stage_1_1_Q15_UNCONNECTED
    );
  stage_1_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_1_BUFGP_9,
      CE => ce_1_IBUF_8,
      D => Mshreg_stage_1_1_225,
      Q => stage_1(1)
    );

end Structure;

