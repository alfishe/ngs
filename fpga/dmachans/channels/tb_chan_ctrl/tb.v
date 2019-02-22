// testbench for chan_ctrl.v

`timescale 10ns/1ns

`define HALF_CLK (5.0)


class channel_data;

	bit [13:0] base;

	bit [19:0] size;
	bit [19:0] loop; // actually loop-size

	bit [ 5:0] add_int;
	bit [11:0] add_frac;

	bit [19:0] offset_int;
	bit [11:0] offset_frac;

	bit        surround;
	bit        loopena;

	bit [ 5:0] vol_left;
	bit [ 5:0] vol_right;

endclass





module tb;

	reg clk;
	reg rst_n;



	// sync counter
	integer sync_cnt;


	// DUT connections
	wire [ 6:0] rd_addr;
	tri0 [31:0] rd_data;

	wire [ 6:0] wr_addr;
	wire [31:0] wr_data;
	wire        wr_stb;

	reg         sync_stb;

	reg  [31:0] ch_enas;

	wire [ 7:0] out_data; 
	wire        out_stb_addr;
	wire        out_stb_mix;


	// channels memory
	reg [31:0] channels_mem [0:127];





	// test data
	channel_data chans[0:31];





	// create class objects
	initial
		chans_create(chans);

	// clock and reset gen
	initial
	begin
		rst_n = 1'b0;
		clk = 1'b1;
		forever #(`HALF_CLK) clk = ~clk;
	end
	//
	initial
	begin
		#(1);
		repeat (3) @(posedge clk);

		rst_n <= 1'b1;
	end


	// sync generator
	initial
	begin
		sync_cnt = 0;
		sync_stb = 1'b0;
	end
	//
	always @(posedge clk)
	if( !rst_n )
	begin
		sync_cnt <= 637;
		sync_stb <= 1'b0;
	end
	else
	begin
		if( sync_cnt<(640-1) )
			sync_cnt <= sync_cnt + 1;
		else
			sync_cnt <= 0;

		sync_stb <= !sync_cnt;
	end




	// channels memory emulator
	reg [31:0] rd_data_reg;
	assign rd_data = rd_data_reg;
	//
	always @(posedge clk)
		rd_data_reg <= channels_mem[rd_addr];
	//
	always @(posedge clk)
	if( wr_stb )
		channels_mem[wr_addr] <= wr_data;




	// channel generator/checker
	always @(posedge clk)
	if( sync_stb )
	begin
		chans_generate(chans);
	end










	always @(posedge clk)
		ch_enas = 32'hFFFF_FFFF;



	// DUT
	chan_ctrl chan_ctrl
	(
		.clk  (clk  ),
		.rst_n(rst_n),

		.rd_addr(rd_addr),
		.rd_data(rd_data),
                                
		.wr_addr(wr_addr),
		.wr_data(wr_data),
		.wr_stb (wr_stb ),

		.sync_stb(sync_stb),

		.ch_enas(ch_enas),

		.out_data    (out_data    ), 
		.out_stb_addr(out_stb_addr),
		.out_stb_mix (out_stb_mix )
	);





	task chans_create(inout channel_data chans[0:31]);
		
		int i;

		for(i=0;i<32;i++)
		begin
			chans[i] = new;
		end

	endtask


	task chans_generate(inout channel_data chans[0:31]);

		int i;

		for(i=0;i<32;i++)
		begin : gen_channel

			chans[i].base = $random()>>(32-14);

			//chans[i].add_int = $random()>>(32-6);
			chans[i].add_frac = $random()>>(32-12);


			chans[i].surround = $random()>>(32-1);
			chans[i].loopena  = $random()>>(32-1);

			chans[i].vol_left  = $random()>>(32-6);
			chans[i].vol_right = $random()>>(32-6);
		end
	endtask





endmodule

