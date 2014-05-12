// part of NeoGS flash programmer project (c) 2014 lvd^NedoPC
//
// rom controller

module rom
(
	input  wire clk,
	input  wire rst_n,
	
	input  wire       wr_addr,
	input  wire       wr_data,
	input  wire       rd_data,
	input  wire [7:0] wr_buffer,
	output reg  [7:0] rd_buffer,

	output reg  [18:0] rom_a,
	inout  wire [ 7:0[ rom_d,
	output reg         rom_cs_n,
	output reg         rom_oe_n,
	output reg         rom_we_n
);




endmodule


