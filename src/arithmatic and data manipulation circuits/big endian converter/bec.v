module bec (
    input logic en,
    input logic [31:0] din,
    output logic [31:0] dout
);
    always@*
    begin
        if(en)
        begin
            dout[31:24] = din[7:0];
            dout[23:15] = din[15:7];
            dout[15:7] = din[23:15];
            dout[7:0] = din[31:24];
        end
    end
endmodule
