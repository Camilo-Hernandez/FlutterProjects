/*
Un conjunto de restaurantes que no se puede repetir, que contiene varios mapas con nombre, tipo y una lista con calificaciones.
Google requiere que un programador realice un código en Dart para obtener
un resumen de la calificación de los diferentes tipos de restaurantes de una zona.
 Realizando un promedio de las calificaciones por tipo, el resultado debe ser el siguiente.

Map rating = {
“Italiana”: 3.0,
“Argentina”: 2.5,
“Todos”: 2.77
};

*/


void main() {
  num totalSum = 0;
  restaurantes.forEach(
          (restaurante) {
        restaurante['calificaciones'].forEach((var e) {
            totalSum += e;
            // TODO: realizar el ejercicio
        }
        );

  print(totalSum);
});
}

Set restaurantes = {
  {
    'nombre': 'El novillo alegre',
    'tipo': 'Argentina',
    'calificaciones': [4, 5, 2, 1, 2]
  },
  {
    'nombre': 'Baires Grill',
    'tipo': 'Argentina',
    'calificaciones': [3, 1, 3, 5, 5, 2, 3]
  },
  {
    'nombre': 'Mario Brothers',
    'tipo': 'Italiana',
    'calificaciones': [4, 3, 2, 1, 1]
  },
  {
    'nombre': 'Molto bene',
    'tipo': 'Italiana',
    'calificaciones': [4, 3, 1, 1, 5]
  }
};
