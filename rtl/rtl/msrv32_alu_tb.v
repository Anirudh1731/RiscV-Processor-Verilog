module msrv32_alu_tb;

   reg [31:0] op_1_in;
   reg [31:0] op_2_in;
   reg [3:0] opcode_in;
   wire [31:0] result_out;

   msrv32_alu dut (
      .op_1_in(op_1_in),
      .op_2_in(op_2_in),
      .opcode_in(opcode_in),
      .result_out(result_out)
   );

   initial begin
      // Initialize inputs
      op_1_in = 32'hAABBCCDD;
      op_2_in = 32'h11223344;
      opcode_in = 4'b0000;

      // Wait for initial signals to stabilize
      #5;

      // Test ADD
      opcode_in = 4'b0000;
      #5;

      // Test SRL
      opcode_in = 4'b101;
      #5;

      // Test OR
      opcode_in = 4'b110;
      #5;

      // Test AND
      opcode_in = 4'b111;
      #5;

      // Test XOR
      opcode_in = 4'b100;
      #5;

      // Test SLT
      opcode_in = 4'b010;
      #5;

      // Test SLTU
      opcode_in = 4'b011;
      #5;

      // Test SLL
      opcode_in = 4'b001;
      #5;

      // Test default case
      opcode_in = 4'b1011;
      #5;

      $finish;
   end

endmodule
