module half_adder (
    input a,
    input b,
    output reg sum, cout
);

    always @(a, b) begin
        sum = a ^ b;
        cout = a & b;
    end  

endmodule   