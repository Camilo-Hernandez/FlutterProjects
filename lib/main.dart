import 'package:flutter/material.dart';

import 'common_widgets_libraries/floating_action_buttons_screen.dart';

const appTitle = 'Widgets Catalog App';

void main() {
  runApp(const WidgetsCatalogApp());
}

class WidgetsCatalogApp extends StatelessWidget {
  const WidgetsCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: const FloatingActionButtonScreen(),
    );
  }
}
