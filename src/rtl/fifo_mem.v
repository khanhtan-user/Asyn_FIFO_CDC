module fifo_mem #( parameter ADDR_WIDTH = 3,
		   parameter DATA_WIDTH = 8);
 (
	input wr_clk,
	input wr_en,
	input[ADDR_WIDTH-1:0] wr_addr,
	input[DATA_WIDTH-1:0] wdata,

	input rd_clk,
	input rd_en,
	input[ADDR_WIDTH-1:0] rd_addr,
	output[DATA_WIDTH-1:0] rdata
);

	reg [DATA_WIDTH-1:0] mem [0:(1<< ADDR_WIDTH) -1]; // phần sau khúc mem : xác định có bao nhiêu ô nhớ. vd: addr = 3, 1<<3 = 2 mũ 3 = 8 mà -1 nữa thành 7.
	always @(posedge wr_clk) begin
		if ( wr_en) begin
			mem[wr_addr] <= wdata;
		end
	end

	always @(posedge rd_clk) begin
		if ( rd_en) begin
			mem[rd_addr] <= rdata;
		end
	end
endmodule

