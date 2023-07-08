module msrv32_immediate_adder_tb;
   reg [31:0] pc_in;
   reg [31:0] rs1_in;
   reg [31:0] imm_in;
   reg iadder_src_in;
   wire [31:0] iadder_out;

   msrv32_immediate_adder dut (
      .pc_in(pc_in),
      .rs1_in(rs1_in),
      .imm_in(imm_in),
      .iadder_src_in(iadder_src_in),
      .iadder_out(iadder_out)
   );

   initial begin
      // Initialize inputs
      pc_in = 0;
      rs1_in = 0;
      imm_in = 0;
      iadder_src_in = 0;

      // Apply test stimulus
      // Case when iadder_src_in is 0
      pc_in = 32'h12345678;
      imm_in = 32'hABCDEF01;
      iadder_src_in = 0;
      #10;

      // Case when iadder_src_in is 1
      rs1_in = 32'h87654321;
      imm_in = 32'h98765432;
      iadder_src_in = 1;
      #10;

      // Finish the simulation
      $finish;
   end

   // Monitor the output
   always @(iadder_out) begin
      $display("iadder_out = %h", iadder_out);
   end
endmodule
