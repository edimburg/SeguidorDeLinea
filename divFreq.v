module divFreq (
    input CLK_IN,       // Señal de reloj de entrada
    output reg CLK_OUT  // Señal de reloj de salida dividida
);

    reg [23:0] counter = 0;  // Un contador de 24 bits puede contar hasta 16,777,215

    always @(posedge CLK_IN) begin
        if (counter == 100 - 1) begin
            counter <= 0;
            CLK_OUT <= ~CLK_OUT;  // Invierte el estado del reloj de salida
        end else begin
            counter <= counter + 1;
        end
    end

endmodule
