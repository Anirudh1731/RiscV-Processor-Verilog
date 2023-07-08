module msrv32_instruction_mux_tb;

  reg flush_in;
  reg [31:0] ms_risc32_mp__instr_in;
  wire [2:0] funct3_out;
  wire [4:0] rs1addr_out, rs2addr_out, rdaddr_out;
  wire [6:0] opcode_out, funct7_out;
  wire [11:0] csr_addr_out;
  wire [31:7] instr_out;

  msrv32_instruction_mux dut (
    .flush_in(flush_in),
    .ms_risc32_mp__instr_in(ms_risc32_mp__instr_in),
    .funct3_out(funct3_out),
    .rs1addr_out(rs1addr_out),
    .rs2addr_out(rs2addr_out),
    .rdaddr_out(rdaddr_out),
    .opcode_out(opcode_out),
    .funct7_out(funct7_out),
    .csr_addr_out(csr_addr_out),
    .instr_out(instr_out)
  );

  initial begin
    // Initialize inputs
    flush_in = 0;
    ms_risc32_mp__instr_in = 32'h12345678;

    // Wait for a few time units
    #10;

    // Set flush_in to high
    flush_in = 1;
    #10;

    // Set flush_in to low and provide instruction value
    flush_in = 0;
    ms_risc32_mp__instr_in = 32'hABCDEF01;

    #10;

    // Finish the simulation
    $finish;
  end

  // Monitor the outputs
  always @* begin
    $display("opcode_out = %b, funct3_out = %b, funct7_out = %b", opcode_out, funct3_out, funct7_out);
    $display("csr_addr_out = %b, rs1addr_out = %b, rs2addr_out = %b, rdaddr_out = %b", csr_addr_out, rs1addr_out, rs2addr_out, rdaddr_out);
    $display("instr_out = %h", instr_out);
  end

endmodule

