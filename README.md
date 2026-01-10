Javier Portillo-Fumikai – Shader de Agua (Cartoon)

Este proyecto consiste en un shader de agua estilo cartoon, diseñado para simular profundidad, movimiento de olas y variación visual mediante ruido procedural (Voronoi/Perlin).

Características principales

Control de profundidad por colores

Sistema de olas animadas basado en el tiempo

Uso de Voronoi + specular para un efecto cartoon

Cambio de color dinámico según la profundidad de la escena

Variables completamente configurables desde el material

Profundidad y cambio de color

El shader utiliza la posición de la cámara junto con la profundidad de la escena para calcular cuándo debe producirse el cambio de color del agua, en función de los elementos con los que colisiona.

<img width="193" height="405" alt="Depth Color Variables" src="https://github.com/user-attachments/assets/f6b2ef97-88ad-4f60-abcc-35bd0ee9dc20" /> <img width="1021" height="371" alt="Depth Calculation" src="https://github.com/user-attachments/assets/c7e517ad-1730-414e-a4c0-b78e08a80bbf" /> <img width="837" height="348" alt="Depth Result" src="https://github.com/user-attachments/assets/b0274d9d-0df7-4448-ade2-a736ebde5f90" />
Animación de olas

Las olas se animan en función del tiempo y de varias variables configurables, lo que permite controlar velocidad, dirección e intensidad del movimiento.

<img width="1359" height="477" alt="Wave Animation Nodes" src="https://github.com/user-attachments/assets/dcf4eb2d-19cd-43f2-8bf7-f2b6e5f94156" /> <img width="1120" height="387" alt="Wave Result" src="https://github.com/user-attachments/assets/bb6f485d-ec58-4981-b4bd-b57050cc2a5e" />
Ruido y estilo cartoon

Mediante el uso de Voronoi y un valor de specular, se genera un efecto similar al Perlin Noise, aportando aleatoriedad y reforzando el estilo visual cartoon del agua.

<img width="1237" height="412" alt="Voronoi Noise" src="https://github.com/user-attachments/assets/1d7b8d20-aeb3-432f-9297-61615250e453" /> <img width="1332" height="616" alt="Cartoon Water Result" src="https://github.com/user-attachments/assets/75afa8c0-caee-4a73-b2cb-7250ecc046bd" />
Configuración del shader

El shader se aplica directamente a una textura/material, desde donde se pueden modificar todos los valores para ajustar el comportamiento visual del agua.

<img width="310" height="361" alt="Material Settings" src="https://github.com/user-attachments/assets/7c2c94da-574b-4b5b-9536-35ea4808ccd7" />
