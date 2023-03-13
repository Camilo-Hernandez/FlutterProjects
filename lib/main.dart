import 'package:flutter/material.dart';

void main() {
  const String title = 'State Management';
  runApp(MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: const SettingsScreen(),
      )));
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isChecked = true;

  void _onChangedCheckbox(bool? value) {
    setState(() {
      _isChecked = !_isChecked; // Este estado se pierde cuando la app se cierra
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColorsSelection(
          isChecked: _isChecked,
          onChangedCheckbox: _onChangedCheckbox,
        ),
        ColoredBox(
          showColor: _isChecked,
        ),
      ],
    );
  }
}

class ColorsSelection extends StatelessWidget {
  // Con StatelessWidget se levanta el estado, haciendo que otros widgets se encarguen de él
  // Util para que otros hermanos accedan al estado
  final bool isChecked;
  final ValueChanged<bool?> onChangedCheckbox;

  const ColorsSelection(
      {super.key, required this.isChecked, required this.onChangedCheckbox});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Checkbox(value: isChecked, onChanged: onChangedCheckbox),
      Expanded(
        child: Text(
          'Estado se pierde cuando la app se cierra, porque es efímero',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    ]);
  }
}

class ColoredBox extends StatelessWidget {
  final bool showColor;

  const ColoredBox({super.key, required this.showColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: showColor ? Colors.red : Colors.black38,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
    );
  }
}
