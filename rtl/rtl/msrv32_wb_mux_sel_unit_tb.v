module msrv32_wb_mux_sel_unit_tb;

  reg [2:0] wb_mux_sel_reg_in;
  reg [31:0] alu_result_in, lu_output_in, imm_reg_in, iadder_out_reg_in, csr_data_in, pc_plus_4_reg_in, rs2_reg_in;
  reg alu_source_reg_in;
  wire [31:0] wb_mux_out, alu_2nd_src_mux_out;

  msrv32_wb_mux_sel_unit dut (
    .wb_mux_sel_reg_in(wb_mux_sel_reg_in),
    .alu_result_in(alu_result_in),
    .lu_output_in(lu_output_in),
    .imm_reg_in(imm_reg_in),
    .iadder_out_reg_in(iadder_out_reg_in),
    .csr_data_in(csr_data_in),
    .pc_plus_4_reg_in(pc_plus_4_reg_in),
    .rs2_reg_in(rs2_reg_in),
    .alu_source_reg_in(alu_source_reg_in),
    .wb_mux_out(wb_mux_out),
    .alu_2nd_src_mux_out(alu_2nd_src_mux_out)
  );

  // Test case 1
  initial begin
    wb_mux_sel_reg_in = 3'b000;
    alu_result_in = 32'hA5A5A5A5;
    lu_output_in = 32'h12345678;
    imm_reg_in = 32'hFFFF0000;
    iadder_out_reg_in = 32'h98765432;
    csr_data_in = 32'hBCDEF012;
    pc_plus_4_reg_in = 32'h13579BDF;
    rs2_reg_in = 32'h2468ACE0;
    alu_source_reg_in = 1'b0;
    
    #10;
    
    // Expected results
    if (wb_mux_sel_reg_in == 3'b000) begin
      if (wb_mux_out !== alu_result_in) begin
        $display("Error: Incorrect value for wb_mux_out in test case 1");
        $finish;
      end
    end
    else if (wb_mux_sel_reg_in == 3'b001) begin
      if (wb_mux_out !== lu_output_in) begin
        $display("Error: Incorrect value for wb_mux_out in test case 1");
        $finish;
      end
    end
    else if (wb_mux_sel_reg_in == 3'b010) begin
      if (wb_mux_out !== imm_reg_in) begin
        $display("Error: Incorrect value for wb_mux_out in test case 1");
        $finish;
      end
    end
    else if (wb_mux_sel_reg_in == 3'b011) begin
      if (wb_mux_out !== iadder_out_reg_in) begin
        $display("Error: Incorrect value for wb_mux_out in test case 1");
        $finish;
      end
    end
    else if (wb_mux_sel_reg_in == 3'b100) begin
      if (wb_mux_out !== csr_data_in) begin
        $display("Error: Incorrect value for wb_mux_out in test case 1");
        $finish;
      end
    end
    else if (wb_mux_sel_reg_in == 3'b101) begin
      if (wb_mux_out !== pc_plus_4_reg_in) begin
        $display("Error: Incorrect value for wb_mux_out in test case 1");
        $finish;
      end
    end
    else begin
      if (wb_mux_out !== alu_result_in) begin
        $display("Error: Incorrect value for wb_mux_out in test case 1");
        $finish;
      end
    end
      
    #10;
    
    // Check alu_2nd_src_mux_out
    if (alu_2nd_src_mux_out !== rs2_reg_in) begin
      $display("Error: Incorrect value for alu_2nd_src_mux_out in test case 1");
      $finish;
    end
    
    $display("Test case 1 passed!");
    $finish;
  end

endmodule

