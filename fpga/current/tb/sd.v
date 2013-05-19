// (c) NedoPC 2013
//
// SD data sender to test SD and MP3 dmas

`timescale 1ns/100ps

module sd
(
	input  wire clk,
	input  wire di,
	output wire do
);

	reg [7:0] byteout;
	reg [7:0] bytein;

	int bitcntout;
	int bitcntin;

	int state;
	int count;

	localparam _FF   = 'd0;
	localparam _FE   = 'd1;
	localparam _DATA = 'd2;
	localparam _CRC  = 'd3;


	initial byteout = 8'hFF;
	initial bitcntout = 7;
	initial bitcntin = 7;
	initial state = _FF;
	initial count = 5;



	assign do = byteout[7];


	always @(negedge clk)
	begin
		byteout <= byteout<<1;
		bitcntout = bitcntout - 1;

		if( bitcntout<0 )
		begin
			bitcntout = 7;

			case( state )

			_FF:begin
				count = count - 1;
				if( count<=0 )
					state = _FE;
				byteout <= 8'hFF;
			end

			_FE:begin
				state = _DATA;
				byteout <= 8'hFE;
				count = 512;
			end

			_DATA:begin
				count
			end

			_CRC:begin
			end


			endcase
		end
	end

	

	always @(posedge clk)
	begin
		bytein = {bytein[7:1], di};

		bitcntin = bitcntin - 1;

		if( bitcntin<0 )
		begin
			bitcnt = 7;

			if( bytein!==8'hFF )
			begin
				$display("sd: received not FF!");
				$stop;
			end
		end
	end


endmodule

