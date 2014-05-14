// (c) NedoPC 2014
//
// top-level for testing pgmflash

`timescale 1ns/1ps

`define HALF_24MHZ (20.833)
`define HALF_FPGA  (50.000)

`define HALF_ZX (71.428)


module tb;

	reg clk_24mhz;
	reg clk_fpga;
	
	reg clk_zx;





	wire clksel0;
	wire clksel1;

	reg warmres_n;


	wire [ 7:0] d;
	wire [15:0] a;

	wire iorq_n;
	wire mreq_n;
	wire rd_n;
	wire wr_n;
	wire m1_n;
	wire int_n;
	wire nmi_n;
	wire busrq_n;
	wire busak_n;
	tri1 z80res_n;


	wire mema14;
	wire mema15;
	wire mema16;
	wire mema17;
	wire mema18;
	wire [3:0] ramcs_n;
	wire mema21;
	wire romcs_n;
	wire memoe_n;
	wire memwe_n;


	tri0 [7:0] zxid;
	reg  [7:0] zxa;
	tri0 zxa14;
	tri0 zxa15;
	tri1 zxiorq_n;
	tri1 zxmreq_n;
	tri1 zxrd_n;
	tri1 zxwr_n;
	wire zxcsrom_n;
	wire zxblkiorq_n;
	wire zxblkrom_n;
	wire zxgenwait_n;
	wire zxbusin;
	wire zxbusena_n;


	wire dac_bitck;
	wire dac_lrck;
	wire dac_dat;


	wire sd_clk;
	wire sd_cs;
	wire sd_do;
	tri1 sd_di;
	tri1 sd_wp;
	tri1 sd_det;


	wire ma_clk;
	wire ma_cs;
	wire ma_do;
	tri1 ma_di;

	wire mp3_xreset;
	tri1 mp3_req;
	wire mp3_clk;
	wire mp3_dat;
	wire mp3_sync;

	wire led_diag;

	
	wire [7:0] zxd;

	wire [7:0] zxin;
	reg  [7:0] zxout;
	reg        zxena;

	// zx databus
	assign zxin = zxd;
	assign zxd  = zxena ? zxout : 8'bZZZZ_ZZZZ;


	// 74*245 emulation
	assign zxd  = (!zxbusena_n && !zxbusin) ? zxid : 8'bZZZZ_ZZZZ;
	assign zxid = (!zxbusena_n &&  zxbusin) ? zxd  : 8'bZZZZ_ZZZZ;



	// clock gen
	initial
	begin
		clk_24mhz = 1'b1;
		forever #(`HALF_24MHZ) clk_24mhz = ~clk_24mhz;
	end
	//
	initial
	begin
		clk_fpga = 1'b1;
		forever #(`HALF_FPGA) clk_fpga = ~clk_fpga;
	end
	//
	initial
	begin
		clk_zx = 1'b1;
		forever #(`HALF_ZX) clk_zx = ~clk_zx;
	end



	initial
	begin
		warmres_n = 1'b0;
		#(1);
		repeat(2) @(posedge clk_fpga);
		warmres_n <= 1'b1;
	end



	// DUT
	top top
	(
		.clk_fpga(clk_fpga),
		.clk_24mhz(clk_24mhz),
		.clksel0(clksel0),
		.clksel1(clksel1),
		.warmres_n(warmres_n),
		.d(d),
		.a(a),
		.iorq_n(iorq_n),
		.mreq_n(mreq_n),
		.rd_n(rd_n),
		.wr_n(wr_n),
		.m1_n(m1_n),
		.int_n(int_n),
		.nmi_n(nmi_n),
		.busrq_n(busrq_n),
		.busak_n(busak_n),
		.z80res_n(z80res_n),
		.mema14(mema14),
		.mema15(mema15),
		.mema16(mema16),
		.mema17(mema17),
		.mema18(mema18),
		.ram0cs_n(ramcs_n[0]),
		.ram1cs_n(ramcs_n[1]),
		.ram2cs_n(ramcs_n[2]),
		.ram3cs_n(ramcs_n[3]),
		.mema21(mema21),
		.romcs_n(romcs_n),
		.memoe_n(memoe_n),
		.memwe_n(memwe_n),
		.zxid(zxid),
		.zxa(zxa),
		.zxa14(zxa14),
		.zxa15(zxa15),
		.zxiorq_n(zxiorq_n),
		.zxmreq_n(zxmreq_n),
		.zxrd_n(zxrd_n),
		.zxwr_n(zxwr_n),
		.zxcsrom_n(zxcsrom_n),
		.zxblkiorq_n(zxblkiorq_n),
		.zxblkrom_n(zxblkrom_n),
		.zxgenwait_n(zxgenwait_n),
		.zxbusin(zxbusin),
		.zxbusena_n(zxbusena_n),
		.dac_bitck(dac_bitck),
		.dac_lrck(dac_lrck),
		.dac_dat(dac_dat),
		.sd_clk(sd_clk),
		.sd_cs(sd_cs),
		.sd_do(sd_do),
		.sd_di(sd_di),
		.sd_wp(sd_wp),
		.sd_det(sd_det),
		.ma_clk(ma_clk),
		.ma_cs(ma_cs),
		.ma_do(ma_do),
		.ma_di(ma_di),
		.mp3_xreset(mp3_xreset),
		.mp3_req(mp3_req),
		.mp3_clk(mp3_clk),
		.mp3_dat(mp3_dat),
		.mp3_sync(mp3_sync),
		.led_diag(led_diag)
	);







	initial
	begin
		wait(warmres_n==1'b1);

		iord(.addr(8'h33,.data()));
		iowr(.addr(8'h33,.data(8'h00)));
	end







	// IO cycles emulator
	task iord;

		input  [7:0] addr;

		output [7:0] data;

		begin

			@(posedge clk_zx);

			zxmreq_n <= 1'b1;
			zxiorq_n <= 1'b1;
			zxrd_n   <= 1'b1;
			zxwr_n   <= 1'b1;

			zxena <= 1'b0;

			zxa <= addr;

			@(negedge clk_zx);

			zxiorq_n <= 1'b0;
			zxrd_n   <= 1'b0;

			@(negedge clk_zx);
			@(negedge clk_zx);

			data = zxin;

			zxiorq_n <= 1'b1;
			zxrd_n   <= 1'b1;

		end

	endtask
	//
	task iowr;

		input [7:0] addr;
		input [7:0] data;

		begin

			@(posedge clk_zx);

			zxmreq_n <= 1'b1;
			zxiorq_n <= 1'b1;
			zxrd_n   <= 1'b1;
			zxwr_n   <= 1'b1;

			zxena <= 1'b1;

			zxa   <= addr;
			zxout <= data;

			@(negedge clk_zx);

			zxiorq_n <= 1'b0;
			zxwr_n   <= 1'b0;

			@(negedge clk_zx);
			@(negedge clk_zx);

			zxiorq_n <= 1'b1;
			zxwr_n   <= 1'b1;

			wait(zxwr_n==1'b1); // delta-cycle delay!!!

			zxena <= 1'b0;

		end

	endtask









endmodule

