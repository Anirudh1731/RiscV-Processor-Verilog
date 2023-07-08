module msrv32_bu_tb;
   reg [6:2] opcode_6_to_2;
   reg [2:0] funct3;
   reg [31:0] rs1, rs2;
   wire branch_taken;

   msrv32_bu dut (
      .opcode_6_to_2_in(opcode_6_to_2),
      .funct3_in(funct3),
      .rs1_in(rs1),
      .rs2_in(rs2),
      .branch_taken_out(branch_taken)
   );

   initial begin
      // Test case 1: Branch instruction with rs1_in equal to rs2_in
      opcode_6_to_2 = 5'b11000;
      funct3 = 3'b000;
      rs1 = 32'h12345678;
      rs2 = 32'h12345678;
      #10;
      $display("Branch Taken: %b", branch_taken);

      // Test case 2: Branch instruction with rs1_in not equal to rs2_in
      opcode_6_to_2 = 5'b11000;
      funct3 = 3'b001;
      rs1 = 32'h12345678;
      rs2 = 32'h87654321;
      #10;
      $display("Branch Taken: %b", branch_taken);

      // Test case 3: Jump instruction (JAL)
      opcode_6_to_2 = 5'b11011;
      funct3 = 3'b000;
      rs1 = 32'h00000000;
      rs2 = 32'h00000000;
      #10;
      $display("Branch Taken: %b", branch_taken);

      // Test case 4: Jump instruction (JALR)
      opcode_6_to_2 = 5'b11001;
      funct3 = 3'b000;
      rs1 = 32'h00000000;
      rs2 = 32'h00000000;
      #10;
      $display("Branch Taken: %b", branch_taken);

      // Test case 5: Non-branch instruction
      opcode_6_to_2 = 5'b00000;
      funct3 = 3'b000;
      rs1 = 32'h12345678;
      rs2 = 32'h87654321;
      #10;
      $display("Branch Taken: %b", branch_taken);

      // Finish the simulation
      $finish;
   end
endmodule
