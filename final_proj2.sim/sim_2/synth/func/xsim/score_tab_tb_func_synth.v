// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Mon Dec  1 19:41:58 2025
// Host        : lillys_rog running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/lilly/.Xilinx/projects/152a_final_v2/final_proj_152a_3/final_proj2.sim/sim_2/synth/func/xsim/score_tab_tb_func_synth.v
// Design      : top_module
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module clock
   (clk_en_100hz,
    CLK);
  output clk_en_100hz;
  input CLK;

  wire CLK;
  wire clk_en_100hz;
  wire [19:0]div_hundred;
  wire div_hundred0_carry__0_n_0;
  wire div_hundred0_carry__0_n_1;
  wire div_hundred0_carry__0_n_2;
  wire div_hundred0_carry__0_n_3;
  wire div_hundred0_carry__0_n_4;
  wire div_hundred0_carry__0_n_5;
  wire div_hundred0_carry__0_n_6;
  wire div_hundred0_carry__0_n_7;
  wire div_hundred0_carry__1_n_0;
  wire div_hundred0_carry__1_n_1;
  wire div_hundred0_carry__1_n_2;
  wire div_hundred0_carry__1_n_3;
  wire div_hundred0_carry__1_n_4;
  wire div_hundred0_carry__1_n_5;
  wire div_hundred0_carry__1_n_6;
  wire div_hundred0_carry__1_n_7;
  wire div_hundred0_carry__2_n_0;
  wire div_hundred0_carry__2_n_1;
  wire div_hundred0_carry__2_n_2;
  wire div_hundred0_carry__2_n_3;
  wire div_hundred0_carry__2_n_4;
  wire div_hundred0_carry__2_n_5;
  wire div_hundred0_carry__2_n_6;
  wire div_hundred0_carry__2_n_7;
  wire div_hundred0_carry__3_n_2;
  wire div_hundred0_carry__3_n_3;
  wire div_hundred0_carry__3_n_5;
  wire div_hundred0_carry__3_n_6;
  wire div_hundred0_carry__3_n_7;
  wire div_hundred0_carry_n_0;
  wire div_hundred0_carry_n_1;
  wire div_hundred0_carry_n_2;
  wire div_hundred0_carry_n_3;
  wire div_hundred0_carry_n_4;
  wire div_hundred0_carry_n_5;
  wire div_hundred0_carry_n_6;
  wire div_hundred0_carry_n_7;
  wire \div_hundred[0]_i_1_n_0 ;
  wire \div_hundred[19]_i_1_n_0 ;
  wire \div_hundred[19]_i_2_n_0 ;
  wire \div_hundred[19]_i_3_n_0 ;
  wire \div_hundred[19]_i_4_n_0 ;
  wire [3:2]NLW_div_hundred0_carry__3_CO_UNCONNECTED;
  wire [3:3]NLW_div_hundred0_carry__3_O_UNCONNECTED;

  FDRE #(
    .INIT(1'b0)) 
    display_reg
       (.C(CLK),
        .CE(1'b1),
        .D(\div_hundred[19]_i_1_n_0 ),
        .Q(clk_en_100hz),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 div_hundred0_carry
       (.CI(1'b0),
        .CO({div_hundred0_carry_n_0,div_hundred0_carry_n_1,div_hundred0_carry_n_2,div_hundred0_carry_n_3}),
        .CYINIT(div_hundred[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({div_hundred0_carry_n_4,div_hundred0_carry_n_5,div_hundred0_carry_n_6,div_hundred0_carry_n_7}),
        .S(div_hundred[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 div_hundred0_carry__0
       (.CI(div_hundred0_carry_n_0),
        .CO({div_hundred0_carry__0_n_0,div_hundred0_carry__0_n_1,div_hundred0_carry__0_n_2,div_hundred0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({div_hundred0_carry__0_n_4,div_hundred0_carry__0_n_5,div_hundred0_carry__0_n_6,div_hundred0_carry__0_n_7}),
        .S(div_hundred[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 div_hundred0_carry__1
       (.CI(div_hundred0_carry__0_n_0),
        .CO({div_hundred0_carry__1_n_0,div_hundred0_carry__1_n_1,div_hundred0_carry__1_n_2,div_hundred0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({div_hundred0_carry__1_n_4,div_hundred0_carry__1_n_5,div_hundred0_carry__1_n_6,div_hundred0_carry__1_n_7}),
        .S(div_hundred[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 div_hundred0_carry__2
       (.CI(div_hundred0_carry__1_n_0),
        .CO({div_hundred0_carry__2_n_0,div_hundred0_carry__2_n_1,div_hundred0_carry__2_n_2,div_hundred0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({div_hundred0_carry__2_n_4,div_hundred0_carry__2_n_5,div_hundred0_carry__2_n_6,div_hundred0_carry__2_n_7}),
        .S(div_hundred[16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 div_hundred0_carry__3
       (.CI(div_hundred0_carry__2_n_0),
        .CO({NLW_div_hundred0_carry__3_CO_UNCONNECTED[3:2],div_hundred0_carry__3_n_2,div_hundred0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_div_hundred0_carry__3_O_UNCONNECTED[3],div_hundred0_carry__3_n_5,div_hundred0_carry__3_n_6,div_hundred0_carry__3_n_7}),
        .S({1'b0,div_hundred[19:17]}));
  LUT1 #(
    .INIT(2'h1)) 
    \div_hundred[0]_i_1 
       (.I0(div_hundred[0]),
        .O(\div_hundred[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \div_hundred[19]_i_1 
       (.I0(\div_hundred[19]_i_2_n_0 ),
        .I1(\div_hundred[19]_i_3_n_0 ),
        .I2(\div_hundred[19]_i_4_n_0 ),
        .I3(div_hundred[0]),
        .I4(div_hundred[1]),
        .O(\div_hundred[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000008000000000)) 
    \div_hundred[19]_i_2 
       (.I0(div_hundred[16]),
        .I1(div_hundred[17]),
        .I2(div_hundred[15]),
        .I3(div_hundred[14]),
        .I4(div_hundred[19]),
        .I5(div_hundred[18]),
        .O(\div_hundred[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000002000)) 
    \div_hundred[19]_i_3 
       (.I0(div_hundred[4]),
        .I1(div_hundred[5]),
        .I2(div_hundred[2]),
        .I3(div_hundred[3]),
        .I4(div_hundred[7]),
        .I5(div_hundred[6]),
        .O(\div_hundred[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000001000000000)) 
    \div_hundred[19]_i_4 
       (.I0(div_hundred[10]),
        .I1(div_hundred[11]),
        .I2(div_hundred[8]),
        .I3(div_hundred[9]),
        .I4(div_hundred[12]),
        .I5(div_hundred[13]),
        .O(\div_hundred[19]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \div_hundred_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\div_hundred[0]_i_1_n_0 ),
        .Q(div_hundred[0]),
        .R(\div_hundred[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \div_hundred_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .D(div_hundred0_carry__1_n_6),
        .Q(div_hundred[10]),
        .R(\div_hundred[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \div_hundred_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .D(div_hundred0_carry__1_n_5),
        .Q(div_hundred[11]),
        .R(\div_hundred[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \div_hundred_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .D(div_hundred0_carry__1_n_4),
        .Q(div_hundred[12]),
        .R(\div_hundred[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \div_hundred_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .D(div_hundred0_carry__2_n_7),
        .Q(div_hundred[13]),
        .R(\div_hundred[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \div_hundred_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .D(div_hundred0_carry__2_n_6),
        .Q(div_hundred[14]),
        .R(\div_hundred[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \div_hundred_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .D(div_hundred0_carry__2_n_5),
        .Q(div_hundred[15]),
        .R(\div_hundred[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \div_hundred_reg[16] 
       (.C(CLK),
        .CE(1'b1),
        .D(div_hundred0_carry__2_n_4),
        .Q(div_hundred[16]),
        .R(\div_hundred[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \div_hundred_reg[17] 
       (.C(CLK),
        .CE(1'b1),
        .D(div_hundred0_carry__3_n_7),
        .Q(div_hundred[17]),
        .R(\div_hundred[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \div_hundred_reg[18] 
       (.C(CLK),
        .CE(1'b1),
        .D(div_hundred0_carry__3_n_6),
        .Q(div_hundred[18]),
        .R(\div_hundred[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \div_hundred_reg[19] 
       (.C(CLK),
        .CE(1'b1),
        .D(div_hundred0_carry__3_n_5),
        .Q(div_hundred[19]),
        .R(\div_hundred[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \div_hundred_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(div_hundred0_carry_n_7),
        .Q(div_hundred[1]),
        .R(\div_hundred[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \div_hundred_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(div_hundred0_carry_n_6),
        .Q(div_hundred[2]),
        .R(\div_hundred[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \div_hundred_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(div_hundred0_carry_n_5),
        .Q(div_hundred[3]),
        .R(\div_hundred[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \div_hundred_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(div_hundred0_carry_n_4),
        .Q(div_hundred[4]),
        .R(\div_hundred[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \div_hundred_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(div_hundred0_carry__0_n_7),
        .Q(div_hundred[5]),
        .R(\div_hundred[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \div_hundred_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(div_hundred0_carry__0_n_6),
        .Q(div_hundred[6]),
        .R(\div_hundred[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \div_hundred_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .D(div_hundred0_carry__0_n_5),
        .Q(div_hundred[7]),
        .R(\div_hundred[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \div_hundred_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .D(div_hundred0_carry__0_n_4),
        .Q(div_hundred[8]),
        .R(\div_hundred[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \div_hundred_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .D(div_hundred0_carry__1_n_7),
        .Q(div_hundred[9]),
        .R(\div_hundred[19]_i_1_n_0 ));
endmodule

module display
   (an_OBUF,
    clk_en_100hz,
    rst,
    CLK);
  output [3:0]an_OBUF;
  input clk_en_100hz;
  input rst;
  input CLK;

  wire CLK;
  wire [3:0]an_OBUF;
  wire clk_en_100hz;
  wire [1:0]digit_sel;
  wire \digit_sel[0]_i_1_n_0 ;
  wire \digit_sel[1]_i_1_n_0 ;
  wire rst;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \an_OBUF[0]_inst_i_1 
       (.I0(digit_sel[1]),
        .I1(digit_sel[0]),
        .O(an_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \an_OBUF[1]_inst_i_1 
       (.I0(digit_sel[1]),
        .I1(digit_sel[0]),
        .O(an_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \an_OBUF[2]_inst_i_1 
       (.I0(digit_sel[0]),
        .I1(digit_sel[1]),
        .O(an_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \an_OBUF[3]_inst_i_1 
       (.I0(digit_sel[1]),
        .I1(digit_sel[0]),
        .O(an_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \digit_sel[0]_i_1 
       (.I0(digit_sel[0]),
        .I1(clk_en_100hz),
        .I2(rst),
        .O(\digit_sel[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h006A)) 
    \digit_sel[1]_i_1 
       (.I0(digit_sel[1]),
        .I1(clk_en_100hz),
        .I2(digit_sel[0]),
        .I3(rst),
        .O(\digit_sel[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \digit_sel_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\digit_sel[0]_i_1_n_0 ),
        .Q(digit_sel[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \digit_sel_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\digit_sel[1]_i_1_n_0 ),
        .Q(digit_sel[1]),
        .R(1'b0));
endmodule

module input_processing
   (rst,
    CLK);
  output rst;
  input CLK;

  wire CLK;
  wire btnS_pressed_edge;
  wire prev_btnS;
  wire rst;
  wire stable_btnS_i_1_n_0;
  wire stable_btnS_reg_n_0;

  FDRE #(
    .INIT(1'b0)) 
    prev_btnS_reg
       (.C(CLK),
        .CE(1'b1),
        .D(stable_btnS_reg_n_0),
        .Q(prev_btnS),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    stable_btnS_i_1
       (.I0(stable_btnS_reg_n_0),
        .I1(rst),
        .O(stable_btnS_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    stable_btnS_reg
       (.C(CLK),
        .CE(1'b1),
        .D(stable_btnS_i_1_n_0),
        .Q(stable_btnS_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    start_i_1
       (.I0(stable_btnS_reg_n_0),
        .I1(prev_btnS),
        .O(btnS_pressed_edge));
  FDRE #(
    .INIT(1'b0)) 
    start_reg
       (.C(CLK),
        .CE(1'b1),
        .D(btnS_pressed_edge),
        .Q(rst),
        .R(1'b0));
endmodule

(* NotValidForBitStream *)
module top_module
   (clk,
    btnU,
    btnA,
    btnB,
    btnC,
    btnD,
    sw,
    JB,
    JB3,
    an,
    seg,
    led);
  input clk;
  input btnU;
  input btnA;
  input btnB;
  input btnC;
  input btnD;
  input [15:13]sw;
  input [7:4]JB;
  output JB3;
  output [3:0]an;
  output [6:0]seg;
  output [3:0]led;

  wire JB3;
  wire [3:0]an;
  wire [3:0]an_OBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire clk_en_100hz;
  wire [3:0]led;
  wire rst;
  wire [6:0]seg;

  OBUF JB3_OBUF_inst
       (.I(1'b0),
        .O(JB3));
  OBUF \an_OBUF[0]_inst 
       (.I(an_OBUF[0]),
        .O(an[0]));
  OBUF \an_OBUF[1]_inst 
       (.I(an_OBUF[1]),
        .O(an[1]));
  OBUF \an_OBUF[2]_inst 
       (.I(an_OBUF[2]),
        .O(an[2]));
  OBUF \an_OBUF[3]_inst 
       (.I(an_OBUF[3]),
        .O(an[3]));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  clock clock_inst
       (.CLK(clk_IBUF_BUFG),
        .clk_en_100hz(clk_en_100hz));
  OBUFT \led_OBUF[0]_inst 
       (.I(1'b0),
        .O(led[0]),
        .T(1'b1));
  OBUFT \led_OBUF[1]_inst 
       (.I(1'b0),
        .O(led[1]),
        .T(1'b1));
  OBUFT \led_OBUF[2]_inst 
       (.I(1'b0),
        .O(led[2]),
        .T(1'b1));
  OBUFT \led_OBUF[3]_inst 
       (.I(1'b0),
        .O(led[3]),
        .T(1'b1));
  input_processing mod2
       (.CLK(clk_IBUF_BUFG),
        .rst(rst));
  display mod4
       (.CLK(clk_IBUF_BUFG),
        .an_OBUF(an_OBUF),
        .clk_en_100hz(clk_en_100hz),
        .rst(rst));
  OBUF \seg_OBUF[0]_inst 
       (.I(1'b0),
        .O(seg[0]));
  OBUF \seg_OBUF[1]_inst 
       (.I(1'b0),
        .O(seg[1]));
  OBUF \seg_OBUF[2]_inst 
       (.I(1'b0),
        .O(seg[2]));
  OBUF \seg_OBUF[3]_inst 
       (.I(1'b0),
        .O(seg[3]));
  OBUF \seg_OBUF[4]_inst 
       (.I(1'b0),
        .O(seg[4]));
  OBUF \seg_OBUF[5]_inst 
       (.I(1'b0),
        .O(seg[5]));
  OBUF \seg_OBUF[6]_inst 
       (.I(1'b1),
        .O(seg[6]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
