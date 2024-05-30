module cla(
    input wire [23:0] A, B,
    output reg [5:0] c_out
);

wire[23:0] P0, G0;
wire[11:0] P1, G1;
wire[5:0] P2, G2;
wire[2:0] P3, G3;
wire[1:0] P4, G4;
wire[1:0] P5, G5;

genvar i;

for (i = 0; i < 24; i++) begin
    assign P0[i] = A[i] ^ B[i];
    assign G0[i] = A[i] & B[i];
end

// 1st stage

G G_0_0 (
    .P_i_k(P0[1]),
    .G_i_k(G0[1]),
    .G_k_j(G0[0]),
    .G_i_j(G1[0])
);

PG PG_0_1 (
    .P_i_k(P0[3]),
    .G_i_k(G0[3]),
    .P_k_j(P0[2]),
    .G_k_j(G0[2]),
    .P_i_j(P1[1]),
    .G_i_j(G1[1])
);

PG PG_0_2 (
    .P_i_k(P0[5]),
    .G_i_k(G0[5]),
    .P_k_j(P0[4]),
    .G_k_j(G0[4]),
    .P_i_j(P1[2]),
    .G_i_j(G1[2])
);

PG PG_0_3 (
    .P_i_k(P0[7]),
    .G_i_k(G0[7]),
    .P_k_j(P0[6]),
    .G_k_j(G0[6]),
    .P_i_j(P1[3]),
    .G_i_j(G1[3])
);

PG PG_0_4 (
    .P_i_k(P0[9]),
    .G_i_k(G0[9]),
    .P_k_j(P0[8]),
    .G_k_j(G0[8]),
    .P_i_j(P1[4]),
    .G_i_j(G1[4])
);

PG PG_0_5 (
    .P_i_k(P0[11]),
    .G_i_k(G0[11]),
    .P_k_j(P0[10]),
    .G_k_j(G0[10]),
    .P_i_j(P1[5]),
    .G_i_j(G1[5])
);

PG PG_0_6 (
    .P_i_k(P0[13]),
    .G_i_k(G0[13]),
    .P_k_j(P0[12]),
    .G_k_j(G0[12]),
    .P_i_j(P1[6]),
    .G_i_j(G1[6])
);

PG PG_0_7 (
    .P_i_k(P0[15]),
    .G_i_k(G0[15]),
    .P_k_j(P0[14]),
    .G_k_j(G0[14]),
    .P_i_j(P1[7]),
    .G_i_j(G1[7])
);

PG PG_0_8 (
    .P_i_k(P0[17]),
    .G_i_k(G0[17]),
    .P_k_j(P0[16]),
    .G_k_j(G0[16]),
    .P_i_j(P1[8]),
    .G_i_j(G1[8])
);

PG PG_0_9 (
    .P_i_k(P0[19]),
    .G_i_k(G0[19]),
    .P_k_j(P0[18]),
    .G_k_j(G0[18]),
    .P_i_j(P1[9]),
    .G_i_j(G1[9])
);

PG PG_0_10 (
    .P_i_k(P0[21]),
    .G_i_k(G0[21]),
    .P_k_j(P0[20]),
    .G_k_j(G0[20]),
    .P_i_j(P1[10]),
    .G_i_j(G1[10])
);

PG PG_0_11 (
    .P_i_k(P0[23]),
    .G_i_k(G0[23]),
    .P_k_j(P0[22]),
    .G_k_j(G0[22]),
    .P_i_j(P1[11]),
    .G_i_j(G1[11])
);

// 2nd stage

G G_1_0 (
    .P_i_k(P1[1]),
    .G_i_k(G1[1]),
    .G_k_j(G1[0]),
    .G_i_j(G2[0])
);

PG PG_1_1 (
    .P_i_k(P1[3]),
    .G_i_k(G1[3]),
    .P_k_j(P1[2]),
    .G_k_j(G1[2]),
    .P_i_j(P2[1]),
    .G_i_j(G2[1])
);

PG PG_1_2 (
    .P_i_k(P1[5]),
    .G_i_k(G1[5]),
    .P_k_j(P1[4]),
    .G_k_j(G1[4]),
    .P_i_j(P2[2]),
    .G_i_j(G2[2])
);

PG PG_1_3 (
    .P_i_k(P1[7]),
    .G_i_k(G1[7]),
    .P_k_j(P1[6]),
    .G_k_j(G1[6]),
    .P_i_j(P2[3]),
    .G_i_j(G2[3])
);

PG PG_1_4 (
    .P_i_k(P1[9]),
    .G_i_k(G1[9]),
    .P_k_j(P1[8]),
    .G_k_j(G1[8]),
    .P_i_j(P2[4]),
    .G_i_j(G2[4])
);

PG PG_1_5 (
    .P_i_k(P1[11]),
    .G_i_k(G1[11]),
    .P_k_j(P1[10]),
    .G_k_j(G1[10]),
    .P_i_j(P2[5]),
    .G_i_j(G2[5])
);

// 3rd stage

G G_2_0 (
    .P_i_k(P2[1]),
    .G_i_k(G2[1]),
    .G_k_j(G2[0]),
    .G_i_j(G3[0])
);

PG PG_2_1 (
    .P_i_k(P2[3]),
    .G_i_k(G2[3]),
    .P_k_j(P2[2]),
    .G_k_j(G2[2]),
    .P_i_j(P3[1]),
    .G_i_j(G3[1])
);

PG PG_2_2 (
    .P_i_k(P2[5]),
    .G_i_k(G2[5]),
    .P_k_j(P2[4]),
    .G_k_j(G2[4]),
    .P_i_j(P3[2]),
    .G_i_j(G3[2])
);

// 4th stage

G G_3_0 (
    .P_i_k(P2[2]),
    .G_i_k(G2[2]),
    .G_k_j(G3[0]),
    .G_i_j(G4[0])
);

G G_3_1 (
    .P_i_k(P3[1]),
    .G_i_k(G3[1]),
    .G_k_j(G3[0]),
    .G_i_j(G4[1])
);

// 5th stage

G G_4_0 (
    .P_i_k(P2[4]),
    .G_i_k(G2[4]),
    .G_k_j(G4[1]),
    .G_i_j(G5[0])
);

G G_4_1 (
    .P_i_k(P3[2]),
    .G_i_k(G3[2]),
    .G_k_j(G4[1]),
    .G_i_j(G5[1])
);

// final assignment

assign c_out[0] = G2[0];
assign c_out[1] = G3[0];
assign c_out[2] = G4[0];
assign c_out[3] = G4[1];
assign c_out[4] = G5[0];
assign c_out[5] = G5[1];


endmodule