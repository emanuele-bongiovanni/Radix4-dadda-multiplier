# Radix-4 Multiplier with Dadda Tree

## Overview

This project implements a high-performance hardware multiplier using Radix-4 encoding combined with a Dadda tree structure. Designed in SystemVerilog, this multiplier is optimized for fast and efficient computation, making it ideal for digital signal processing and other applications requiring rapid multiplication.

## Features

- **Radix-4 Encoding**: Converts the multiplicand into partial products for efficient processing.
- **Dadda Tree**: Utilizes a Dadda tree for summing partial products, reducing the overall computation time and hardware complexity.
- **Modular Design**: Composed of modular SystemVerilog files, allowing easy integration and reuse in other projects.

## Folder Structure

- radix4_signed : signed version, of course not usable inside the multiplier 
    - sim : compilation and simulation scripts
    - src : source files, include files of the final adder
    - tb : system verilog testbench for the multiplier
- radix4_unsigned : First unsigned version, without the sign compression in the Dadda
    - sim : compilation and simulation scripts
    - src : source files, include files of the final adder
    - tb : system verilog testbench for the multiplier
- radix4_unsigned_optimized : Final version with the compression implemented
    - sim : compilation and simulation scripts
    - src : source files, include files of the final adder
    - tb : system verilog testbench for the multiplier

## Usage

To use this multiplier, instantiate the `radix4_mult` module in your Verilog project and provide the necessary inputs. Below is an example of how to include and use the multiplier in your own code:

```verilog
module example_usage();
    reg [10:0] a, x;
    wire [21:0] product;

    radix4_mult multiplier (
        .a_in(a),
        .x_in(x),
        .p_out(product)
    );

    initial begin
        a = 11'b10101010101;
        x = 11'b11001100110;
        #10;
        $display("Product: %d", product);
    end
endmodule


