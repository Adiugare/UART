module uart_tx(
    input wire clk,
    input wire rst,
    input wire tx_start,
    input wire [7:0] tx_data,
    output reg tx_serial,
    output reg tx_done
);

    reg [3:0] bit_index;
    reg [9:0] shift_reg;
    reg busy;
    
always @(posedge clk or posedge rst) begin
    if (rst) begin
        tx_serial <= 1'b1;
        busy <= 0;
        tx_done <= 0;
    end else if (tx_start && !busy) begin
        shift_reg <= {1'b1, tx_data, 1'b0}; // Load start bit, data, stop bit
        bit_index <= 0;
        busy <= 1;
        tx_done <= 0;
    end else if (busy) begin
        tx_serial <= shift_reg[bit_index];
        bit_index <= bit_index + 1; // Corrected increment syntax

        if (bit_index == 9) begin
            busy <= 0;
            tx_done <= 1;
        end
    end
end

endmodule
