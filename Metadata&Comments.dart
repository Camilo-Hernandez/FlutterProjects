// Metadata == anotations
// @override
// @deprecated
import 'Book.dart';

void main(){
  var book = Book();
  book.nroPages = 10;
  print(book.getNumberOfPages());
  book.chaptersAndPages();

  // Reflection
  // Aceder a anotaciones en tiempo de ejecución mediante "Reflection". No es tan necesario
}