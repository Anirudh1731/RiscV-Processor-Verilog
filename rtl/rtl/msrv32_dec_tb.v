`timescale 1ns / 1ps

module msrv32_dec_tb;

   reg [6:0] opcode_in;
   reg funct7_5_in;
   reg [2:0] funct3_in;
   reg [1:0] iadder_1_to_0_in;
   reg trap_taken_in;

   wire [3:0] alu_opcode_out;
   wire mem_wr_req_out;
   wire [1:0] load_size_out;
   wire load_unsigned_out;
   wire alu_src_out;
   wire iadder_src_out;
   wire csr_wr_en_out;
   wire rf_wr_en_out;
   wire [2:0] wb_mux_sel_out;
   wire [2:0] imm_type_out;
   wire [2:0] csr_op_out;
   wire illegal_instr_out;
   wire misaligned_load_out;
   wire misaligned_store_out;

   msrv32_dec dut (
      .opcode_in(opcode_in),
      .funct7_5_in(funct7_5_in),
      .funct3_in(funct3_in),
      .iadder_1_to_0_in(iadder_1_to_0_in),
      .trap_taken_in(trap_taken_in),
      .alu_opcode_out(alu_opcode_out),
      .mem_wr_req_out(mem_wr_req_out),
      .load_size_out(load_size_out),
      .load_unsigned_out(load_unsigned_out),
      .alu_src_out(alu_src_out),
      .iadder_src_out(iadder_src_out),
      .csr_wr_en_out(csr_wr_en_out),
      .rf_wr_en_out(rf_wr_en_out),
      .wb_mux_sel_out(wb_mux_sel_out),
      .imm_type_out(imm_type_out),
      .csr_op_out(csr_op_out),
      .illegal_instr_out(illegal_instr_out),
      .misaligned_load_out(misaligned_load_out),
      .misaligned_store_out(misaligned_store_out)
   );

   initial begin
      $dumpfile("msrv32_dec_tb.vcd");
      $dumpvars(0, msrv32_dec_tb);

      // Test Case 1
      opcode_in = 7'b0110111;
      funct7_5_in = 1'b0;
      funct3_in = 3'b000;
      iadder_1_to_0_in = 2'b00;
      trap_taken_in = 1'b0;
      #10;

      // Test Case 2
      opcode_in = 7'b1100011;
      funct7_5_in = 1'b0;
      funct3_in = 3'b001;
      iadder_1_to_0_in = 2'b01;
      trap_taken_in = 1'b1;
      #10;

      // Test Case 3
      opcode_in = 7'b0000011;
      funct7_5_in = 1'b0;
      funct3_in = 3'b100;
      iadder_1_to_0_in = 2'b10;
      trap_taken_in = 1'b0;
      #10;

      // Add more test cases here

      $finish;
   end

endmodule
