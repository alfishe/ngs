// part of NeoGS flash programmer project (c) 2014 lvd^NedoPC
//
// top-level module

module top(

	input  wire clk_fpga,  // clocks
	input  wire clk_24mhz, //

	output wire clksel0, // clock selection
	output wire clksel1, //

	input  wire warmres_n, // warm reset


	inout  wire [ 7:0] d, // Z80 data bus
	input  wire [14:0] a, // Z80 address bus

	input  wire iorq_n,   // Z80 control signals
	input  wire mreq_n,   //
	input  wire rd_n,     //
	input  wire wr_n,     //
	input  wire m1_n,     //
	output wire int_n,    //
	output wire nmi_n,    //
	output wire busrq_n,  //
	input  wire busak_n,  //
	output wire z80res_n, //


	output wire mema14,   // memory control
	output wire mema15,   //
	output wire mema16,   //
	output wire mema17,   //
	output wire mema18,   //
	output wire ram0cs_n, //
	output wire ram1cs_n, //
	output wire ram2cs_n, //
	output wire ram3cs_n, //
	output wire mema21,   //
	output wire romcs_n,  //
	output wire memoe_n,  //
	output wire memwe_n,  //


	inout  wire [7:0] zxid,        // zxbus signals
	input  wire [7:0] zxa,         //
	input  wire       zxa14,       //
	input  wire       zxa15,       //
	input  wire       zxiorq_n,    //
	input  wire       zxmreq_n,    //
	input  wire       zxrd_n,      //
	input  wire       zxwr_n,      //
	input  wire       zxcsrom_n,   //
	output wire       zxblkiorq_n, //
	output wire       zxblkrom_n,  //
	output wire       zxgenwait_n, //
	output wire       zxbusin,     //
	output wire       zxbusena_n,  //


	output wire dac_bitck, // audio-DAC signals
	output wire dac_lrck,  //
	output wire dac_dat,  //


	output wire sd_clk, // SD card interface
	output wire sd_cs,  //
	output wire sd_do,  //
	input  wire sd_di,  //
	input  wire sd_wp,  //
	input  wire sd_det, //


	output wire ma_clk, // control interface of MP3 chip
	output wire ma_cs,
	output wire ma_do,
	input  wire ma_di,

	output wire mp3_xreset, // data interface of MP3 chip
	input  wire mp3_req,    //
	output wire mp3_clk,    //
	output wire mp3_dat,    //
	output wire mp3_sync,   //

	output wire led_diag // LED driver
);


	wire clk = clk_24mhz; // working clock







	// assign unused pins to safe values
	assign clksel0 = 1'b1;
	assign clksel1 = 1'b1;

	assign int_n = 1'b1;
	assign nmi_n = 1'b1;

	assign ram0cs_n = 1'b1;
	assign ram1cs_n = 1'b1;
	assign ram2cs_n = 1'b1;
	assign ram3cs_n = 1'b1;
	
	assign mema21 = 1'b0;

	assign zxblkrom_n  = 1'b1;
	assign zxgenwait_n = 1'b1;

	assign dac_bitck = 1'b0;
	assign dac_lrck  = 1'b0;
	assign dac_dat   = 1'b0;

	assign sd_clk = 1'b0;
	assign sd_cs  = 1'b1;
	assign sd_do  = 1'b0;

	assign ma_clk = 1'b0;
	assign ma_cs  = 1'b1;
	assign ma_do  = 1'b0;

	assign mp3_xreset = 1'b0;
	assign mp3_clk    = 1'b0;
	assign mp3_sync   = 1'b0;










endmodule

