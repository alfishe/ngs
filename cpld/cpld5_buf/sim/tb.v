// testbench for CPLD_buf.v
// (c) NedoPC 2010

`timescale 1ns/1ps


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

			clksel[1:0] <= $random>>30;
		end
	end




	// control minimal period of switched clock
	real old_time,cur_time;
	real width,min_width;

	initial
	begin
		old_time=$time;
		cur_time=old_time;
		min_width=1e10;

		#(0.1); // wait to skip x->value init at the beginning

		forever
		begin
			@(clkout);

			cur_time=$realtime;
			width = cur_time-old_time;
			old_time=cur_time;

			if( width<min_width )
			begin
				min_width = width;
				$display("at time %t,",cur_time);
				$display("minimum width set to %t",min_width);
			end
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

