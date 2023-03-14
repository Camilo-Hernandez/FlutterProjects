/*
BLoC es un patrón de diseño creado por Google, para ayudar a separar la lógica
de negocio de la capa de presentación y permitir a los desarrolladores reusar código
más eficientemente.

Características:
- Permiten saber el estado de la app en to do momento
- Testear fácilmente todos los casos de uso
- Registrar cada interación de los usuarios en nuestra app para poder tomar decisiones basadas en data
- Poder reusar componentes a través de nuestra app y hacer el código más eficiente
- Desarrollar apps reactivas

Cubit: clase que expone funciones para modificar el estado
Bloc: clase que escucha eventos para modificar el estado
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Creación del estado
class ColorSettings4 {
  bool useRed;
  ColorSettings4(this.useRed);
}

// Crear el cubit que exponga/modifique el estado ColorSettings. Aquí se pone la lógica del negocio.
class ColorSettingsCubit extends Cubit<ColorSettings4> {
  // Cualquiera que fuera, tiene que recibir un estado inicial, que permite interactuar con él al exponerlo
  ColorSettingsCubit(super.initialState);

  void setRed() {
    // Se tiene que crear un nuevo state para que pueda llamar al rebuild
    emit(ColorSettings4(true));
  }

  void unsetRed() {
    emit(ColorSettings4(false));
  }
}

class SettingsBlocExampleScreen extends StatelessWidget {
  const SettingsBlocExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ColorsSelection(),
        SizedBox(height: 20),
        ColoredBox(),
      ],
    );
  }
}

class ColorsSelection extends StatelessWidget {
  const ColorsSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorSettingsCubit, ColorSettings4>(
        builder: (context, colorSettingsState) {
      return Row(
        children: [
          Checkbox(
              value: colorSettingsState.useRed,
              onChanged: (isChecked) =>
                  _onCheckBoxPressed(isChecked!, context)),
          Text(
            'Rojo',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      );
    });
  }

  void _onCheckBoxPressed(bool isChecked, BuildContext context) {
    var colorSettingsCubit = context.read<ColorSettingsCubit>();
    if (isChecked) {
      colorSettingsCubit.setRed();
    } else {
      colorSettingsCubit.unsetRed();
    }
  }
}

class ColoredBox extends StatelessWidget {
  const ColoredBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // El Builder es el que contruye los widgets que van a consumir el estado
    // Para crearlo, se le pasan el Cubit y el estado
    return BlocBuilder<ColorSettingsCubit, ColorSettings4>(
      builder: (context, colorSettingsState) {
        // aquí se está consumiendo el estado al pasarle el estado colorSettingsState, de tipo ColorSettings4
        return Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: colorSettingsState.useRed ? Colors.red : Colors.black38,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const SizedBox(
            height: 100,
            width: 100,
          ),
        );
      },
    );
  }
}
