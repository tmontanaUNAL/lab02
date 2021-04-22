module sumador1 (A, B, Ci,Cout,S);// la linea 1 inicia la descripcion del modulo de suma 
//en donde se le da un nombre y entre parentesis se coloca las variables que manejara 

  input  A;
  input  B; // En estas linea de codigo  se definan para cada variable culaes son  las entradas y salidas deL sumador
  input  Ci;
  output Cout; 
  output S;

  reg [1:0] st;//representan un elemento de almacenamiento de datos y conserva dicho valor hasta que se les asigna el siguiente valor

  assign S = st[0];// en esta linea se asignan los valores al eleento delamacenamiento 
  assign Cout = st[1];

  always @ ( * ) begin
  	st  = 	A+B+Ci;     // se construye la lista de sensibilidad , en donde st es sensible respecto a los cambios de    
  end
                        //A , B o Ci y cada vez que estos cambian tambien los hace en una lista 
endmodule // cierra la descrpcion del modulo
