import 'package:flutter/material.dart';

class FloatingActionButtonScreen extends StatefulWidget {
  const FloatingActionButtonScreen({super.key});

  @override
  State<FloatingActionButtonScreen> createState() =>
      _FloatingActionButtonScreenState();
}

class _FloatingActionButtonScreenState
    extends State<FloatingActionButtonScreen> {
  bool _isButtonGreen = true;
  Color _smallButtonBackgroundColor = Colors.green;
  Color _standardButtonBackgroundColor = Colors.green;
  Color _extendedButtonBackgroundColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floating Action Button Screen'),
      ),
      body: const Center(
        child:
            Text('Press the button below to toggle the visibility of the FAB'),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        FloatingActionButton.small(
          onPressed: _toggleSmallButtonColor,
          backgroundColor: _smallButtonBackgroundColor,
          child: const Icon(Icons.navigation),
        ),
        FloatingActionButton.extended(
          onPressed: _toggleExtendedButtonColor,
          label: const Text("Nuevo"),
          icon: const Icon(Icons.navigation),
          backgroundColor: _extendedButtonBackgroundColor,
        ),
        // Standard Button
        FloatingActionButton(
          onPressed: _toggleStandardButtonColor,
          backgroundColor: _standardButtonBackgroundColor,
          child: const Icon(Icons.add),
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  void _toggleSmallButtonColor() {
    setState(() {
      _isButtonGreen = !_isButtonGreen;
      if (_isButtonGreen) {
        _smallButtonBackgroundColor = Colors.green;
      } else {
        _smallButtonBackgroundColor = Colors.blue;
      }
    });
  }

  void _toggleExtendedButtonColor() {
    setState(() {
      _isButtonGreen = !_isButtonGreen;
      if (_isButtonGreen) {
        _extendedButtonBackgroundColor = Colors.green;
      } else {
        _extendedButtonBackgroundColor = Colors.blue;
      }
    });
  }

  void _toggleStandardButtonColor() {
    setState(() {
      _isButtonGreen = !_isButtonGreen;
      if (_isButtonGreen) {
        _standardButtonBackgroundColor = Colors.green;
      } else {
        _standardButtonBackgroundColor = Colors.blue;
      }
    });
  }
}
