
module _4_bit_adder(
    input wire [3:0] A,
    input wire [3:0] B,
    input wire c_in,
    output reg[3:0] sum    
);
    wire [4:0] partial;
    assign partial = A + B + c_in;
    assign sum = partial[3:0];


endmodule