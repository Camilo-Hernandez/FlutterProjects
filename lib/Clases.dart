// Clases

void main() {
  var book = Book("1984", "George Orwell", 30);
  print(book.title);

  var notebook = Book.blankBook();
  print(notebook);

  var enciclopedyBook = Book.multipleAuthorsBook(
      "El Sistema Solar", ["Albert Einstein", "Carl Sagan"], 200);
  print(enciclopedyBook.author);

  var canBeEitherJsonOrBlank = Book.fromJson({
    "title": "Mi historia",
    "Editorial": "Planeta",
    "No Paginas": "210",
    "author": "Juan Pablo"
  });
  print(canBeEitherJsonOrBlank.title);

  print(book.getFullTitle());
  print(book.getFullTitle(toUpperCase: true));

  var sumBooks = book + enciclopedyBook;
  print((sumBooks as Book).getFullTitle());

  var fictionShelf = FictionShelf();
  print("Número de libros es ${fictionShelf.getNumberOfBooks()}");
  var paperShelf = ChildrenBooksShelf();
  print(paperShelf.getNumberOfBooks());
}

class Book {
  int id = 1;
  String? title;
  String? author;

  // Sintaxis sugar for constructor
  Book(this.title, this.author, this.id);

  // Constructores nombrados (named constructors)
  // Para setear las variables de cierta forma según la lógica de negocio
  Book.blankBook()
      : title = "",
        author = "",
        id = -1;

  // Constructor con diferentes argumentos a los originales pero igual los devuelve.
  // Recibe una lista de String authors pero sí asigna al String author.
  Book.multipleAuthorsBook(this.title, List<String> authors, this.id)
      : author = authors.join(", ");

  // Factory constructor: Fábrica de constructores: dependiendo de la lógica se crea una u otra instancia
  factory Book.fromJson(Map<String, String> json) {
    if (json.containsKey("author") && json.containsKey("title")) {
      return Book(json["title"] as String, json["author"] as String, 100);
    } else
      return Book.blankBook();
  }

  // Los factory son útiles cuando se trata con caches
  static final Map<int, Book> cacheBooks =
      <int, Book>{}; // supongamos que tengo un mapa lleno de libros con id's

  factory Book.fromCache(int id) {
    return cacheBooks[id] ??
        Book.blankBook(); // retorna el libro con el ID dado, si eso retorna null, devuelve un libro en blanco
  }

  // Métodos
  String getFullTitle({bool toUpperCase = false}) {
    if (toUpperCase) return "$author - $title".toUpperCase();
    return author! + ' – ' + title!;
  }

  // Definición de operadores personalizados
  operator +(Book book2) {
    return Book("${this.title}, ${book2.title}",
        "${this.author}, ${book2.author}", this.id + book2.id);
  }
}

// Clase abstracta. Shelf -> estante de libros
abstract class Shelf {
  // métodos abstractos, para que sean implementados por los hijos (no tiene llaves)
  void sortBooks();

  // método no abstracto: implementado (tiene llaves)
  int getNumberOfBooks() {
    return 100;
  }
}

class PapersShelf extends Shelf {
  @override
  void sortBooks() {
    // ordenar de acuerdo a la temática y años de publicación
  }

  @override
  int getNumberOfBooks() {
    return 100000;
  }
}

class ChildrenBooksShelf extends Shelf {
  @override
  void sortBooks() {
    // de acuerdo a la edad
  }

  @override
  int getNumberOfBooks() {
    // TODO: implement getNumberOfBooks
    return super.getNumberOfBooks() * 20;
  }
}

class FictionShelf extends Shelf {
  @override
  void sortBooks() {
    // ordenar por nombre de autor
  }
}
