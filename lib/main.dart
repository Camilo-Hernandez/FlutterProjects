import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_examples/lift_state_example.dart';
import 'package:state_management_examples/provider_example.dart';

void main() {
  const String title = 'State Management Examples';
  runApp(MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SettingsScreenExamples(title)));
}

class SettingsScreenExamples extends StatefulWidget {
  const SettingsScreenExamples(this.title, {super.key});

  final String title;

  @override
  State<SettingsScreenExamples> createState() => _SettingsScreenExamples();
}

class _SettingsScreenExamples extends State<SettingsScreenExamples> {
  final _screens = [
    const SettingsLiftStateExampleScreen(),
    ChangeNotifierProvider(
      create: (context) => ColorSettings(),
      child: const SettingProviderExampleScreen(),
    ), // la clase podría recibir el context
  ];

  final _bottomNavigationBarItems = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.elevator), label: "Lift State"),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Provider"),
  ];

  var _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _screens[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItems,
        currentIndex: _selectedItem,
        onTap: (index) {
          setState(() {
            _selectedItem = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black38,
      ),
    );
  }
}
