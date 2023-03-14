/*
El paquete Provider evita usar multiples callbacks a través del arbol de widgets,
y es más fácil de usar que un inherited widget
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingProviderExampleScreen extends StatelessWidget {
  const SettingProviderExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Hay que envolver con un consumer los widgets que consumen el Change Provider
    // el parámetro child se pone por obtimización
    return Column(
      children: const [
        ColorsSelection2(),
        ColoredBox2(),
      ],
    );
  }
}

class ColorSettings extends ChangeNotifier {
  bool useRed = false;

  void setRed() {
    useRed = true;
    notifyListeners(); // Siempre se pone cuando se hace un cambio para notificar a los consumers
  }

  void unsetRed() {
    useRed = false;
    notifyListeners();
  }
}

class ColorsSelection2 extends StatelessWidget {
  const ColorsSelection2({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorSettings>(builder: (context, colorSettings, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            value: colorSettings.useRed,
            onChanged: (isChecked) => _onCheckBoxPressed(isChecked, context),
          ),
          Expanded(
            child: Text(
              'Rojo',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      );
    });
  }

  void _onCheckBoxPressed(bool? isChecked, BuildContext context) {
    // La clase Provider se usa cuando se quiere setear las variables pero no escuchar sus cambios
    // Sirve para desacoplar quienes escuchan de quienes cambian
    var colorSettings = Provider.of<ColorSettings>(context, listen: false);
    if (isChecked!) {
      colorSettings.setRed();
    } else {
      colorSettings.unsetRed();
    }
  }
}

class ColoredBox2 extends StatelessWidget {
  const ColoredBox2({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorSettings>(builder: (context, colorSettings, child) {
      return Container(
        color: colorSettings.useRed ? Colors.red : Colors.black38,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
      );
    });
  }
}
