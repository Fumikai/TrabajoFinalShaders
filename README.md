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
