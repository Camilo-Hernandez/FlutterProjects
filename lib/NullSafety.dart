// Null-safety = seguridad ante null
// No permitir que una variable apunte a null cuando se espera
// que esté apuntando a un valor no-null
// Eliminar los "null pointer exceptions"

// Null = la ausencia de un valor

int number = 123;
int? numberNullable;

void main() {

  // nullable
  String name = giveMeAString(3);

  // null aware operator (?) = operador consciente de los null
  String? lastname;
  print(lastname?.length); // Es lo mismo que tener print(lastname?.toString()); cuando es null, ya que ignora lo que hay luego del punto

  var shelf = Shelf();
  shelf.setBooks([]);
  shelf.printNumberOfBooks();
  shelf.setLibrary("Librería de la esquina");
  shelf.printLibrary();
}

class Shelf {
  List<Book>? books;
  late String library; //librería, late = tarde
  String? address; // dirección

  printAddress() {
    var addressNotNull = address;
    if (addressNotNull != null) {
      print("Este estante está ubicado en: " + addressNotNull);
    }
  }

  setLibrary(String library) {
    this.library = library;
  }

  printLibrary() {
    print("Este estante está en: " + library);
  }

  setBooks(List<Book> newBooks) {
    this.books = newBooks;
  }

  printNumberOfBooks() {
    // (!) Casting away nullability = ignorar que es nullable y usar el tipo no nullable.
    var shelf = Shelf();
    print(books!.length);
  }

  void clearBooks() {
    books = null;
  }
}

String giveMeAString(int n) {
  if (n == 0) {
    return 'zero';
  } else if (n < 0) {
    throw ArgumentError('Negative values not allowed.');
  } else {
    if (n > 1000) {
      return 'big';
    } else {
      return n.toString();
    }
  }
}

class Book {
  int pages;
  int price;
  Book(this.pages, this.price);

  int givePrice() {
    int price;
    if (pages > 100) {
      price = 10000;
    } else {
      price = 5000;
    }
    print(price);
    return price;
  }

  // type promotion = promoción del tipo
  int priceWithDiscount([int? discount]) {
    if (discount != null) {
      return this.price - discount; // int? -> int
    }

    return this.price;
  }
}