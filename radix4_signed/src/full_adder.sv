
module full_adder (
    input wire a,
    input wire b,
    input wire cin,
    output reg sum,
    output reg cout
);

    always @(a, b, cin) begin
        sum = a ^ b ^ cin;
        cout = (a & b) | (a & cin) | (b & cin);
    end  

endmodule