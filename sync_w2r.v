module async_w2r #( parameter PTR_WIDTH = 4)
	(
	input rd_clk,
	input rd_rst_n,
	input[PTR_WIDTH-1:0] wr_ptr_gray,
	output[PTR_WIDTH-1:0] rq2_wrptr);

 reg [PTR_WIDTH-1:0] wq1_wrptr;
 reg [PTR_WIDTH-1:0] wq2_wrptr;

 	always@(posedge clk or negedge wr_rst_n) begin
		if ( !wr_rst_n) begin
			wq1_wrptr <= 0;
			wq2_wrptr <= 0;
		end
		else begin
			wq1_wrptr <= wr_ptr_gray;
			wq2_wrptr <= wq1_wrptr;
		end
	end
		assign wq2_wrptr = rq2_wrptr;
endmodule	
