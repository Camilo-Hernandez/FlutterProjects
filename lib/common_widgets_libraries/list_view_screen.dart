import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Listas con ListView")),
      body: ListViewInkWellTappable(),
    );
  }
}

/* El constructor más básico de listas requiere una lista de Widgets explícita
 Pero es la peor opción, porque las listas construidas manualmente implican:
 - mucho código
 - difícil mantenibilidad
 Lo que se puede hacer es crear un ListViewBuilder que cree los hijos dinámicamente
*/
class ListViewWidgets extends StatelessWidget {
  const ListViewWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Container(
          height: 50,
          color: Colors.amber,
          child: const Center(
            child: Text("Fila A"),
          ),
        ),
        Container(
          height: 50,
          color: Colors.amber,
          child: const Center(
            child: Text("Fila B"),
          ),
        ),
        Container(
          height: 50,
          color: Colors.amber,
          child: const Center(
            child: Text("Fila C"),
          ),
        ),
        Container(
          height: 50,
          color: Colors.amber,
          child: const Center(
            child: Text("Fila D"),
          ),
        ),
      ],
    );
  }
}

/* Mejor forma de hacer listas: una list view al que se le pasa un builder
  Aún se puede usar cuando se saben cuántos elementos llegan de la fuente, e.g, servidor
 */
class ListViewBuilder extends StatelessWidget {
  final List<String> rows = ['A', 'B', 'C', 'D'];
  final List colorCodes = <int>[600, 500, 100, 200];

  ListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    // itemBuilder es una función que retorna un widget y recibe un contexto y un index
    // Se va a llamar cada que se llamen cada una de las filas
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text("Fila ${rows[index]}")),
          );
        });
  }
}

class ListViewSeparator extends StatelessWidget {
  final List<String> rows = ['A', 'B', 'C', 'D'];
  final List colorCodes = <int>[600, 500, 100, 200];

  ListViewSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    // itemBuilder es una función que retorna un widget y recibe un contexto y un index
    // Se va a llamar cada que se llamen cada una de las filas
    return ListView.separated(
        separatorBuilder: (context, index) {
          // Personalizar el divisor
          var height = 10.0;
          if (index == 0) {
            return Container(
                padding: const EdgeInsets.all(20),
                child: const Text('Widget intermedio'));
          } else if (index == 1) {
            return Container(
              color: Colors.black,
              height: 25,
            );
          }
          return Divider(height: height);
        },
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            height: index == 1 ? 100 : 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text("Fila ${rows[index]}")),
          );
        });
  }
}

class ListViewTappable extends StatelessWidget {
  final List rows = <String>['A', 'B', 'C', 'D'];
  final List<int> colorCodes = [100, 200, 300, 400];

  ListViewTappable({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Presionaste la fila $index'),
                  duration: const Duration(seconds: 1)));
            },
            child: Container(
              color: Colors.green[colorCodes[index]],
              height: 50,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 40),
              child: Text('Hola fila ${rows[index]}'),
            ),
          );
        });
  }
}

class ListViewInkWellTappable extends StatelessWidget {
  final List rows = <String>['A', 'B', 'C', 'D'];
  final List<int> colorCodes = [100, 200, 300, 400];

  ListViewInkWellTappable({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Presionaste la fila $index'),
                  duration: const Duration(seconds: 1)));
            },
            splashColor: Colors.red,
            child: ListTile(
              title: Text('Fila de letra ${rows[index]}'),
              tileColor: Colors.deepPurple[colorCodes[index]],
            ),
          );
        });
  }
}
