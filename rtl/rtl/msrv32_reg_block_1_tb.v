module msrv32_reg_block_1_tb;
   reg clk_in;
   reg rst_in;
   reg [31:0] pc_mux_in_wire;
   wire [31:0] pc_out; // Change the declaration to wire

   msrv32_reg_block_1 dut (
      .clk_in(clk_in),
      .rst_in(rst_in),
      .pc_mux_in(pc_mux_in_wire),
      .pc_out(pc_out)
   );

   reg pc_mux_in_reg;

   initial begin
      // Initialize inputs
      clk_in = 0;
      rst_in = 0;
      pc_mux_in_wire = 0;
      pc_mux_in_reg = 0;

      // Wait for a few clock cycles
      #10;

      // Apply test stimulus
      rst_in = 1;
      #10;
      pc_mux_in_wire = 32'h12345678;

      #10;

      // Release reset
      rst_in = 0;

      // Wait for a few clock cycles
      #10;

      // Apply test stimulus
      #10;
      pc_mux_in_wire = 32'hABCDEF01;

      #10;

      // Finish the simulation
      $finish;
   end

   // Toggle clock signal
   always #5 clk_in = ~clk_in;

   // Assign pc_mux_in_reg with pc_mux_in_wire in each clock cycle
   always @(posedge clk_in) begin
      pc_mux_in_reg <= pc_mux_in_wire;
   end

   // Monitor the output
   always @(posedge clk_in) begin
      $display("pc_out = %h", pc_out);
   end
endmodule

