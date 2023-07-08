`timescale 1ns / 1ps

module msrv32_top_tb;

  // Inputs
  reg ms_riscv32_mp_clk_in;
  reg ms_riscv32_mp_rst_in;
  reg [63:0] ms_riscv32_mp_rc_in;
  reg [31:0] ms_riscv32_mp_instr_in;
  reg ms_riscv32_mp_instr_hready_in;
  reg [31:0] ms_riscv32_mp_data_in;
  reg ms_riscv32_mp_data_hready_in;
  reg ms_riscv32_mp_hresp_in;
  reg ms_riscv32_mp_eirq_in;
  reg ms_riscv32_mp_tirq_in;
  reg ms_riscv32_mp_sirq_in;

  // Outputs
  wire [31:0] ms_riscv32_mp_imaddr_out;
  wire [31:0] ms_riscv32_mp_dmaddr_out;
  wire [31:0] ms_riscv32_mp_dmdata_out;
  wire ms_riscv32_mp_dmwr_req_out;
  wire [3:0] ms_riscv32_mp_dmwr_mask_out;
  wire [1:0] ms_riscv32_mp_data_htrans_out;

  // Instantiate the DUT
  msrv32_top dut (
    .ms_riscv32_mp_clk_in(ms_riscv32_mp_clk_in),
    .ms_riscv32_mp_rst_in(ms_riscv32_mp_rst_in),
    .ms_riscv32_mp_rc_in(ms_riscv32_mp_rc_in),
    .ms_riscv32_mp_instr_in(ms_riscv32_mp_instr_in),
    .ms_riscv32_mp_instr_hready_in(ms_riscv32_mp_instr_hready_in),
    .ms_riscv32_mp_data_in(ms_riscv32_mp_data_in),
    .ms_riscv32_mp_data_hready_in(ms_riscv32_mp_data_hready_in),
    .ms_riscv32_mp_hresp_in(ms_riscv32_mp_hresp_in),
    .ms_riscv32_mp_eirq_in(ms_riscv32_mp_eirq_in),
    .ms_riscv32_mp_tirq_in(ms_riscv32_mp_tirq_in),
    .ms_riscv32_mp_sirq_in(ms_riscv32_mp_sirq_in),
    .ms_riscv32_mp_imaddr_out(ms_riscv32_mp_imaddr_out),
    .ms_riscv32_mp_dmaddr_out(ms_riscv32_mp_dmaddr_out),
    .ms_riscv32_mp_dmdata_out(ms_riscv32_mp_dmdata_out),
    .ms_riscv32_mp_dmwr_req_out(ms_riscv32_mp_dmwr_req_out),
    .ms_riscv32_mp_dmwr_mask_out(ms_riscv32_mp_dmwr_mask_out),
    .ms_riscv32_mp_data_htrans_out(ms_riscv32_mp_data_htrans_out)
  );

  // Clock generation
  always #5 ms_riscv32_mp_clk_in = ~ms_riscv32_mp_clk_in;

  // Initialize inputs
  initial begin
    ms_riscv32_mp_rst_in = 1;
    ms_riscv32_mp_instr_hready_in = 0;
    ms_riscv32_mp_data_hready_in = 0;
    #10 ms_riscv32_mp_rst_in = 0;
    // Rest of the code...
  end
endmodule

