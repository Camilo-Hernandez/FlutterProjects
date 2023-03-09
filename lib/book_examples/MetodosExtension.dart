// Extension methods
// Librería de extensión para las clases Book y String
import 'Book.dart';


// Sin ponerle nombre al conjunto, no puede utilizarse en otros archivos, sólo en este
extension NombreCualquiera on Book {
  // extendiendo el comportamiento de book
  // puedo acceder a sus atributos y métodos
  // Así respeto el principio Open / Close
  String translateToSpanish() {
    var translatedText = summary;
    // traducción mediante algo (api)
    return translatedText;
  }
}

// También puedo ponerle nombre al conjunto de extension methods
extension TranslationFromEnglish on String{
  String toSpanish(){
    return "Este es mi título traducido"; // usando una api de traducción
  }

  int halfLength(){
    return this.length~/2;
  }
}
