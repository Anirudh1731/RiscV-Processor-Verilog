module msrv32_store_unit_tb;

  // Inputs
  reg [1:0] funct3_in;
  reg [31:0] iadder_in;
  reg [31:0] rs2_in;
  reg mem_wr_req_in;
  reg ahb_ready_in;

  // Outputs
  wire [31:0] d_addr_out;
  wire [31:0] data_out;
  wire [3:0] wr_mask_out;
  wire [1:0] ahb_htrans_out;
  wire wr_req_out;

  // Instantiate the module under test
  msrv32_store_unit dut (
    .funct3_in(funct3_in),
    .iadder_in(iadder_in),
    .rs2_in(rs2_in),
    .mem_wr_req_in(mem_wr_req_in),
    .ahb_ready_in(ahb_ready_in),
    .d_addr_out(d_addr_out),
    .data_out(data_out),
    .wr_mask_out(wr_mask_out),
    .ahb_htrans_out(ahb_htrans_out),
    .wr_req_out(wr_req_out)
  );

  // Initialize inputs
  initial begin
    funct3_in = 2'b00;
    iadder_in = 32'b0;
    rs2_in = 32'b0;
    mem_wr_req_in = 0;
    ahb_ready_in = 0;
    #5;
    ahb_ready_in = 1;
    #5;
    ahb_ready_in = 0;
    #5;
    mem_wr_req_in = 1;
    #10;
    mem_wr_req_in = 0;
    #10;
    funct3_in = 2'b01;
    rs2_in = 32'b1111111111111111;
    mem_wr_req_in = 1;
    #10;
    mem_wr_req_in = 0;
    #10;
    $finish;
  end

  // Print output values
  always @(posedge ahb_ready_in) begin
    $display("d_addr_out = %h, data_out = %h, wr_mask_out = %b, ahb_htrans_out = %b, wr_req_out = %b",
             d_addr_out, data_out, wr_mask_out, ahb_htrans_out, wr_req_out);
  end

endmodule
