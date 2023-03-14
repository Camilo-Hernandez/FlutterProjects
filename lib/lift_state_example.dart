/*
El levantamiento es delegar el cambio de estado a un Stateful Widget, en este caso,
se llama SettingsScreenLiftState.
Los hijos reciben un estado y pueden o no recibir un callback que permite
la modificación del estado.
setState está dentro de un método llamado callback.
El callback se ingresa por constructor al hijo que desee activarlo. En este caso,
un widget que contiene un checkbox, el cual invoca el callback.
Otros widgets usarán el estado modificado para cambiar su UI. En este caso,
un container puede recibir el valor del atributo cambiado para setear su color.
 */

import 'package:flutter/material.dart';

class SettingsLiftStateExampleScreen extends StatefulWidget {
  const SettingsLiftStateExampleScreen({super.key});

  @override
  State<SettingsLiftStateExampleScreen> createState() =>
      _SettingsLiftStateExampleScreenState();
}

class _SettingsLiftStateExampleScreenState
    extends State<SettingsLiftStateExampleScreen> {
  bool _isChecked = true;

  void _onCheckboxPressed(bool? value) {
    setState(() {
      _isChecked =
          !_isChecked; // Este estado se pierde cuando la app se cierra, es efímero
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColorsSelection(
          isChecked: _isChecked,
          onChangedCheckbox: _onCheckboxPressed,
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
  // Con este callback se envía el cambio
  final ValueChanged<bool?> onChangedCheckbox;

  const ColorsSelection(
      {super.key, required this.isChecked, required this.onChangedCheckbox});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Checkbox(value: isChecked, onChanged: onChangedCheckbox),
      Expanded(
        child: Text(
          'Rojo',
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
