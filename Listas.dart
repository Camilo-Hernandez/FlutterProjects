// Colections and iterables
void main() {
  List<String> names = ["Camilo", "María Clara", "María Cecilia", "Eduardo"];
  print(names.first);
  print(names.last);
  names.forEach(print);

  var isThereANameWithC = names.any((element) => element.contains('C'));
  print("Cualquiera que tenga C: $isThereANameWithC");

  var areAllNamesWithC = names.every((element) => element.contains('E'));
  print('Todos contienen E?: $areAllNamesWithC');

  // Mapear valores
  var upperNames = names.map((e) => e.toUpperCase());
  print(upperNames);

  Set<int> scores = {232, 121, 5, 123000};
  
  // Aplicar una función a todos
  var newScores = scores.map((e) => e.isEven);
  print(newScores);

  // Filtrar valores
  var filteredScores = scores.where((score) => score > 100);
  filteredScores.forEach(print);

  // Encontrar el primero que cumpla
  var filteredScore;
  try {
    filteredScore = scores.firstWhere((score) => score < 0);
    print(filteredScore);
  } on StateError {
    filteredScore = -1;
  }

  // Encontrar el último que cumpla
  try {
    var filteredScore2 =
    scores.lastWhere((element) => element > 100,
        orElse: () => -1);
    print(filteredScore2);
  } catch (e) {
    // Saber el tipo de exception
    print(e.runtimeType);
  }
}
