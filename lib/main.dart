import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:state_management_examples/lift_state_example.dart';
import 'package:state_management_examples/provider_example.dart';

import 'bloc_example.dart';
import 'cubit_example.dart';

void main() {
  const String title = 'State Management Examples';
  runApp(MaterialApp(
      title: title,
      theme: ThemeData(
        useMaterial3: true,
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
    BlocProvider(
        create: (BuildContext context) =>
            ColorSettingsCubit(ColorSettings4(true)),
        child: const SettingsCubitExampleScreen()),
    BlocProvider(
        // Así se setea el estado inicial desde adentro, desde la creación de la clase
        // create: (BuildContext context) => ColorSettingsBloc(),
        // Así se pasa el estado inicial desde afuera, desde el Scaffold
        create: (BuildContext context) =>
            ColorSettingsBloc(ColorSettings5(false)),
        child: const SettingsBlocExampleScreen()),
  ];

  final _bottomNavigationBarItems = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.elevator), label: "Lift State"),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Provider"),
    BottomNavigationBarItem(icon: Icon(Icons.square), label: "Cubit"),
    BottomNavigationBarItem(icon: Icon(Icons.circle), label: "BLoC"),
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
