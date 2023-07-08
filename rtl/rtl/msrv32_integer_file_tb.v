module msrv32_integer_file_tb;
   reg clk_in;
   reg reset_in;
   reg [4:0] rs_1_addr_in;
   reg [4:0] rs_2_addr_in;
   wire [31:0] rs_1_out;
   wire [31:0] rs_2_out;
   reg [4:0] rd_addr_in;
   reg wr_en_in;
   reg [31:0] rd_in;

   msrv32_integer_file dut (
      .clk_in(clk_in),
      .reset_in(reset_in),
      .rs_1_addr_in(rs_1_addr_in),
      .rs_2_addr_in(rs_2_addr_in),
      .rs_1_out(rs_1_out),
      .rs_2_out(rs_2_out),
      .rd_addr_in(rd_addr_in),
      .wr_en_in(wr_en_in),
      .rd_in(rd_in)
   );

   initial begin
      // Initialize inputs
      clk_in = 0;
      reset_in = 0;
      rs_1_addr_in = 0;
      rs_2_addr_in = 0;
      rd_addr_in = 0;
      wr_en_in = 0;
      rd_in = 0;

      // Apply reset
      reset_in = 1;
      #10;
      reset_in = 0;

      // Wait for a few clock cycles
      #10;

      // Perform write operation
      rd_addr_in = 2;
      wr_en_in = 1;
      rd_in = 32'h12345678;
      #10;

      // Perform read operations
      rs_1_addr_in = 2;
      rs_2_addr_in = 3;
      #10;

      // Finish the simulation
      $finish;
   end

   // Toggle clock signal
   always #5 clk_in = ~clk_in;

   // Monitor the outputs
   always @(posedge clk_in) begin
      $display("rs_1_out = %h, rs_2_out = %h", rs_1_out, rs_2_out);
   end
endmodule
