// this circuit is intended to detect perfect squares
module psg #(
    WIDTH = 8
) (
    input logic [WIDTH - 1:0] din,
    input logic clk,
    input logic en,
    input logic reset,
    output logic valid,
    output logic ps_f
);

logic [WIDTH - 1:0] temp; 
logic sub;
always@(posedge clk)
begin
    
end
    
endmodule