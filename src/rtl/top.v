module top #( parameter ADDR_WIDTH = 3,
	      parameter DATA_WIDTH = 8,
      	      parameter PTR_WIDTH  = 4);
(
	input wr_clk,
	input wr_inc,
	input wr_rst_n,
	input [DATA_WIDTH-1:0] wdata,
	output wire wr_full,

	input rd_clk,
	input rd_inc,
	input rd_rst_n,
	output wire [DATA_WIDTH-1:0] rdata,
	output wire rd_empty,
);
	// Writer pointer signals
	wire[ADDR_WIDTH:0] wr_bin;
	wire[ADDR_WIDTH:0] gray_wr_ptr;
	wire[ADDR_WIDTH-1:0] wr_addr;

	// Read pointer signals
	wire[ADDR_WIDTH:0] rd_bin;
	wire[ADDR_WIDTH:0] gray_rd_ptr;
	wire[ADDR_WIDTH-1:0] rd_addr;

	// CDC sync pointer
	
	wire[ADDR_WIDTH:0] wq2_rdptr;
	wire[ADDR_WIDTH:0] rq2_wrptr;

	// Memory enable signal
	
	wire wr_en;
	wire rd_en;

	assign wr_en = (wr_inc && !wr_full);
	assign rd_en = (rd_inc && !rd_empty);

	assign wr_addr = wr_bin[ADDR_WIDTH-1:0];
	assign rd_addr = rd_bin[ADDR_WIDTH-1:0];

sync_r2w DUT (.*);
sync_w2r DUT (.*);
rd_ptr_empty DUT (.*);
wr_ptr_full DUT (.*);
fifo_mem DUT (.*);


endmodule	
