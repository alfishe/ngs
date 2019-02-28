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



	function void init();

		base = $random()>>(32-14);

		add_int = $random()>>(32-6);
		add_frac = $random()>>(32-12);

		offset_int = $random()>>(32-20);
		offset_frac = $random()>>(32-12);

		size = $random()>>(32-10); // TODO: greater sizes
		loop = {20{1'b1}};
		while(loop>=size)
			loop = $random()>>(32-10); // TODO: greater sizes

		surround = $random()>>(32-1);
		loopena  = $random()>>(32-1);

		vol_left  = $random()>>(32-6);
		vol_right = $random()>>(32-6);
	endfunction


	function void update();

		bit cy;

		int new_off;

		bit [21:0] addr;


		{cy,offset_frac} = {1'b0, offset_frac} + {1'b0, add_frac};

		new_off = {31'd0, cy} + {26'd0,add_int} + {12'd0,offset_int};

		if( new_off >= size )
		begin
			new_off = new_off - size + loop;
		end
		
		offset_int = new_off[19:0];
	endfunction






	function int get_word(input int wnum);
		// return words suitable for channels state
		if( wnum==0 )
			get_word = {offset_int,offset_frac};
		else if( wnum==1 )
			get_word = {add_int, add_frac, loopena, surround, vol_left, vol_right};
		else if( wnum==2 )
			get_word = { (4'd0|$random()), size, base[7:0] };
		else if( wnum==3 )
			get_word = { (4'd0|$random()), loop-size, 2'b0, base[13:8] };
		else
			$stop;
	endfunction


	function bit [21:0] get_addr();

		get_addr = base*256 + offset_int;
	endfunction


	function bit [6:0] get_vol_left();
		get_vol_left = {1'b0, vol_left};
	endfunction


	function bit [6:0] get_vol_right();
		if( surround )
			get_vol_right = 7'h7F - {1'b0, vol_right};
		else
			get_vol_right = {1'b0, vol_right};
	endfunction


	function bit [7:0] get_frac();
		get_frac = offset_frac[11:4];
	endfunction
endclass





module tb;

	reg clk;
	reg rst_n;



	// sync counter
	integer sync_cnt;
	bit pre_sync;

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

	// generation fifos
	reg [7:0] mix_fifo[$];
	reg [7:0] addr_fifo[$];




	// init tb data structures
	initial
	begin : chans_create

		int i;
		for(i=0;i<32;i++) chans[i] = new;

		mix_fifo.delete();
		addr_fifo.delete();
	end

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
		pre_sync = 1'b0;
		sync_stb = 1'b0;
	end
	//
	always @(posedge clk)
	if( !rst_n )
	begin
		sync_cnt <= 637;
		pre_sync <= 1'b0;
		sync_stb <= 1'b0;
	end
	else
	begin
		if( sync_cnt<(640-1) )
			sync_cnt <= sync_cnt + 1;
		else
			sync_cnt <= 0;

		pre_sync <= !sync_cnt;

		sync_stb <= pre_sync;
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



	// fill queues off the output data
	always @(posedge clk)
	if( out_stb_mix ) mix_fifo.push_back(out_data);
	//
	always @(posedge clk)
	if( out_stb_addr ) addr_fifo.push_back(out_data);




	// channel generator/checker
	always @(posedge clk)
	if( sync_stb )
	begin : chans
		int i;

		// if there was previous iteration, check it




		// init channels for new iteration
		for(i=0;i<32;i++)
		begin
			chans[i].init();
			
			channels_mem[i*4+0] = chans[i].get_word(0);
			channels_mem[i*4+1] = chans[i].get_word(1);
			channels_mem[i*4+2] = chans[i].get_word(2);
			channels_mem[i*4+3] = chans[i].get_word(3);

			chans[i].update();
		end
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





endmodule

