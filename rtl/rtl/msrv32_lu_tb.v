module msrv32_lu_tb;

   reg [1:0] load_size_in;
   reg clk_in;
   reg load_unsigned_in;
   reg [31:0] data_in;
   reg [1:0] iadder_1_to_0_in;
   reg ahb_resp_in;
   wire [31:0] lu_output;

   msrv32_lu dut (
      .load_size_in(load_size_in),
      .clk_in(clk_in),
      .load_unsigned_in(load_unsigned_in),
      .data_in(data_in),
      .iadder_1_to_0_in(iadder_1_to_0_in),
      .ahb_resp_in(ahb_resp_in),
      .lu_output(lu_output)
   );

   initial begin
      // Initialize inputs
      load_size_in = 2'b00;
      clk_in = 0;
      load_unsigned_in = 0;
      data_in = 32'hAABBCCDD;
      iadder_1_to_0_in = 2'b00;
      ahb_resp_in = 1'b0;

      // Wait for initial signals to stabilize
      #5;

      // Toggle clock
      forever #10 clk_in = ~clk_in;
   end

   always @(posedge clk_in) begin
      // Stimulus
      #5;
      load_size_in = 2'b01;
      iadder_1_to_0_in = 2'b01;
      ahb_resp_in = 1'b1;

      #5;
      load_size_in = 2'b10;
      iadder_1_to_0_in = 2'b10;
      ahb_resp_in = 1'b0;

      #5;
      load_size_in = 2'b11;
      iadder_1_to_0_in = 2'b11;
      ahb_resp_in = 1'b1;

      #10 $finish;
   end

endmodule
