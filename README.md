# lab02
Laboratorio 2 - Digital I

Fabián Garzón García

Tizzian Santiago Montana Saavedra

## BDC2SSeg

En la carpeta BDC2SSeg se encuenta el proyecto de quartus para este el módulo

A continuación se presenta el resultado de la simulacion del modulo
![image](https://user-images.githubusercontent.com/80001669/115319290-0c883300-a145-11eb-8490-6006f72f0f35.png)

Como vemos el módulo toma una entrada en BDC de un solo dígito (4 bits) y en la salida nos da el digito en 7 segmentos, en resumen este es un decoder BCD a 7 segementos.

Aquí se presenta como se relacionan los bits de la salida con el display
![image](https://user-images.githubusercontent.com/80001669/115320137-e19ede80-a146-11eb-8047-0ca35079db35.png)

Tomada de: https://www.hwlibre.com/display-7-segmentos/

En la salida SSeg tenemos que desde el bit mas significativo hasta el menos el orden de los segmentos es abcdefg, con esto en mente se puede verificar que cada digito en BCD se decodifica correctamente en 7 segementos como se muestra en la siguiente imagen:
![image](https://user-images.githubusercontent.com/80001669/115320469-92a57900-a147-11eb-9461-8d7504c45565.png)

Tomada de de: http://juandgallego.blogspot.com/2017/04/manejo-display-7-segmentos-empleando-arduino.html


## BDC2SSeg de 2 digitos con visualizacion dinamica

En la carpeta Lab_2b se encuenta el proyecto de quartus para este módulo.

Este permite entrada en binario de 8 bits, además, el resultado se da en decimal en los 7 segmentos.

Aqui se presenta la simulacion con el numero de entrada 255 en decimal o F4 en hexadecimal.
![image](https://user-images.githubusercontent.com/80001669/115978104-ef87a180-a542-11eb-994c-ebcd94075288.png)

Vemos que en los displays se muestran correctamente todos los dígitos, ademas se ve que cada display solo esta prendido por cierto tiempo y van tomando turnos, esto es la visualizacion dinámica. 

En el  video se evidencia la implementación del codigo en la FPGA :https://drive.google.com/file/d/1gpFLedrhN5KCcyPYjCq1bApLgi-wcyVn/view?usp=sharing


En este video se evidencia la implementación del código que nos permite convertir de binario a BCD  para luego mostrar este resultado, y se puede ver que funciona de manera adecuado , dado que se ingresan los números en formato binario de 8 bit y los 3 display lo muestran con formato decimal, en este video se prueban diferentes cantidades binarias para asegurarnos del correcto funcionamiento.

## Reto
El reto propuesto fue el de unir el BDC2SSeg con el sumador de 4 bit de la anterior práctica , se presenta a continuación un video que evidencia la implementación  :


Videao de BDC2SSeg con sumador de 4 bit:https://drive.google.com/file/d/1mWOOo89lWZh9XXA2QTRMmRTOb94BeKT0/view?usp=sharing


En el anterior video se muestra que el sumador de 4 bit y el BDC2SSeg , los cuatro primeros switch  representan el primer numero binario , y los 4 restantes representan el segundo numero binario , es así que se puede evidenciar que   ambos componentes funcionan de manera adecuada, dado que se ingresan en formato binario varios números los cuales son mostrados en forma.

