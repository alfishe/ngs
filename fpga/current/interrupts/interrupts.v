// part of NeoGS project (c) 2007-2008 NedoPC
//
// interrupt controller for Z80

module interrupts
(
	input  wire clk,
	input  wire rst_n,

	input  wire m1_n,
	input  wire iorq_n,

	output reg int_n,


	input  wire [7:0] din,
	output wire [7:0] req_rd,

	output wire [2:0] int_vector,


	input  wire ena_wr,
	input  wire req_wr,

	input  wire [2:0] int_stbs;
);
	
	reg m1_r, m1_rr;
	wire m1_beg;

	reg iorq_r, iorq_rr;
	wire iorq_beg;

	reg [2:0] ena;
	reg [2:0] req;

	reg [2:0] pri_req;




	// M1 signal beginning
	always @(posedge clk)
		{m1_rr, m1_r} <= {m1_r, m1_n};
	//
	assign m1_beg = !m1_r && m1_rr;

	// IORQ
	always @(negedge clk)
		{iorq_rr, iorq_r} <= {iorq_r, iorq_n};
	//
	assign iorq_beg = !iorq_r && iorq_rr;


	// enables
	always @(posedge clk, negedge rst_n)
	if( !rst_n )
		ena <= 3'b001;
	else if( ena_wr )
	begin
		if( din[0] ) ena[0] <= din[7];
		if( din[1] ) ena[1] <= din[7];
		if( din[2] ) ena[2] <= din[7];
	end



	// requests
	always @(posedge clk, negedge rst_n)
	if( !rst_n )
		req <= 3'b000;
	else
	begin : req_control

		integer i;

		for(i=0;i<3;i=i+1)
		begin
			if( int_stbs[i] )
				req[i] <= 1'b1;
			else if( !m1_rr && iorq_beg && pri_req[i] )
				req[i] <= 1'b0;
			else if( req_wr && din[i] )
				req[i] <= din[7];
		end
	end

	// readback requests
	assign req_rd = { 5'd0, req[2:0] };



	// make prioritized request position
	always @(posedge clk)
	if( m1_beg )
	begin
		pri_req[0] <=  req[0] ;
		pri_req[1] <= !req[0] &&  req[1] ;
		pri_req[2] <= !req[0] && !req[1] && req[2];
	end
	//
	assign int_vector = { 1'b1, ~pri_req[2], ~pri_req[1] }; // for 3 requests only


	// gen interrupt
	always @(posedge clk)
		int_n <= !( req & ena );


endmodule

