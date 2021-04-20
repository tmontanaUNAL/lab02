# lab02
Laboratorio 2 - Digital I

Fabián Garzón García

Tizzian Santiago Montana Saavedra

## BDC2SSeg

En la carpetaBDC2SSeg se encuenta el proyecto de quartus para el bloque que pasa de BCD a 7 segmentos.

A continuación se presenta el resultado de la simulacion del bloque
![image](https://user-images.githubusercontent.com/80001669/115319290-0c883300-a145-11eb-8490-6006f72f0f35.png)

Como vemos el bloque toma una entrada en BDC de un solo dígito (4 bits) y en la salida nos da el digito en 7 segmentos, en resumen este es un decoder BCD a 7 segementos.

Aquí se presenta como se relacionan los bits de la salida con el display
![image](https://user-images.githubusercontent.com/80001669/115320137-e19ede80-a146-11eb-8047-0ca35079db35.png)

Tomada de: https://www.hwlibre.com/display-7-segmentos/

En la salida SSeg tenemos que desde el bit mas significativo hasta el menos el orden de los segmentos es abcdefg, con esto en mente se puede verificar que cada digito en BCD se decodifica correctamente en 7 segementos como se muestra en la siguiente imagen:
![image](https://user-images.githubusercontent.com/80001669/115320469-92a57900-a147-11eb-9461-8d7504c45565.png)

Tomada de de: http://juandgallego.blogspot.com/2017/04/manejo-display-7-segmentos-empleando-arduino.html
NOTA: aqui se muestra una entrada en hexadecimal pero solo se probaron los numero de 0 a 9 porque son estos los que interesan en este dispositivo, por ser la entrada en BCD.

https://user-images.githubusercontent.com/80001669/115319346-38a3b400-a145-11eb-9228-902ba3cf8896.mp4


Como se puede evidenciar en el anterior video  las entradas numéricas  se hacen en formato BCD, y  la tarjeta muestra el numero en formato decimal, lo cual es lo coherente con la simulación del testbench realizado en la plataforma quartus.

Cundo se ingresan números en formato BCD , tanto sus unidades como sus decenas tienen que ser menores a 9 dado que del lo contrario se marcara como error , esto es debido a que en formato BCD solo se admiten valores de 0 a 9 en cada posición. 

Es importante notar que los cuatro primeros suich  de derecha a izquierda representan los bits de las unidades, y los 4 suich restantes representan los bits de las  decenas .
