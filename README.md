Hola
![image](https://github.com/user-attachments/assets/b2a12210-5991-494e-a641-113591452229)
## Testbench

Para el testbench, se utilizaron como parámetros las variables `DL`, `DI` y `DD`, que corresponden a las entradas del sensor de luz y a los sensores de seguimiento de línea ubicados a la izquierda y a la derecha. Decidimos probar todas las 8 combinaciones posibles de señales:

| DL | DI | DD |
|----|----|----|
| 0  | 0  | 0  |
| 0  | 0  | 1  |
| 0  | 1  | 0  |
| 0  | 1  | 1  |
| 1  | 0  | 0  |
| 1  | 0  | 1  |
| 1  | 1  | 0  |
| 1  | 1  | 1  |



Además, incluimos un reloj (`clk`), probando cada una de las combinaciones de los tres primeros parámetros en tres ocasiones, lo que resultó en un total de 24 ciclos de `clk`. Esto se hizo para garantizar un número suficiente de muestras con el `clk` y así evaluar las dos salidas PWM.

Las salidas generadas son dos PWM, uno para cada motor, junto con cuatro señales que controlan los motores: `m1r` (motor uno en reversa), `m1d` (motor uno hacia adelante), `m2r` (motor dos en reversa) y `m2d` (motor dos hacia adelante). Para esta prueba, se utilizó un duty cycle de 9, lo que significa que los PWM estarán activos un poco más de la mitad del tiempo (de ahí la elección de 24 muestras).

Los resultados se presentan a continuación:

**IMAGEN**

Se puede observar el funcionamiento lógico interno: cuando se activa el `DL`, los motores giran en reversa; por defecto, los motores avanzan. Al activar el `DI`, el motor izquierdo se apaga, mientras que al activar el `DD`, el motor derecho se apaga. Además, se puede notar que los PWM estuvieron activos durante 16 de los 24 ciclos.
