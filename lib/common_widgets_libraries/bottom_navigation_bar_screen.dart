import 'package:flutter/material.dart';

import 'buttons_screen.dart';
import 'floating_action_buttons_screen.dart';
import 'gesture_detector_screen.dart';
import 'images_screen.dart';
import 'list_view_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() => BottomNavigationBarState();
}

class BottomNavigationBarState extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    const ButtonsScreen(),
    const FloatingActionButtonScreen(),
    const GestureDetectionScreen(),
    const ImagesScreen(),
    const ListViewScreen(),
  ];

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.smart_button_sharp), label: "Buttons"),
    BottomNavigationBarItem(
        icon: Icon(Icons.radio_button_checked_rounded),
        label: "Floating Action Buttons"),
    BottomNavigationBarItem(
        icon: Icon(Icons.tap_and_play), label: "Gesture Detector"),
    BottomNavigationBarItem(icon: Icon(Icons.image_outlined), label: "Images"),
    BottomNavigationBarItem(icon: Icon(Icons.view_list), label: "List"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bottom Navigation Bar Example")),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.black38,
      ),
      body: _screens[_selectedIndex],
    );
  }
}
