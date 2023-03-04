/*
Enunciado:
Un conjunto de restaurantes que no se puede repetir, que contiene varios mapas con nombre, tipo y una lista con calificaciones.
Google requiere que un programador realice un código en Dart para obtener
un resumen de la calificación de los diferentes tipos de restaurantes de una zona.
 Realizando un promedio de las calificaciones por tipo, el resultado debe ser el siguiente.

Map rating = {
“Italiana”: 3.0,
“Argentina”: 2.5,
“Todos”: 2.77
};

Los tipos de comida pueden variar, al igual que las cantidades de la lista de calificación.
*/

void main() {
  final Map<String, double> rating = createRatingMap();
  print("Final map -> $rating");
}

Map<String, double> createRatingMap() {
  Map<String, List<int>> scoresMap = createEmptyScoresMap();
  scoresMap = groupAllScoresInLists(scoresMap);
  var ratingMap = getAverages(scoresMap);
  return ratingMap;
}

Map<String, double> getAverages(Map<String, List<int>> _scoresMap) {
  Map<String, double> _ratingMap = _scoresMap.map((key, value) => MapEntry(
        key,
        value.reduce((a, b) => a + b) / value.length, // Calcular promedio
      ));
  print("Mapa de promedios -> $_ratingMap");
  return _ratingMap;
}

Map<String, List<int>> groupAllScoresInLists(
    Map<String, List<int>> _scoresMap) {
  _scoresMap = groupScoresByCountry(_scoresMap);

  _scoresMap = groupAllScoresInAllList(_scoresMap);
  
  print("Mapa de Scores -> $_scoresMap");
  return _scoresMap;
}

Map<String, List<int>> groupAllScoresInAllList(Map<String, List<int>> __scoresMap) {
  __scoresMap.forEach((key, value) {
    __scoresMap['Todos'] = [...__scoresMap['Todos']!, ...value];
  });
  return __scoresMap;
}

Map<String, List<int>> groupScoresByCountry(Map<String, List<int>> __scoresMap) {
  restaurantes.forEach((restaurante) {
    __scoresMap[restaurante['tipo']] = [
      ...__scoresMap[restaurante['tipo']]!,
      ...restaurante['calificaciones']
    ];
  });
  return __scoresMap;
}

Map<String, List<int>> createEmptyScoresMap() {
  Map<String, List<int>> emptyRatingMap = Map();
  restaurantes.forEach((restaurante) {
    emptyRatingMap.addAll({restaurante['tipo']: []});
  });
  emptyRatingMap.addAll({'Todos': []});
  print("Empty map -> $emptyRatingMap");
  return emptyRatingMap;
}

Set restaurantes = {
  {
    'nombre': 'El novillo alegre',
    'tipo': 'Argentina',
    'calificaciones': [4, 5, 2, 1, 2]
  },
  {
    'nombre': 'Molto bene',
    'tipo': 'Italiana',
    'calificaciones': [4, 3, 1, 1, 5]
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
};
