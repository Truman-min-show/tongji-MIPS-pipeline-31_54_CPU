
`timescale 1ns / 1ps

module board_top(
    input           clk,
    input           rst,
    input           ena,
    input  [2:0]    switch,
    output [7:0]    o_seg,
    output [7:0]    o_sel
    );

    wire [31:0] display_data;
    wire [31:0] pc, instr;
    wire [31:0] reg6;
    wire [31:0] reg7;
    wire [31:0] reg15;
    wire [31:0] reg16;

    wire        clk_cpu;
    reg [20:0]  clk_div;

    always@(posedge clk)
        clk_div = clk_div + 1;
    
    //assign clk_cpu = clk_div[19];       // 下板
    assign clk_cpu = clk;               // 仿真

    mux8_32 mux_display(pc, instr, 32'b0,32'b0,reg6,reg7,reg15,reg16, switch, display_data);

    seg7x16 seg7x16_inst(clk, rst, 1'b1, display_data, o_seg, o_sel);

    cpu cpu_inst(clk_cpu, rst, ena, pc, instr, reg6,reg7,reg15,reg16);

endmodule
