/*
Problemas con Provider:
- Depende del árbol de widgets al ser una mejora del Inherited Widget
- Sólo permite un provider por tipo:
    - Provider.of<ColorSettings>(context);
    - Consumer <ColorSettings>(builder: (context, colorSettings, child) {...}
- Puede producir ProviderNotFoundExceptio en tiempo de ejecución, no compilación, si se llama a un tipo de provider que no está en el árbol de widgets

Riverpod es un framework de gestión de estados e injección de dependencias.
Ventajas:
- Muchos providers del mismo tipo. Los providers son por instancia, no por tipo
- Providers independientes del árbol de widgets
- Independiente de Flutter
- Identifica los errores con providers en tiempo de compilación
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  const String title = 'State Management Example - Riverpod';
  runApp(ProviderScope(
    child: MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text(title),
          ),
          body: const SettingsScreen(),
        )),
  ));
}

// Se crea un estado, que puede ser de un tipo cualquiera, incluso una clase
class ColorSettings {
  final bool useRed;
  const ColorSettings(this.useRed);
}

// Se crea el State Notifier, donde están los métodos de la lógica de negocio
class ColorSettingsNotifier extends StateNotifier<ColorSettings> {
  ColorSettingsNotifier(
      super.state); // El state es del tipo indicado, ColorSettings en este caso

  void setRed() {
    // Se debe reconstruir el estado, no cambiar su valor
    state = const ColorSettings(true);
  }

  void unsetRed() {
    state = const ColorSettings(true);
  }
}

// Un provider es quien provee el estado a todos los widgets que lo consuman
// Riverpod tiene varios tipos de Providers. Hay que elegir el que se adecúe más a la complejidad de la aplicación
// StateNotifierProvider es medianamente complejo
// Se le pasan 2 tipos: el del State Notifier y el del State
// Se le pasa como argumento una función builder
final colorSettingsProvider = StateNotifierProvider<ColorSettingsNotifier,
        ColorSettings>(
    // Le agregamos el valor por defecto que es true a useRed, al estado ColorSettings
    (_) => ColorSettingsNotifier(const ColorSettings(true)));

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ColorsSelection(),
        ColoredBox3(),
      ],
    );
  }
}

// El Consumer Widget es un Widget Ref que facilita el consumo de los providers
class ColorsSelection extends ConsumerWidget {
  const ColorsSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.read(provider); // leer datos, sin tener que observarlo
    // ref.watch(provider) // observar el dato y sus cambios
    ColorSettings colorSettings = ref.watch(colorSettingsProvider);
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Checkbox(
          value: colorSettings.useRed,
          onChanged: (isChecked) =>
              _onCheckBoxPressed(isChecked!, ref, context)),
      Text(
        'Rojo',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    ]);
  }

  _onCheckBoxPressed(bool isChecked, WidgetRef ref, BuildContext context) {
    // colorSettingsProvider.notifier es el notificador. Read se usa para modificar el estado sin observarlo
    var colorSettingsNotifier = ref.read(colorSettingsProvider.notifier);
    if (isChecked) {
      colorSettingsNotifier.setRed();
    } else {
      colorSettingsNotifier.unsetRed();
    }
  }
}

class ColoredBox3 extends ConsumerWidget {
  const ColoredBox3({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.read(provider); // leer datos, sin tener que observarlo
    // ref.watch(provider) // observar el dato y sus cambios
    ColorSettings colorSettings = ref.watch(colorSettingsProvider);
    return Container(
      color: colorSettings.useRed ? Colors.red : Colors.black38,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
    );
  }
}
