

module dadda_tree (
    input wire[11:0] A, B, C, D, E, F,
    input wire cin_A, cin_B, cin_C, cin_D, cin_E, cin_F,
    output reg[21:0] p
);


    //          WIRES
    wire [11:0] Block_0_sum_1, Block_0_carry_1;
    wire [7:0] Block_0_sum_2, Block_0_carry_2;
    wire [15:0] Block_1_sum, Block_1_carry;
    wire [19:0] Block_2_sum, Block_2_carry;


    //          BLOCK 0 PART 1

    half_adder ha0_0_1(A[6], B[4], Block_0_sum_1[0], Block_0_carry_1[0]);
    full_adder fa0_1_1(A[7], B[5], C[3], Block_0_sum_1[1], Block_0_carry_1[1]);
    full_adder fa0_2_1(A[8], B[6], C[4], Block_0_sum_1[2], Block_0_carry_1[2]);
    full_adder fa0_3_1(A[9], B[7], C[5], Block_0_sum_1[3], Block_0_carry_1[3]);
    full_adder fa0_4_1(A[10], B[8], C[6], Block_0_sum_1[4], Block_0_carry_1[4]);
    full_adder fa0_5_1(A[11], B[9], C[7], Block_0_sum_1[5], Block_0_carry_1[5]);
    full_adder fa0_6_1(cin_A, B[10], C[8], Block_0_sum_1[6], Block_0_carry_1[6]);
    full_adder fa0_7_1(cin_A, B[11], C[9], Block_0_sum_1[7], Block_0_carry_1[7]);
    full_adder fa0_8_1(~cin_A, ~cin_B, C[10], Block_0_sum_1[8], Block_0_carry_1[8]);
    full_adder fa0_9_1(1'b1, C[11], D[9], Block_0_sum_1[9], Block_0_carry_1[9]);
    full_adder fa0_10_1(~cin_C, D[10], E[8], Block_0_sum_1[10], Block_0_carry_1[10]);
    half_adder ha0_11_1(1'b1, D[11], Block_0_sum_1[11], Block_0_carry_1[11]);

    //          BLOCK 0 PART 2

    full_adder fa0_0_2(D[2], E[0], cin_E, Block_0_sum_2[0], Block_0_carry_2[0]);
    half_adder ha0_1_2(D[3], E[1], Block_0_sum_2[1], Block_0_carry_2[1]);
    full_adder fa0_2_2(D[4], E[2], F[0], Block_0_sum_2[2], Block_0_carry_2[2]);
    full_adder fa0_3_2(D[5], E[3], F[1], Block_0_sum_2[3], Block_0_carry_2[3]);
    full_adder fa0_4_2(D[6], E[4], F[2], Block_0_sum_2[4], Block_0_carry_2[4]);
    full_adder fa0_5_2(D[7], E[5], F[3], Block_0_sum_2[5], Block_0_carry_2[5]);
    full_adder fa0_6_2(D[8], E[6], F[4], Block_0_sum_2[6], Block_0_carry_2[6]);
    half_adder ha0_7_2(E[7], F[5], Block_0_sum_2[7], Block_0_carry_2[7]);

    //          BLOCK 1 

    half_adder ha1_0(A[4], B[2], Block_1_sum[0], Block_1_carry[0]);
    half_adder ha1_1(A[5], B[3], Block_1_sum[1], Block_1_carry[1]);
    full_adder fa1_2(Block_0_sum_1[0], C[2], D[0], Block_1_sum[2], Block_1_carry[2]);
    half_adder ha1_3(Block_0_sum_1[1], Block_0_carry_1[0], Block_1_sum[3], Block_1_carry[3]);
    half_adder ha1_4(Block_0_sum_1[2], Block_0_carry_1[1], Block_1_sum[4], Block_1_carry[4]);
    full_adder fa1_5(Block_0_sum_1[3], Block_0_carry_1[2], Block_0_sum_2[1], Block_1_sum[5], Block_1_carry[5]);
    full_adder fa1_6(Block_0_sum_1[4], Block_0_carry_1[3], Block_0_sum_2[2], Block_1_sum[6], Block_1_carry[6]);
    full_adder fa1_7(Block_0_sum_1[5], Block_0_carry_1[4], Block_0_sum_2[3], Block_1_sum[7], Block_1_carry[7]);
    full_adder fa1_8(Block_0_sum_1[6], Block_0_carry_1[5], Block_0_sum_2[4], Block_1_sum[8], Block_1_carry[8]);
    full_adder fa1_9(Block_0_sum_1[7], Block_0_carry_1[6], Block_0_sum_2[5], Block_1_sum[9], Block_1_carry[9]);
    full_adder fa1_10(Block_0_sum_1[8], Block_0_carry_1[7], Block_0_sum_2[6], Block_1_sum[10], Block_1_carry[10]);
    full_adder fa1_11(Block_0_sum_1[9], Block_0_carry_1[8], Block_0_sum_2[7], Block_1_sum[11], Block_1_carry[11]);
    full_adder fa1_12(Block_0_sum_1[10], Block_0_carry_1[9], Block_0_carry_2[7], Block_1_sum[12], Block_1_carry[12]);
    full_adder fa1_13(Block_0_sum_1[11], Block_0_carry_1[10], E[9], Block_1_sum[13], Block_1_carry[13]);
    full_adder fa1_14(Block_0_carry_1[11], ~cin_D, E[10], Block_1_sum[14], Block_1_carry[14]);
    half_adder ha1_15(1'b1, E[11], Block_1_sum[15], Block_1_carry[15]);

    //          BLOCK 2

    half_adder ha2_0(A[2], B[0], Block_2_sum[0], Block_2_carry[0]);
    half_adder ha2_1(A[3], B[1], Block_2_sum[1], Block_2_carry[1]);
    full_adder fa2_2(Block_1_sum[0], C[0], cin_C, Block_2_sum[2], Block_2_carry[2]);
    full_adder ha2_3(Block_1_sum[1], Block_1_carry[0], C[1], Block_2_sum[3], Block_2_carry[3]);
    full_adder fa2_4(Block_1_sum[2], Block_1_carry[1], cin_D, Block_2_sum[4], Block_2_carry[4]);
    full_adder fa2_5(Block_1_sum[3], Block_1_carry[2], D[1], Block_2_sum[5], Block_2_carry[5]);
    full_adder fa2_6(Block_1_sum[4], Block_1_carry[3], Block_0_sum_2[0], Block_2_sum[6], Block_2_carry[6]);
    full_adder fa2_7(Block_1_sum[5], Block_1_carry[4], Block_0_carry_2[0], Block_2_sum[7], Block_2_carry[7]);
    full_adder fa2_8(Block_1_sum[6], Block_1_carry[5], Block_0_carry_2[1], Block_2_sum[8], Block_2_carry[8]);
    full_adder fa2_9(Block_1_sum[7], Block_1_carry[6], Block_0_carry_2[2], Block_2_sum[9], Block_2_carry[9]);
    full_adder fa2_10(Block_1_sum[8], Block_1_carry[7], Block_0_carry_2[3], Block_2_sum[10], Block_2_carry[10]);
    full_adder fa2_11(Block_1_sum[9], Block_1_carry[8], Block_0_carry_2[4], Block_2_sum[11], Block_2_carry[11]);
    full_adder fa2_12(Block_1_sum[10], Block_1_carry[9], Block_0_carry_2[5], Block_2_sum[12], Block_2_carry[12]);
    full_adder fa2_13(Block_1_sum[11], Block_1_carry[10], Block_0_carry_2[6], Block_2_sum[13], Block_2_carry[13]);
    full_adder fa2_14(Block_1_sum[12], Block_1_carry[11], F[6], Block_2_sum[14], Block_2_carry[14]);
    full_adder fa2_15(Block_1_sum[13], Block_1_carry[12], F[7], Block_2_sum[15], Block_2_carry[15]);
    full_adder fa2_16(Block_1_sum[14], Block_1_carry[13], F[8], Block_2_sum[16], Block_2_carry[16]);
    full_adder fa2_17(Block_1_sum[15], Block_1_carry[14], F[9], Block_2_sum[17], Block_2_carry[17]);
    full_adder fa2_18(Block_1_carry[15], ~cin_E, F[10], Block_2_sum[18], Block_2_carry[18]);
    half_adder ha2_19(1'b1, F[11], Block_2_sum[19], Block_2_carry[19]);


    //          last adder

    _24_bit_adder last_adder(
        .A0(A[0]),
        .A1(A[1]),
        .A2(Block_2_sum[0]),
        .A3(Block_2_sum[1]),
        .A4(Block_2_sum[2]),
        .A5(Block_2_sum[3]),
        .A6(Block_2_sum[4]),
        .A7(Block_2_sum[5]),
        .A8(Block_2_sum[6]),
        .A9(Block_2_sum[7]),
        .A10(Block_2_sum[8]),
        .A11(Block_2_sum[9]),
        .A12(Block_2_sum[10]),
        .A13(Block_2_sum[11]),
        .A14(Block_2_sum[12]),
        .A15(Block_2_sum[13]),
        .A16(Block_2_sum[14]),
        .A17(Block_2_sum[15]),
        .A18(Block_2_sum[16]),
        .A19(Block_2_sum[17]),
        .A20(Block_2_sum[18]),
        .A21(Block_2_sum[19]),
        .A22(1'b0),
        .A23(1'b0),
        .B0(cin_A),
        .B1(1'b0),
        .B2(cin_B),
        .B3(Block_2_carry[0]),
        .B4(Block_2_carry[1]),
        .B5(Block_2_carry[2]),
        .B6(Block_2_carry[3]),
        .B7(Block_2_carry[4]),
        .B8(Block_2_carry[5]),
        .B9(Block_2_carry[6]),
        .B10(Block_2_carry[7]),
        .B11(Block_2_carry[8]),
        .B12(Block_2_carry[9]),
        .B13(Block_2_carry[10]),
        .B14(Block_2_carry[11]),
        .B15(Block_2_carry[12]),
        .B16(Block_2_carry[13]),
        .B17(Block_2_carry[14]),
        .B18(Block_2_carry[15]),
        .B19(Block_2_carry[16]),
        .B20(Block_2_carry[17]),
        .B21(Block_2_carry[18]),
        .B22(Block_2_carry[19]),
        .B23(1'b0),
        .sum(p)        
    );

endmodule