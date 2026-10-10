module wr_ptr_full #(parameter ADDR_WIDTH = 3)
 	(
		input wr_clk,
		input wr_rst_n,
		input wr_inc,
		input [ADDR_WIDTH:0] wq2_rdptr,

		output [ADDR_WIDTH:0] gray_wr_ptr,
		output [ADDR_WIDTH:0] wr_bin,
		output                wr_full
		);
		
	wire [ADDR_WIDTH:0] wr_binnext;
	wire [ADDR_WIDTH:0] gray_wr_ptrnext;
	wire                full_val;

 assign wr_binnext = wr_bin + ( wr_inc && !wr_full);

 assign gray_wr_ptrnext = ( gray_wr_ptr >> 1) ^ wr_binnext;
 
 assign full_val = ( gray_wr_ptrnext[ADDR_WIDTH] != wq2_rdptr[ADDR_WIDTH]) && ( gray_wr_ptrnext[ADDR_WIDTH-1] != wq2_rdptr[ADDR_WIDTH-1]) && ( gray_wr_ptrnext[ADDR_WIDTH-2] == wq2_rdptr[ADDR_WIDTH-2]);

 always @(posedge wr_clk or negedge wr_rst_n) begin
	 if ( !wr_rst_n) begin
		 wr_ptr <= 0;
		 wr_bin <= 0;
		 wr_full <= 1'b0;
	 end
	 else begin
		 gray_wr_ptr <= gray_wr_ptrnext;
		 wr_bin      <= wr_binnext;
		 wr_full     <= full_val;
	 end
 end 
 endmodule


