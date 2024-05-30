

module _24_bit_adder (
    input wire A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23,
    input wire B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11, B12, B13, B14, B15, B16, B17, B18, B19, B20, B21, B22, B23,
    output reg[21:0] sum
);

//   DA IMPLEMENTARE COME NECESSARIO

wire [23:0] A = {A23, A22, A21, A20, A19, A18, A17, A16, A15, A14, A13, A12, A11, A10, A9, A8, A7, A6, A5, A4, A3, A2, A1, A0};
wire [23:0] B = {B23, B22, B21, B20, B19, B18, B17, B16, B15, B14, B13, B12, B11, B10, B9, B8, B7, B6, B5, B4, B3, B2, B1, B0};
wire [23:0] sum_s;
wire [5:0] carry;

cla carry_lookahead(
    .A(A),
    .B(B),
    .c_out(carry)
);

select_adder adder(
    .A(A),
    .B(B),
    .c_in({carry[4:0], 1'b0}),
    .sum(sum_s)
);

assign sum = sum_s[21:0];

endmodule