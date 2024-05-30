module _5_bit_mux(
    input wire [3:0] A,
    input wire [3:0] B,
    input wire sel,
    output reg[3:0] out
);

    always @(*) begin
        case (sel)
            1'b0: out = A;
            1'b1: out = B;
        endcase
    end

endmodule