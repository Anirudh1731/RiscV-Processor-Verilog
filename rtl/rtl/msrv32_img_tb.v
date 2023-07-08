module msrv32_img_tb;
   reg [31:7] instr_in;
   reg [2:0] imm_type_in;
   wire [31:0] imm_out;

   msrv32_img dut (
      .instr_in(instr_in),
      .imm_type_in(imm_type_in),
      .imm_out(imm_out)
   );

   initial begin
      // Initialize inputs
      instr_in = 0;
      imm_type_in = 0;

      // Wait for a few clock cycles
      #10;

      // Apply test stimulus
      instr_in = 32'hAABBCCDD;
      imm_type_in = 3'b001;

      #10;

      // Apply another test stimulus
      instr_in = 32'h12345678;
      imm_type_in = 3'b010;

      #10;

      // Apply one more test stimulus
      instr_in = 32'hABCDEF01;
      imm_type_in = 3'b011;

      #10;

      // Finish the simulation
      $finish;
   end

   // Monitor the output
   always @(imm_out) begin
      $display("imm_out = %h", imm_out);
   end
endmodule
