import 'Book.dart';
import 'MetodosExtension.dart';

void main() {
  var book = Book();
  book.summary = "This book is very funny and interesting";

  print(book.translateToSpanish());

  var myName = "Camilo";
  print(myName.halfLength());
}