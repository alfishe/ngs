// testbench for CPLD_buf.v
// (c) NedoPC 2010

`timescale 1ns/100ps


`define CLK20_HALFPERIOD (25.000)
`define CLK24_HALFPERIOD (20.833)


module tb;


	reg clk24,clk20;

	reg coldres_n;

	reg [1:0] clksel;


	wire clkout;



	// 20MHz clock
	initial
	begin
		clk20 = 1'b0;

		forever #(`CLK20_HALFPERIOD) clk20 = ~clk20;
	end

	// 24MHz clock
	initial
	begin
		clk24 = 1'b0;

		forever #(`CLK24_HALFPERIOD) clk24 = ~clk24;
	end


	// cold reset
	initial
		coldres_n = 1'b0;




	// clk switch signals
	initial
	begin
		clksel = 2'b00;

		forever
		begin
			repeat(10) @(posedge clkout);

			clksel <= clksel + 2'b01;
		end
	end








	// module connection

	GS_cpld DUT( .clk24in(clk24),
	             .clk20in(clk20),
	             .clksel0(clksel[0]),
	             .clksel1(clksel[1]),
	             .clkout(clkout)

               );


endmodule

