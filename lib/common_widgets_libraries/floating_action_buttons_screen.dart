import 'package:flutter/material.dart';

class FloatingActionButtonScreen extends StatefulWidget {
  const FloatingActionButtonScreen({super.key});

  @override
  State<FloatingActionButtonScreen> createState() =>
      _FloatingActionButtonScreenState();
}

class _FloatingActionButtonScreenState
    extends State<FloatingActionButtonScreen> {
  MaterialColor _smallButtonBackgroundColor = Colors.green;
  MaterialColor _extendedButtonBackgroundColor = Colors.green;
  MaterialColor _standardButtonBackgroundColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floating Action Button Screen'),
      ),
      body: const Center(
        child: Text('Press the buttons below to toggle their colors'),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        FloatingActionButton.small(
          //.small() and .large()
          onPressed: () => setState(() {
            _smallButtonBackgroundColor =
                _smallButtonBackgroundColor == Colors.green
                    ? Colors.blue
                    : Colors.green;
          }),
          backgroundColor: _smallButtonBackgroundColor,
          child: const Icon(Icons.navigation),
        ),
        FloatingActionButton.extended(
          onPressed: () => setState(() {
            _extendedButtonBackgroundColor =
                _extendedButtonBackgroundColor == Colors.green
                    ? Colors.blue
                    : Colors.green;
          }),
          label: const Text("Nuevo"),
          icon: const Icon(Icons.navigation),
          backgroundColor: _extendedButtonBackgroundColor,
        ),
        FloatingActionButton(
          onPressed: () => setState(() {
            _standardButtonBackgroundColor =
                _standardButtonBackgroundColor == Colors.green
                    ? Colors.blue
                    : Colors.green;
          }),
          backgroundColor: _standardButtonBackgroundColor,
          child: const Icon(Icons.add),
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
