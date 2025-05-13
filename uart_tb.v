module uart_tb;
    reg clk;
    reg rst;
    reg tx_start;
    reg [7:0] tx_data;
    wire tx_serial;
    wire tx_done;

    uart_tx uut (   // Instantiating the UART module
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx_serial(tx_serial),  // Removed extra `]`
        .tx_done(tx_done)
    );

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggles every 5 time units
    end

    initial begin
        rst = 1;
        tx_start = 0;
        tx_data = 8'h55; // Example data (ASCII 'U')

        #10 rst = 0; 
        #10 tx_start = 1;
        #10 tx_start = 0;

        #100 $stop; // Extended simulation duration
    end
endmodule
