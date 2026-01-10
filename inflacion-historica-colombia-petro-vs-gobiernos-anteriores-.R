##Crea una función en R que resuelva una ecuación de primer grado (de la forma Ax+B=0). Es decir, los parámetros deben ser los coeficientes (en orden) y la función tiene que devolver la solución. Por ejemplo, si la ecuación es 2x+4=0, la función tendría que devolver -2.

#Una vez creada la función, utilízala para resolver las siguientes ecuaciones de primer grado:
 # 5x+3=0
  #7x+4 = 18
  #x+1 = 1

#creando función 

ecuación_primer = function(a,b){-b/a }

ecuación_primer(5,3)
