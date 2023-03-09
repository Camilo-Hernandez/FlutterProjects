// Mixin: una forma de usar código de una clse en múltiples jerarquías de clases
/*
En este ejemplo, tengo dos jerarquías de clase: Book y Notebook
En ambos yo quiero vender y prestar pero no quiero hacer que ambos hereden de una superclase común
Para eso son los mixin
 */
void main(){
  var childrenBook = ChildrenBook();
  childrenBook.sell();

  var notebook = Notebook();
  notebook.lend();

}

mixin OccasionalItemActions{ // simula las interfaces si los métodos no están implementados aquí, ya que obliga a implementarlos en los hijos
  void lend();
}

mixin PermanentItemActions on Book{ // on Book significa alguien que sólo implemente o extienda a Book, no a Book en sí mismo
  void sell(){
    print('Vender el libro');
  }
}

class Notebook with OccasionalItemActions{
  int price = 100;

  @override
  void lend() {
    print('Prestar el cuaderno');
  }
}

abstract class Book{
  int noPages = 0;
  String title = "";

}

class ChildrenBook extends Book with PermanentItemActions{
  int maxAge = 7;
}