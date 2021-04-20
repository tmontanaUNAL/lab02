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

assign enable = cfreq[12]; // se selecciona la frecuencia deseada luego de dividirla
assign led =enable;
always @(posedge clk) begin // se activa cada vez que se ecuentre el flanco de subida del reloj
  if(rst==0) begin // reseteo si el reset esta en 1
		cfreq <= 0; // se resetea la frecuencia a 0
	end else begin
		cfreq <=cfreq+1; // le sumo 1 al registro de la frecuencia
	end
end
// Seleccion del anodo y del digito

wire[3:0] dig_uni;
wire[3:0] dig_dec;
//wire[3:0] dig_cen;
//wire[3:0] dig_miles;
//wire[3:0] dig_decmiles;

assign dig_uni=num % 10;
assign dig_dec=(num/10) % 10;
//assign dig_cen=(num/100) % 10;
//assign dig_miles=(num/1000) % 10;
//assign dig_decmiles=(num/10000) % 10;




reg [2:0] count =0; // contador que me indicara el display a activar

always @(posedge enable) begin
		if(rst==0) begin // reseteo si el reset esta en 1
			count<= 0; // se resetea el contador
			an<=5'b11111; // se apagan todos los displays
			
		end 
	if((num[3:0]>9)||(num[7:4]>9))begin
				
				count<= count+1; // se le suma 1 al contador
			case (count) // dependiendo del contador se activa un display distinto y muestra su
						// digito correspondiente
				
				3'h0: begin bcd <=4'ha; an<=5'b11110; end
				3'h1: begin bcd <=4'h0; an<=5'b11101; end
				3'h2: begin bcd <=4'ha; an<=5'b11011; end
				3'h3: begin bcd <=4'ha; an<=5'b10111; end
				3'h4: begin bcd <=4'he; an<=5'b01111; end
				
				
			endcase
			
			end

	else begin 
			count<= count+1; // se le suma 1 al contador
			case (count) // dependiendo del contador se activa un display distinto y muestra su
						// digito correspondiente
				
				3'h0: begin bcd <= num[3:0]; an<=5'b11110; end
				3'h1: begin bcd <= num[7:4]; an<=5'b11101; end
				//3'h2: begin bcd <= dig_cen; an<=5'b11011; end
				//3'h3: begin bcd <= dig_miles; an<=5'b10111; end
				//3'h4: begin bcd <= dig_decmiles; an<=5'b01111; end
				
				
			endcase
			
		end
end

endmodule
