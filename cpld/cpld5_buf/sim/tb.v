// testbench for CPLD_buf.v
// (c) NedoPC 2010

`timescale 1ns/1ps


`define CLK20_HALFPERIOD (25.000)
`define CLK24_HALFPERIOD (20.833)


module tb;

	reg [ 7:0] dummy8;



	reg clk24,clk20;
	reg [1:0] clksel;
	wire clkout;

	reg clkin;

	reg coldres_n;
	wire warmres_n;


	tri1 config_n;
	wire cs;
	reg status_n,conf_done,init_done;



	reg  [15:0] zaddr;
	wire [ 7:0] zdata;
	reg  [ 7:0] zdout;
	reg         zdena;

	wire [ 7:0] mdata;

	reg mreq_n, iorq_n, rd_n, wr_n;

	wire ra6,ra7,ra10,ra11,ra12,ra13;
	wire mema14,mema15,mema19;
	wire memoe_n,memwe_n,romcs_n;


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


	// 10 MHz clock
	initial
	begin
		clkin = 1'b0;

		repeat(2)
		begin
			@(posedge clk20);
			@(posedge clk24);
		end

		forever #(2*`CLK20_HALFPERIOD) clkin = ~clkin;
	end


	// cold reset
	initial
	begin
		coldres_n = 1'b0;

		repeat(5) @(posedge clkin);

		coldres_n <= 1'b1;

	end

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
	integer width,min_width;

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
			width = 1000.0*(cur_time-old_time);
			old_time=cur_time;

			if( width<min_width )
			begin
				min_width = width;
				$display("at time %t,",cur_time);
				$display("minimum width set to %d",min_width);
			end
		end
	end


	// status_n, *_done control
	initial
		status_n = 1'b1;
	always @(config_n)
	begin
		status_n <= #1000 config_n;
	end

	initial
		conf_done = 1'b0;

	initial
		init_done = 1'b0;


	// Z80 cycles
	assign zdata = zdena ? zdout : 8'hZZ;
	//
	initial
	begin
		zdena = 1'b0;

		iorq_n = 1'b1;
		mreq_n = 1'b1;
		rd_n   = 1'b1;
		wr_n   = 1'b1;

		zaddr  = 16'hZZZZ;

		wait(warmres_n===1'bZ);
		repeat(3) @(posedge clkin);


		test_config_status;

		test_cold_reset_flag;

		test_fpga_cs;

		test_conf_done;



	end
















	// module connection

	GS_cpld DUT( .clk24in(clk24),
	             .clk20in(clk20),
	             .clksel0(clksel[0]),
	             .clksel1(clksel[1]),
	             .clkout(clkout),

	             .clkin(clkin),
	             .coldres_n(coldres_n),
	             .warmres_n(warmres_n),

	             .config_n(config_n),
	             .status_n(status_n),
	             .conf_done(conf_done),
	             .init_done(init_done),
	             .cs(cs),

	             .mreq_n(mreq_n),
	             .iorq_n(iorq_n),
	             .rd_n(rd_n),
	             .wr_n(wr_n),

	             .d(zdata),
	             .a6 (zaddr[ 6]), .a7 (zaddr[ 7]), .a10(zaddr[10]), .a11(zaddr[11]),
	             .a12(zaddr[12]), .a13(zaddr[13]), .a14(zaddr[14]), .a15(zaddr[15]),

	             .memoe_n(memoe_n),
	             .memwe_n(memwe_n),
	             .romcs_n(romcs_n),
	             .mema14(mema14), .mema15(mema15), .mema19(mema19)

               );














	// tasks for z80 bus model (simplified)

	task iord;

		input [15:0] addr;

		output [7:0] data;

		begin

			@(posedge clkin);

			mreq_n <= 1'b1;
			iorq_n <= 1'b1;
			rd_n   <= 1'b1;
			wr_n   <= 1'b1;

			zdena  <= 1'b0;

			zaddr <= addr;

			@(negedge clkin);

			iorq_n <= 1'b0;
			rd_n   <= 1'b0;

			@(negedge clkin);
			@(negedge clkin);

			data = zdata;

			iorq_n <= 1'b1;
			rd_n   <= 1'b1;

		end

	endtask


	task iowr;

		input [15:0] addr;
		input [ 7:0] data;

		begin

			@(posedge clkin);

			mreq_n <= 1'b1;
			iorq_n <= 1'b1;
			rd_n   <= 1'b1;
			wr_n   <= 1'b1;

			zdena  <= 1'b1;

			zaddr <= addr;
			zdout <= data;

			@(negedge clkin);

			iorq_n <= 1'b0;
			wr_n   <= 1'b0;

			@(negedge clkin);
			@(negedge clkin);

			iorq_n <= 1'b1;
			wr_n   <= 1'b1;

			wait(wr_n==1'b1); // delta-cycle delay!!!

			zdena  <= 1'b0;

		end

	endtask


	task w_st_n; // wait status_n to be as given

		input value;

		reg [7:0] tmp;

		forever
		begin

	        iord(16'h0080,tmp);

			//$display("status_n=d",tmp[7]);

			if( tmp[7]==value )
				disable w_st_n;

		end

	endtask



	task test_config_status;

		begin
			$display("test_config_status: playing with config_n...");

			w_st_n(1'b0);
			iowr(16'h0080,8'h01); // play with config_n
			w_st_n(1'b1);
			iowr(16'h0080,8'h00);
			w_st_n(1'b0);
			iowr(16'h0080,8'h01);
			w_st_n(1'b1);

			$display("test_config_status: success!");
		end

	endtask


	task test_cold_reset_flag;

		reg [7:0] tmp;

		begin
			$display("test_cold_reset_flag: doing sticking test...");

            iord(16'h0040,tmp);
            if( tmp[7] )
            begin
				$display("test_cold_reset_flag: error! cold_reset_flag was set at the beginning!");
				$stop;
            end

			iowr(16'h0080,8'h81); // set cold reset flag

            iord(16'h0040,tmp);
            if( !tmp[7] )
            begin
				$display("test_cold_reset_flag: error! can't set cold_reset_flag!");
				$stop;
            end

			iowr(16'h0080,8'h01); // try to clear cold reset flag

            iord(16'h0040,tmp);
            if( !tmp[7] )
            begin
				$display("test_cold_reset_flag: error! can clear cold_reset_flag!");
				$stop;
            end

			$display("test_cold_reset_flag: success!");
		end

	endtask


	task test_fpga_cs;

		integer i;

		begin
			$display("test_fpga_cs: testing cs decoding...");

			for(i=0;i<4;i=i+1)
			begin

				@(posedge clkin);
				zaddr <= { 8'd0, i[1:0], 6'd0 };
				@(posedge clkin);

				if( cs!=(i==3) )
				begin
					$display("test_fpga_cs: error! cs is not set at addr $C0!");
					$stop;
				end
			end

			$display("test_fpga_cs: success!");
		end

	endtask


	task test_conf_done;

		integer i;

		reg [7:0] tmp;

		begin
			$display("test_conf_done: testing read of conf_done...");

			for(i=0;i<2;i=i+1)
			begin
				@(posedge clkin);
				conf_done <= i[0];
				@(posedge clkin);

				iord(16'h0080,tmp);

				if( tmp[0]!=i[0] )
				begin
					$display("test_conf_done: error! read data is wrong!");
					$stop;
				end
			end

			$display("test_conf_done: success!");
		end

	endtask















endmodule


