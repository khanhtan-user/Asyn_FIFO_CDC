module rd_ptr_empty #(parameter ADDR_WIDTH = 3)
   (
	input 		     rd_clk,
	input 		     rd_rst_n,
	input 		     rd_inc,
	input [ADDR_WIDTH:0] rq2_wrptr,

	output  	     rd_empty,
	output [ADDR_WIDTH:0] gray_rd_ptr,
	output [ADDR_WIDTH:0] rd_bin
);
	wire [ADDR_WIDTH:0] rd_binnext;
	wire [ADDR_WIDTH:0] gray_rd_ptr_next;
	wire 		    empty_val;

assign rd_binnext = rd_bin + ( rd_inc && !rd_empty);
assign gray_rd_ptr_next = ( rd_binnext >> 1) ^ rd_binnext;
assign empty_val = ( rq2_wrptr == gray_rd_ptr_next);

always@(posedge rd_clk or negedge rd_rst_n) begin
	if ( !rd_rst_n) begin
		rd_empty <= 1'b1;
		rd_bin <= 0;
		rd_inc <= 0;
	end
	else begin
		rd_bin <= rd_binnext;
		gray_rd_ptr <= gray_rd_ptr_next;
		rd_empty <= empty_val;
	end
end
endmodule

