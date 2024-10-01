import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5C11D4);
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.green,
  Colors.teal,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Colors.red,
];

class AppTheme{
  final int selectedColor;

  AppTheme({required this.selectedColor})
      : assert(selectedColor >= 0 &&
      selectedColor <= _colorThemes.length - 1,
  'Colors must be between 0 and ${_colorThemes.length}');

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: (selectedColor > _colorThemes.length || selectedColor < 0)
          ? _colorThemes[0]
          : _colorThemes[selectedColor]
    );
  }
}