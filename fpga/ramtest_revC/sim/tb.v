module tb;

`timescale 1ns/100ps


	reg clk;
	reg rst_n;



	wire sram_addr[19:0];
	wire sram_data[ 7:0];
	wire sram_cs_n[ 3:0];
	wire sram_oe_n      ;
	wire sram_we_n      ;

	wire shit[1:0];


	initial
	begin
		clk = 1'b1;

		forever #20.8 clk = ~clk;
	end


	initial
	begin
		rst_n = 1'b0;

		repeat(10) @(posedge clk) rst_n <= 1'b1;
	end







	main main(

		.clk_fpga(clk),
		.clk_24mhz(clk),

		.warmres_n(rst_n),

		.d(sram_data),
		.a( {shit,sram_addr[13:0]} ),
		.mema14(sram_addr[14]),
		.mema15(sram_addr[15]),
		.mema16(sram_addr[16]),
		.mema17(sram_addr[17]),
		.mema18(sram_addr[18]),
		.mema21(sram_addr[19]),

		.memwe_n(sram_we_n),
		.memoe_n(sram_oe_n),

		.ram0cs_n(sram_cs_n[0]),
		.ram1cs_n(sram_cs_n[1]),
		.ram2cs_n(sram_cs_n[2]),
		.ram3cs_n(sram_cs_n[3]),
	);





endmodule

