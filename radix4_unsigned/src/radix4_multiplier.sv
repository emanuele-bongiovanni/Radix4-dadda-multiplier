


module radix4_mult (
    input wire[10:0] a_in,
    input wire[10:0] x_in,
    output reg [21:0] p_out
);
    wire [11:0] A, B, C, D, E, F;
    wire cin_A, cin_B, cin_C, cin_D, cin_E, cin_F;

    radix_encoder enc(
        .X(x_in),
        .A(a_in),
        .A_1(A),
        .A_2(B),
        .A_3(C),
        .A_4(D),
        .A_5(E),
        .A_6(F),
        .c_1(cin_A),
        .c_2(cin_B),
        .c_3(cin_C),
        .c_4(cin_D),
        .c_5(cin_E),
        .c_6(cin_F)
    );

    dadda_tree tree(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),
        .F(F),
        .cin_A(cin_A),
        .cin_B(cin_B),
        .cin_C(cin_C),
        .cin_D(cin_D),
        .cin_E(cin_E),
        .cin_F(cin_F),
        .p(p_out)
    );


endmodule

