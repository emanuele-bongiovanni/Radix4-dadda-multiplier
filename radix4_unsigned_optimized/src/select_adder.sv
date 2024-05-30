module select_adder (
    input wire [23:0] A, B,
    input wire [5:0] c_in,
    output reg[23:0] sum
);


wire [3:0]sum_0[5:0];
wire [3:0]sum_1[5:0];
wire [3:0]sum_partial[5:0];

//sum_0, sum_1, sum_partial; 


genvar i;

generate
    for (i = 0; i < 6; i++) begin
        _4_bit_adder add_0 (
            .A(A[i*4+3 : i*4]),
            .B(B[i*4+3 : i*4]),
            .c_in(1'b0),
            .sum(sum_0[i])
        );
        _4_bit_adder add_1 (
            .A(A[i*4+3 : i*4]),
            .B(B[i*4+3 : i*4]),
            .c_in(1'b1),
            .sum(sum_1[i])
        );

        _5_bit_mux mux (
            .A(sum_0[i]),
            .B(sum_1[i]),
            .sel(c_in[i]),
            .out(sum_partial[i])
        );

    end
endgenerate

assign sum = {sum_partial[5], sum_partial[4], sum_partial[3], sum_partial[2], sum_partial[1], sum_partial[0]};

    
endmodule