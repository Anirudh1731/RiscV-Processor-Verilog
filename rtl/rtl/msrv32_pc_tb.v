module msrv32_pc_tb;
   reg branch_taken_in;
   reg rst_in;
   reg ahb_ready_in;
   reg [1:0] pc_src_in;
   reg [31:0] epc_in;
   reg [31:0] trap_address_in;
   reg [31:0] pc_in;
   reg [31:1] iaddr_in;
   wire [31:0] pc_plus_4_out;
   wire [31:0] i_addr_out;
   wire misaligned_instr_out;
   wire [31:0] pc_mux_out; // Corrected declaration to wire

   msrv32_pc dut (
      .branch_taken_in(branch_taken_in),
      .rst_in(rst_in),
      .ahb_ready_in(ahb_ready_in),
      .pc_src_in(pc_src_in),
      .epc_in(epc_in),
      .trap_address_in(trap_address_in),
      .pc_in(pc_in),
      .iaddr_in(iaddr_in),
      .pc_plus_4_out(pc_plus_4_out),
      .i_addr_out(i_addr_out),
      .misaligned_instr_out(misaligned_instr_out),
      .pc_mux_out(pc_mux_out)
   );

   initial begin
      // Initialize inputs
      branch_taken_in = 0;
      rst_in = 0;
      ahb_ready_in = 0;
      pc_src_in = 0;
      epc_in = 0;
      trap_address_in = 0;
      pc_in = 0;
      iaddr_in = 0;

      // Wait for a few time units
      #10;

      // Apply test stimulus
      branch_taken_in = 1;
      rst_in = 1;
      ahb_ready_in = 1;
      pc_src_in = 2'b00;
      epc_in = 32'h12345678;
      trap_address_in = 32'hABCDEF01;
      pc_in = 32'h80000000;
      iaddr_in = 32'h40000000;

      #10;

      // Finish the simulation
      $finish;
   end

   // Monitor the outputs
   always @(pc_plus_4_out or i_addr_out or misaligned_instr_out or pc_mux_out) begin
      $display("pc_plus_4_out = %h, i_addr_out = %h, misaligned_instr_out = %b, pc_mux_out = %h",
               pc_plus_4_out, i_addr_out, misaligned_instr_out, pc_mux_out);
   end
endmodule

