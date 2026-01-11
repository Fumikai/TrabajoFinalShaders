Fumikai-Javier Portillo: Shader de agua

Las variables creadas para manejar la profundidad por colores, el control de las olas, y el efecto voronoi para dar un resultado mas cartoon.

<img width="193" height="405" alt="image" src="https://github.com/user-attachments/assets/f6b2ef97-88ad-4f60-abcc-35bd0ee9dc20" />

Cogiendo la posicion de la camara y la profundidad escena calcula cuando se debe de manejar el cambio de color en base a los elementos con los que choca el agua.

<img width="1021" height="371" alt="image" src="https://github.com/user-attachments/assets/c7e517ad-1730-414e-a4c0-b78e08a80bbf" />
<img width="837" height="348" alt="image" src="https://github.com/user-attachments/assets/b0274d9d-0df7-4448-ade2-a736ebde5f90" />

En base al tiempo y las variables asignadas, las olas van avanzando.

<img width="1359" height="477" alt="image" src="https://github.com/user-attachments/assets/dcf4eb2d-19cd-43f2-8bf7-f2b6e5f94156" />
<img width="1120" height="387" alt="image" src="https://github.com/user-attachments/assets/bb6f485d-ec58-4981-b4bd-b57050cc2a5e" />

Usando voronoi y dandole un specular a la textura, se crea el efecto perlin noise para dar aleatoriedad al efecto cartoon.

<img width="1237" height="412" alt="image" src="https://github.com/user-attachments/assets/1d7b8d20-aeb3-432f-9297-61615250e453" />
<img width="1332" height="616" alt="image" src="https://github.com/user-attachments/assets/75afa8c0-caee-4a73-b2cb-7250ecc046bd" />

El shader se le puede aplicar a la textura y desde ahi se pueden modificar todos los valores.

<img width="310" height="361" alt="image" src="https://github.com/user-attachments/assets/7c2c94da-574b-4b5b-9536-35ea4808ccd7" />

Sekiroboy-Doménec Gregori: Shader de cesped procedural.

He empezado creando un material y plicandole el shader. La primera parte ha sido aplicar un sombreado al contacto del agua y el suelo en funcion a la altura.

<img width="829" height="375" alt="image" src="https://github.com/user-attachments/assets/735b8a95-ab1b-4d32-b2b3-feda4620c07b" />

Despues he aplicado la generación procedural de cesped por codigo

<img width="1101" height="648" alt="image" src="https://github.com/user-attachments/assets/15440b58-b25f-4861-b10e-fe4e6a820744" />

Aprovechando la altura del terrendo en el mapa conjunto, he decidido crear nieve en las alturas siguiendo el mismo principio que la sombra.

<img width="993" height="641" alt="image" src="https://github.com/user-attachments/assets/97594123-cd8b-40d3-9df0-017734d2a425" />

Finalmente para poder aplicarlo al terreno creado, lo transformamos en maya y ajustamos los parametros para que se ajustasen a su forma.

<img width="429" height="399" alt="image" src="https://github.com/user-attachments/assets/fa9249ef-041e-4619-bd05-6d6fd3360d29" />


<img width="987" height="587" alt="image" src="https://github.com/user-attachments/assets/8b445243-c074-4987-be9f-5163c0de5192" />

Shimadita-Diego Muñoz: Shader de niebla para objetos alejados.

He emepzado creando un onjeto de forma cubo y le he añadido un material de un shader graph.

Despues he creado 4 variables en mi shadergraph, 2 colores ( El color del cubo y luego el color de la niebla) y dos float ( La distancia inicial en la que se empezará a aplicarse el shader y otra para la diostancia en la que el shader esta en su punto maximo).

Despues he creado diferentes nodos, que interactuan entre si para detectar la posicion de la camara para que el shader funcione dependiendo de la distancia en relación a esta. Y luego he añadido un nodo que funciona como fade para esta niebla, para terminar modifique la niebla para que no solo se viera gris pero que tuviera una forma y que fuera moviendose, esto lo añadí con un simple noise que se moviera con el tiempo.

<img width="686" height="487" alt="image" src="https://github.com/user-attachments/assets/8ac57d9e-3865-4922-b7f5-8a82157ec9fd" />

Luego fui moviendome en el editor para comprobar que las distancias de fade in o fade out del shader estaban bien

De cerca:

<img width="1122" height="614" alt="image" src="https://github.com/user-attachments/assets/2e2604a5-b5d9-4d73-b0bb-158c02048dde" />

De lejos:

<img width="1134" height="602" alt="image" src="https://github.com/user-attachments/assets/09708f58-6290-441a-8ed2-b5bd0f888eab" />
