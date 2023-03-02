// comentario de documentación:
/// Book is a class that represents a book
/// Don't use [getNumberOfPages], instead use [chaptersAndPages]
/// [summary] represents the summary of the book

class Book {
  int id = 1;
  String? title;
  String? author;
  String summary = "";
  int nroPages = 0;

  // En lugar de borrarlo, se pone deprecated para soportar versiones anteriores
  // Es una herramienta creada de programador a programadores al utilizar una librería
  // Ir a la clase deprecated con cmd + click muestra que el constructor es constante
  @Deprecated("Use new method chaptersAndPages")
  int getNumberOfPages(){
    return nroPages;
  }

  // Este método reemplazará a getNumberOfPages
  @VersionRestriction("3.5.1", "We need some new APIs")
  List<int> chaptersAndPages(){
    // lógica para calcular el # de págs por chapter
    return [34,12,23];
  }
}

// creación de anotaciones propias
class VersionRestriction {
  final String version;
  final String reason; // motivo

  const VersionRestriction(this.version, this.reason);
}