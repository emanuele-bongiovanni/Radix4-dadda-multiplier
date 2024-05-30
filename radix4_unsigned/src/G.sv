
module G (
    input wire P_i_k, G_i_k,
    input wire G_k_j,
    output G_i_j
);

assign G_i_j = G_i_k | (P_i_k & G_k_j);

endmodule