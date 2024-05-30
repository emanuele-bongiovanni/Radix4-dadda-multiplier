

module radix_encoder (
    input wire [10:0] X, A,
    output reg[11:0] A_1, A_2, A_3, A_4, A_5, A_6,
    output reg c_1, c_2, c_3, c_4, c_5, c_6
    );
    //nota: i valori di A escono solo come: 0, A o 2A; la negazione è rappresentata dal bit carry


    wire [2:0] X_0;// = {X[1:0], 0};       //first window 
    wire [2:0] X_1;// = X[3:1];            //second window
    wire [2:0] X_2;// = X[5:3];            //third window
    wire [2:0] X_3;// = X[7:5];            //fourth window
    wire [2:0] X_4;// = X[9:7];            //fifth window
    wire [2:0] X_5;// = {X[10], X[10:9]};  //sixth window

    assign X_0 = {X[1:0], 1'b0};
    assign X_1 = X[3:1];
    assign X_2 = X[5:3];
    assign X_3 = X[7:5];
    assign X_4 = X[9:7];
    assign X_5 = {1'b0, X[10:9]};

    always @(X, A) begin
        
        // 1st window
        case (X_0)
            3'b000: begin           // 0
                        A_1 = 0;
                        c_1 = 0;
                    end
            3'b001: begin           // A
                        A_1 = {1'b0, A};
                        c_1 = 0;
                    end           
            3'b010: begin           // A
                        A_1 = {1'b0, A};
                        c_1 = 0;
                    end 
            3'b011: begin           // 2A
                        A_1 = {A, 1'b0};
                        c_1 = 0;
                    end       
            3'b100: begin           // -2A
                        A_1 = ~{A, 1'b0};
                        c_1 = 1;
                    end
            3'b101: begin           // -A
                        A_1 = ~{1'b0, A};         
                        c_1 = 1;
                    end 
            3'b110: begin           // -A
                        A_1 = ~{1'b0, A};
                        c_1 = 1;
                    end 
            3'b111: begin           // 0
                        A_1 = 0;
                        c_1 = 0;
                    end 
        endcase

        // 2nd window
        case (X_1)
            3'b000: begin           // 0
                        A_2 = 0;
                        c_2 = 0;
                    end
            3'b001: begin           // A
                        A_2 = {1'b0, A};
                        c_2 = 0;
                    end           
            3'b010: begin           // A
                        A_2 = {1'b0, A};
                        c_2 = 0;
                    end 
            3'b011: begin           // 2A
                        A_2 = {A, 1'b0};
                        c_2 = 0;
                    end       
            3'b100: begin           // -2A
                        A_2 = ~{A, 1'b0};
                        c_2 = 1;
                    end
            3'b101: begin           // -A
                        A_2 = ~{1'b0, A}; ;
                        c_2 = 1;
                    end 
            3'b110: begin           // -A
                        A_2 = ~{1'b0, A}; ;
                        c_2 = 1;
                    end 
            3'b111: begin           // 0
                        A_2 = 0;
                        c_2 = 0;
                    end 
        endcase

        // 3rd window
        case (X_2)
            3'b000: begin           // 0
                        A_3 = 0;
                        c_3 = 0;
                    end
            3'b001: begin           // A
                        A_3 = {1'b0, A};
                        c_3 = 0;
                    end           
            3'b010: begin           // A
                        A_3 = {1'b0, A};
                        c_3 = 0;
                    end 
            3'b011: begin           // 2A
                        A_3 = {A, 1'b0};
                        c_3 = 0;
                    end       
            3'b100: begin           // -2A
                        A_3 = ~{A, 1'b0};
                        c_3 = 1;
                    end
            3'b101: begin           // -A
                        A_3 = ~{1'b0, A};
                        c_3 = 1;
                    end 
            3'b110: begin           // -A
                        A_3 = ~{1'b0, A};
                        c_3 = 1;
                    end 
            3'b111: begin           // 0
                        A_3 = 0;
                        c_3 = 0;
                    end
        endcase

        // 4th window
        case (X_3)
            3'b000: begin           // 0
                        A_4 = 0;
                        c_4 = 0;
                    end
            3'b001: begin           // A
                        A_4 = {1'b0, A};
                        c_4 = 0;
                    end           
            3'b010: begin           // A
                        A_4 = {1'b0, A};
                        c_4 = 0;
                    end 
            3'b011: begin           // 2A
                        A_4 = {A, 1'b0};
                        c_4 = 0;
                    end       
            3'b100: begin           // -2A
                        A_4 = ~{A, 1'b0};
                        c_4 = 1;
                    end
            3'b101: begin           // -A
                        A_4 = ~{1'b0, A};
                        c_4 = 1;
                    end 
            3'b110: begin           // -A
                        A_4 = ~{1'b0, A};
                        c_4 = 1;
                    end 
            3'b111: begin           // 0
                        A_4 = 0;
                        c_4 = 0;
                    end
        endcase

        // 5th window
        case (X_4)
            3'b000: begin           // 0
                        A_5 = 0;
                        c_5 = 0;
                    end
            3'b001: begin           // A
                        A_5 = {1'b0, A};
                        c_5 = 0;
                    end           
            3'b010: begin           // A
                        A_5 = {1'b0, A};
                        c_5 = 0;
                    end 
            3'b011: begin           // 2A
                        A_5 = {A, 1'b0};
                        c_5 = 0;
                    end       
            3'b100: begin           // -2A
                        A_5 = ~{A, 1'b0};
                        c_5 = 1;
                    end
            3'b101: begin           // -A
                        A_5 = ~{1'b0, A};
                        c_5 = 1;
                    end 
            3'b110: begin           // -A
                        A_5 = ~{1'b0, A};
                        c_5 = 1;
                    end 
            3'b111: begin           // 0
                        A_5 = 0;
                        c_5 = 0;
                    end
        endcase

        // 6th window
        case (X_5)
            3'b000: begin           // 0
                        A_6 = 0;
                        c_6 = 0;
                    end
            3'b001: begin           // A
                        A_6 = {1'b0, A};
                        c_6 = 0;
                    end           
            3'b010: begin           // A
                        A_6 = {1'b0, A};
                        c_6 = 0;
                    end 
            3'b011: begin           // 2A
                        A_6 = {A, 1'b0};
                        c_6 = 0;
                    end       
            3'b100: begin           // -2A
                        A_6 = ~{A, 1'b0};
                        c_6 = 1;
                    end
            3'b101: begin           // -A
                        A_6 = ~{1'b0, A};
                        c_6 = 1;
                    end 
            3'b110: begin           // -A
                        A_6 = ~{1'b0, A};
                        c_6 = 1;
                    end 
            3'b111: begin           // 0
                        A_6 = 0;
                        c_6 = 0;
                    end
        endcase
       
    end

endmodule