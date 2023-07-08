module msrv32_wr_en_generator_tb;
   reg flush_in;
   reg rf_wr_en_reg_in;
   reg csr_wr_en_reg_in;
   wire wr_en_integer_file_out;
   wire wr_en_csr_file_out;

   msrv32_wr_en_generator dut (
      .flush_in(flush_in),
      .rf_wr_en_reg_in(rf_wr_en_reg_in),
      .csr_wr_en_reg_in(csr_wr_en_reg_in),
      .wr_en_integer_file_out(wr_en_integer_file_out),
      .wr_en_csr_file_out(wr_en_csr_file_out)
   );

   initial begin
      // Initialize inputs
      flush_in = 0;
      rf_wr_en_reg_in = 0;
      csr_wr_en_reg_in = 0;

      // Wait for a few clock cycles
      #10;

      // Apply stimulus
      flush_in = 1;
      #10;
      flush_in = 0;
      rf_wr_en_reg_in = 1;
      #10;
      csr_wr_en_reg_in = 1;
      #10;

      // Finish the simulation
      $finish;
   end

   // Monitor the outputs
   always @(wr_en_integer_file_out or wr_en_csr_file_out) begin
      $display("wr_en_integer_file_out = %b, wr_en_csr_file_out = %b", wr_en_integer_file_out, wr_en_csr_file_out);
   end
endmodule
