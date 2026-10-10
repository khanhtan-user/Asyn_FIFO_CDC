module asyn_r2w #(parameter PTR_WIDTH = 4)
	(
	input wr_clk,
	input wr_rst_n,
	input[PTR_WIDTH-1:0] rd_ptr_gray,
	output[PTR_WIDTH-1:0] wq2_rdptr);
	
	reg [PTR_WIDTH-1:0] rq1_rdptr;
	reg [PTR_WIDTH-1:0] rq2_rdptr;
always@(posedge wr_clk or negedge wr_rst_n) begin
	if ( !wr_rst_n) begin
		rq1_rdptr <= 0;
		rq2_rdptr <= 0;
	end
	else begin 
		rq1_rdptr <= rd_ptr_gray;
		rq2_rdptr <= rq1_rdptr;
end
	assign rq2_rdptr = wq2_rdptr;
end
endmodule


	

 

