

module dadda_tree (
    input wire[11:0] A, B, C, D, E, F,
    input wire cin_A, cin_B, cin_C, cin_D, cin_E, cin_F,
    output reg[21:0] p
);


    //          WIRES
    wire [11:0] Block_0_sum, Block_0_carry;
    wire [15:0] Block_1_sum_1, Block_1_carry_1;
    wire [13:0] Block_1_sum_2, Block_1_carry_2;
    wire [18:0] Block_2_sum, Block_2_carry;
    wire [20:0] Block_3_sum, Block_3_carry;





    //          BLOCK 0
    half_adder ha0_0(A[10], B[8], Block_0_sum[0], Block_0_carry[0]);
    half_adder ha0_1(A[11], B[9], Block_0_sum[1], Block_0_carry[1]);
    half_adder ha0_2(A[11], B[10], Block_0_sum[2], Block_0_carry[2]);
    half_adder ha0_3(A[11], B[11], Block_0_sum[3], Block_0_carry[3]);
    // i seguenti sono tutti estensioni di segno, si potranno togliere
        //half_adder ha0_4(A[11], B[11], Block_0_sum[4], Block_0_carry[4]);
        //half_adder ha0_5(A[11], B[11], Block_0_sum[5], Block_0_carry[5]);
        //half_adder ha0_6(A[11], B[11], Block_0_sum[6], Block_0_carry[6]);
        //half_adder ha0_7(A[11], B[11], Block_0_sum[7], Block_0_carry[7]);
        //half_adder ha0_8(A[11], B[11], Block_0_sum[8], Block_0_carry[8]);
        //half_adder ha0_9(A[11], B[11], Block_0_sum[9], Block_0_carry[9]);
        //half_adder ha0_10(A[11], B[11], Block_0_sum[10], Block_0_carry[10]);
        //half_adder ha0_11(A[11], B[11], Block_0_sum[11], Block_0_carry[11]);
    assign Block_0_sum[4] = Block_0_sum[3];
    assign Block_0_sum[5] = Block_0_sum[3];
    assign Block_0_sum[6] = Block_0_sum[3];
    assign Block_0_sum[7] = Block_0_sum[3];
    assign Block_0_sum[8] = Block_0_sum[3];
    assign Block_0_sum[9] = Block_0_sum[3];
    assign Block_0_sum[10] = Block_0_sum[3];
    assign Block_0_sum[11] = Block_0_sum[3];
    assign Block_0_carry[4] = Block_0_carry[3];
    assign Block_0_carry[5] = Block_0_carry[3];
    assign Block_0_carry[6] = Block_0_carry[3];
    assign Block_0_carry[7] = Block_0_carry[3];
    assign Block_0_carry[8] = Block_0_carry[3];
    assign Block_0_carry[9] = Block_0_carry[3];
    assign Block_0_carry[10] = Block_0_carry[3];
    assign Block_0_carry[11] = Block_0_carry[3];
    


    //          BLOCK 1 PART 1

    half_adder ha1_1_0(A[6], B[4], Block_1_sum_1[0], Block_1_carry_1[0]);
    half_adder ha1_1_1(A[7], B[5], Block_1_sum_1[1], Block_1_carry_1[1]);
    full_adder fa1_1_2(A[8], B[6], C[4], Block_1_sum_1[2], Block_1_carry_1[2]);
    full_adder fa1_1_3(A[9], B[7], C[5], Block_1_sum_1[3], Block_1_carry_1[3]);
    full_adder fa1_1_4(Block_0_sum[0], C[6], D[4], Block_1_sum_1[4], Block_1_carry_1[4]);
    full_adder fa1_1_5(Block_0_sum[1], Block_0_carry[0], C[7], Block_1_sum_1[5], Block_1_carry_1[5]);
    full_adder fa1_1_6(Block_0_sum[2], Block_0_carry[1], C[8], Block_1_sum_1[6], Block_1_carry_1[6]);
    full_adder fa1_1_7(Block_0_sum[3], Block_0_carry[2], C[9], Block_1_sum_1[7], Block_1_carry_1[7]);
    full_adder fa1_1_8(Block_0_sum[4], Block_0_carry[3], C[10], Block_1_sum_1[8], Block_1_carry_1[8]);
    full_adder fa1_1_9(Block_0_sum[5], Block_0_carry[4], C[11], Block_1_sum_1[9], Block_1_carry_1[9]);
    full_adder fa1_1_10(Block_0_sum[6], Block_0_carry[5], C[11], Block_1_sum_1[10], Block_1_carry_1[10]);
    full_adder fa1_1_11(Block_0_sum[7], Block_0_carry[6], C[11], Block_1_sum_1[11], Block_1_carry_1[11]);
    full_adder fa1_1_12(Block_0_sum[8], Block_0_carry[7], C[11], Block_1_sum_1[12], Block_1_carry_1[12]);
    full_adder fa1_1_13(Block_0_sum[9], Block_0_carry[8], C[11], Block_1_sum_1[13], Block_1_carry_1[13]);
    full_adder fa1_1_14(Block_0_sum[10], Block_0_carry[9], C[11], Block_1_sum_1[14], Block_1_carry_1[14]);
    full_adder fa1_1_15(Block_0_sum[11], Block_0_carry[10], C[11], Block_1_sum_1[15], Block_1_carry_1[15]);

    //          BLOCK 1 PART 2

    full_adder fa1_2_0(D[2], cin_E, E[0], Block_1_sum_2[0], Block_1_carry_2[0]);
    half_adder ha1_2_1(D[3], E[1], Block_1_sum_2[1], Block_1_carry_2[1]);
    full_adder fa1_2_2(E[2], cin_F, F[0], Block_1_sum_2[2], Block_1_carry_2[2]);
    full_adder fa1_2_3(D[5], E[3], F[1], Block_1_sum_2[3], Block_1_carry_2[3]);
    full_adder fa1_2_4(D[6], E[4], F[2], Block_1_sum_2[4], Block_1_carry_2[4]);
    full_adder fa1_2_5(D[7], E[5], F[3], Block_1_sum_2[5], Block_1_carry_2[5]);
    full_adder fa1_2_6(D[8], E[6], F[4], Block_1_sum_2[6], Block_1_carry_2[6]);
    full_adder fa1_2_7(D[9], E[7], F[5], Block_1_sum_2[7], Block_1_carry_2[7]);
    full_adder fa1_2_8(D[10], E[8], F[6], Block_1_sum_2[8], Block_1_carry_2[8]);
    full_adder fa1_2_9(D[11], E[9], F[7], Block_1_sum_2[9], Block_1_carry_2[9]);
    full_adder fa1_2_10(D[11], E[10], F[8], Block_1_sum_2[10], Block_1_carry_2[10]);
    full_adder fa1_2_11(D[11], E[11], F[9], Block_1_sum_2[11], Block_1_carry_2[11]);
    full_adder fa1_2_12(D[11], E[11], F[10], Block_1_sum_2[12], Block_1_carry_2[12]);
    full_adder fa1_2_13(D[11], E[11], F[11], Block_1_sum_2[13], Block_1_carry_2[13]);

    //          BLOCK 2

    half_adder ha2_0(A[4], B[2], Block_2_sum[0], Block_2_carry[0]);
    half_adder ha2_1(A[5], B[3], Block_2_sum[1], Block_2_carry[1]);
    full_adder fa2_2(Block_1_sum_1[0], C[2], cin_D, Block_2_sum[2], Block_2_carry[2]);
    full_adder fa2_3(Block_1_sum_1[1], Block_1_carry_1[0], C[3], Block_2_sum[3], Block_2_carry[3]);
    half_adder ha2_4(Block_1_sum_1[2], Block_1_carry_1[1], Block_2_sum[4], Block_2_carry[4]);
    full_adder fa2_5(Block_1_sum_1[3], Block_1_carry_1[2], Block_1_sum_2[1], Block_2_sum[5], Block_2_carry[5]);
    full_adder fa2_6(Block_1_sum_1[4], Block_1_carry_1[3], Block_1_sum_2[2], Block_2_sum[6], Block_2_carry[6]);
    full_adder fa2_7(Block_1_sum_1[5], Block_1_carry_1[4], Block_1_sum_2[3], Block_2_sum[7], Block_2_carry[7]);
    full_adder fa2_8(Block_1_sum_1[6], Block_1_carry_1[5], Block_1_sum_2[4], Block_2_sum[8], Block_2_carry[8]);
    full_adder fa2_9(Block_1_sum_1[7], Block_1_carry_1[6], Block_1_sum_2[5], Block_2_sum[9], Block_2_carry[9]);
    full_adder fa2_10(Block_1_sum_1[8], Block_1_carry_1[7], Block_1_sum_2[6], Block_2_sum[10], Block_2_carry[10]);
    full_adder fa2_11(Block_1_sum_1[9], Block_1_carry_1[8], Block_1_sum_2[7], Block_2_sum[11], Block_2_carry[11]);
    full_adder fa2_12(Block_1_sum_1[10], Block_1_carry_1[9], Block_1_sum_2[8], Block_2_sum[12], Block_2_carry[12]);
    full_adder fa2_13(Block_1_sum_1[11], Block_1_carry_1[10], Block_1_sum_2[9], Block_2_sum[13], Block_2_carry[13]);
    full_adder fa2_14(Block_1_sum_1[12], Block_1_carry_1[11], Block_1_sum_2[10], Block_2_sum[14], Block_2_carry[14]);
    full_adder fa2_15(Block_1_sum_1[13], Block_1_carry_1[12], Block_1_sum_2[11], Block_2_sum[15], Block_2_carry[15]);
    full_adder fa2_16(Block_1_sum_1[14], Block_1_carry_1[13], Block_1_sum_2[12], Block_2_sum[16], Block_2_carry[16]);
    full_adder fa2_17(Block_1_sum_1[15], Block_1_carry_1[14], Block_1_sum_2[13], Block_2_sum[17], Block_2_carry[17]);
    half_adder ha2_18(Block_0_carry[11], Block_1_carry_1[15], Block_2_sum[18], Block_2_carry[18]);

    //          BLOCK 3

    half_adder ha3_0(A[2], cin_B, Block_3_sum[0], Block_3_carry[0]);
    half_adder ha3_1(A[3], B[1], Block_3_sum[1], Block_3_carry[1]);
    full_adder fa3_2(Block_2_sum[0], cin_C, C[0], Block_3_sum[2], Block_3_carry[2]);
    full_adder fa3_3(Block_2_sum[1], Block_2_carry[0], C[1], Block_3_sum[3], Block_3_carry[3]);
    full_adder fa3_4(Block_2_sum[2], Block_2_carry[1], D[0], Block_3_sum[4], Block_3_carry[4]);
    full_adder fa3_5(Block_2_sum[3], Block_2_carry[2], D[1], Block_3_sum[5], Block_3_carry[5]);
    full_adder fa3_6(Block_2_sum[4], Block_2_carry[3], Block_1_sum_2[0], Block_3_sum[6], Block_3_carry[6]);
    full_adder fa3_7(Block_2_sum[5], Block_2_carry[4], Block_1_carry_2[0], Block_3_sum[7], Block_3_carry[7]);
    full_adder fa3_8(Block_2_sum[6], Block_2_carry[5], Block_1_carry_2[1], Block_3_sum[8], Block_3_carry[8]);
    full_adder fa3_9(Block_2_sum[7], Block_2_carry[6], Block_1_carry_2[2], Block_3_sum[9], Block_3_carry[9]);
    full_adder fa3_10(Block_2_sum[8], Block_2_carry[7], Block_1_carry_2[3], Block_3_sum[10], Block_3_carry[10]);
    full_adder fa3_11(Block_2_sum[9], Block_2_carry[8], Block_1_carry_2[4], Block_3_sum[11], Block_3_carry[11]);
    full_adder fa3_12(Block_2_sum[10], Block_2_carry[9], Block_1_carry_2[5], Block_3_sum[12], Block_3_carry[12]);
    full_adder fa3_13(Block_2_sum[11], Block_2_carry[10], Block_1_carry_2[6], Block_3_sum[13], Block_3_carry[13]);
    full_adder fa3_14(Block_2_sum[12], Block_2_carry[11], Block_1_carry_2[7], Block_3_sum[14], Block_3_carry[14]);
    full_adder fa3_15(Block_2_sum[13], Block_2_carry[12], Block_1_carry_2[8], Block_3_sum[15], Block_3_carry[15]);
    full_adder fa3_16(Block_2_sum[14], Block_2_carry[13], Block_1_carry_2[9], Block_3_sum[16], Block_3_carry[16]);
    full_adder fa3_17(Block_2_sum[15], Block_2_carry[14], Block_1_carry_2[10], Block_3_sum[17], Block_3_carry[17]);
    full_adder fa3_18(Block_2_sum[16], Block_2_carry[15], Block_1_carry_2[11], Block_3_sum[18], Block_3_carry[18]);
    full_adder fa3_19(Block_2_sum[17], Block_2_carry[16], Block_1_carry_2[12], Block_3_sum[19], Block_3_carry[19]);
    full_adder fa3_20(Block_2_sum[18], Block_2_carry[17], Block_1_carry_2[13], Block_3_sum[20], Block_3_carry[20]);


    //          last adder

    _24_bit_adder last_adder(
        .A0(A[0]),
        .A1(A[1]),
        .A2(Block_3_sum[0]),
        .A3(Block_3_sum[1]),
        .A4(Block_3_sum[2]),
        .A5(Block_3_sum[3]),
        .A6(Block_3_sum[4]),
        .A7(Block_3_sum[5]),
        .A8(Block_3_sum[6]),
        .A9(Block_3_sum[7]),
        .A10(Block_3_sum[8]),
        .A11(Block_3_sum[9]),
        .A12(Block_3_sum[10]),
        .A13(Block_3_sum[11]),
        .A14(Block_3_sum[12]),
        .A15(Block_3_sum[13]),
        .A16(Block_3_sum[14]),
        .A17(Block_3_sum[15]),
        .A18(Block_3_sum[16]),
        .A19(Block_3_sum[17]),
        .A20(Block_3_sum[18]),
        .A21(Block_3_sum[19]),
        .A22(Block_3_sum[20]),
        .A23(Block_2_carry[18]),
        .B0(cin_A),
        .B1(1'b0),
        .B2(B[0]),
        .B3(Block_3_carry[0]),
        .B4(Block_3_carry[1]),
        .B5(Block_3_carry[2]),
        .B6(Block_3_carry[3]),
        .B7(Block_3_carry[4]),
        .B8(Block_3_carry[5]),
        .B9(Block_3_carry[6]),
        .B10(Block_3_carry[7]),
        .B11(Block_3_carry[8]),
        .B12(Block_3_carry[9]),
        .B13(Block_3_carry[10]),
        .B14(Block_3_carry[11]),
        .B15(Block_3_carry[12]),
        .B16(Block_3_carry[13]),
        .B17(Block_3_carry[14]),
        .B18(Block_3_carry[15]),
        .B19(Block_3_carry[16]),
        .B20(Block_3_carry[17]),
        .B21(Block_3_carry[18]),
        .B22(Block_3_carry[19]),
        .B23(Block_3_carry[20]),
        .sum(p)        
    );

endmodule