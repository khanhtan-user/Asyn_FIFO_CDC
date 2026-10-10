module top #( parameter ADDR_WIDTH = 3,
	      parameter DATA_WIDTH = 8,
      	      parameter PTR_WIDTH  = 4);
(
	input wr_clk,
	input wr_en,
	input wr_inc,
	input wr_rst_n,
	input [PTR_WIDTH-1:0] wr_ptr_gray,


	
