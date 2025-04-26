`include "bec.v"
`default_nettype none

module tb_bec;
logic clk;
logic en;
logic [31:0] din;
logic [31:0] dout;
bec DUT(
    .en(en),
    .din(din),
    .dout(dout)
);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;
task init;
        en = 0;
        din = 0;
        #10;
    endtask
task test_pattern;
    input string test_name;
    input [31:0] input_val;
    input [31:0] expected_val;
    begin
        $display("Test: %s", test_name);
        din = input_val;
        en = 1;
        #10;
        
        if (dout !== expected_val) 
            $display("  Error: Input=%h, Expected=%h, Got=%h", 
                     input_val, expected_val, dout);
        else 
            $display("  Passed");
    end
endtask
initial begin
    $dumpfile("tb_bec.vcd");
    $dumpvars(0, tb_bec);
end

initial begin
    clk<=1'b0;

    init;
    repeat(5) @(posedge clk);
    test_pattern("Basic pattern", 
                    32'h11223344, 
                    32'h44332211); 
    @(posedge clk);
    repeat(2) @(posedge clk);
    $finish;
end

endmodule
`default_nettype wire