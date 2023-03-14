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
class ColorSettings5 {
  bool useRed;
  ColorSettings5(this.useRed);
}

// El BLoC se basa en eventos para reaccionar a ellos y producir una acción
// Se deben crear todos los eventos en la UI para que el bloc reaccione de acuerdo a la lógica de negocio.
// Luego de ello, se llama el build
// Todos los eventos de un screen se agrupan con una clase abstracta
// Primero se crea la superclase de los eventos asociados al estado
abstract class ColorSettingsEvent {
  const ColorSettingsEvent();
}

// Se desacoplan los eventos
class SetRedColorEvent extends ColorSettingsEvent {
  const SetRedColorEvent();
}

class UnsetRedColorEvent extends ColorSettingsEvent {
  const UnsetRedColorEvent();
}

// Luego se crea el Bloc del estado. Recibe la superclase de los eventos y el estado
// Aquí se maneja la lógica del negocio
class ColorSettingsBloc extends Bloc<ColorSettingsEvent, ColorSettings5> {
  // Estado inicial: la diferencia entre las dos formas es si se da o no el acceso desde afuera para setear el estado inicial. Si no, es inmodificable para todas las instancias
  // Así se setea para que el estado se pueda pasar desde afuera, desde el llamado del constructor
  ColorSettingsBloc(ColorSettings5 initialState) : super(initialState) {
    // Así se crea el estado desde la creación de la clase
    // ColorSettingsBloc() : super(ColorSettings5(false)) {

    // recibe el tipo de evento, y de argumentos: event handler y un event transformer (emisor de estados) Por convención se nombran así
    on<SetRedColorEvent>((event, emit) {
      // lógica
      emit(ColorSettings5(true));
    });
    on<UnsetRedColorEvent>((event, emit) {
      // lógica
      emit(ColorSettings5(false));
    });
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
    return BlocBuilder<ColorSettingsBloc, ColorSettings5>(
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
    var colorSettingsBloc = context.read<ColorSettingsBloc>();
    if (isChecked) {
      // De esta forma se pueden llamar los eventos desde cualquier parte,
      // lo que lo hace más flexible
      // El método add añade el evento a la cola de eventos
      colorSettingsBloc.add(const SetRedColorEvent());
    } else {
      colorSettingsBloc.add(const UnsetRedColorEvent());
    }
  }
}

class ColoredBox extends StatelessWidget {
  const ColoredBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // El Builder es el que contruye los widgets que van a consumir el estado
    // Para crearlo, se le pasan el Cubit y el estado
    return BlocBuilder<ColorSettingsBloc, ColorSettings5>(
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
