`timescale 1ns / 1ps
// este modulo es la caja negra que convierte el numero HEX de 4 digitos y lo muestra en 4 displays
// usando visualización dinámica.
module Hex2SSeg(
    input [7:0] num, // numero a mostrar
    input clk, // reloj
    output [6:0] sseg, // salidas hacia los displays
    output reg [4:0] an, // indica que display esta encendido por medio de su anodo
	 input rst, // si es 1 resetea el dispositivo
	 output led
    );



reg [3:0]bcd=0; // registro que solo puede guardar un digito del numero de entrada
//wire [15:0] num=16'h4321;

BCDtoSSeg bcdtosseg(.BCD(bcd), .SSeg(sseg)); // instanciacion del conversor BCD se un digito

reg [26:0] cfreq=0; // aqui se guarda la frecuencia
wire enable; // activa la visualizacion dinamica cada vez que se hace 1

// Divisor de frecuecia

assign enable = cfreq[5]; // se selecciona la frecuencia deseada luego de dividirla, se divide en 2^n siendo n el bit escogido de cfreq
assign led =enable;
always @(posedge clk) begin // se activa cada vez que se ecuentre el flanco de subida del reloj
  if(rst==0) begin // reseteo si el reset esta en 0 (ya que el boton en la tarjeta da un 0 al oprimirlo)
		cfreq <= 0; // se resetea la frecuencia a 0
	end else begin
		cfreq <=cfreq+1; // le sumo 1 al registro de la frecuencia
	end
end
// Seleccion del anodo y del digito

reg [2:0] count_error =0; // contador que me indicara el display a activar mientras se muestra el mensaje de error
reg count_numero =0; // contador que me indicara el display a activar mientra se muestra el numero ingresado

always @(posedge enable) begin
		if(rst==0) begin // reseteo si el reset esta en 0 (ya que el boton en la tarjeta da un 0 al oprimirlo)
			count_error<= 0; // se resetea el contador
			count_numero<= 0; // se resetea el contador
			an<=5'b11111; // se apagan todos los displays
			
		end 
	if((num[3:0]>9)||(num[7:4]>9))begin // si cualquiera de los digitos de la entrada es mayor a 9 se muestra el mensaje error
				
			count_error<= count_error+1;
			case (count_error) 
				
				3'h0: begin bcd <=4'ha; an<=5'b11110; end
				3'h1: begin bcd <=4'h0; an<=5'b11101; end
				3'h2: begin bcd <=4'ha; an<=5'b11011; end
				3'h3: begin bcd <=4'ha; an<=5'b10111; end
				3'h4: begin bcd <=4'he; an<=5'b01111; end			
			endcase	
	end
	else begin 
			count_numero<= count_numero+1; // se le suma 1 al contador
			case (count_numero) // dependiendo del contador se activa un display distinto y muestra su
						// digito correspondiente
				
				1'h0: begin bcd <= num[3:0]; an<=5'b11110; end
				1'h1: begin bcd <= num[7:4]; an<=5'b11101; end			
			endcase
			
		end
end

endmodule
