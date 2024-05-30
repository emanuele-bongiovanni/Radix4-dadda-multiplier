module PG (
    input wire P_i_k, G_i_k,
    input wire P_k_j, G_k_j,
    output P_i_j, G_i_j
);

assign G_i_j = G_i_k | (P_i_k & G_k_j);
assign P_i_j = P_i_k & P_k_j;

endmodule