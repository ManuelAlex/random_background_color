import 'package:flutter/material.dart';
import 'package:random_background_color/rgb_color_generator.dart';
import 'package:random_background_color/touch_assitance_menu.dart';

/// The class [RandomBackgroundColor] is  the base of the core implementation
/// of the  random background color  with a center text 'Hello there'
class RandomBackgroundColor extends StatefulWidget {
  /// The [RandomBackgroundColor] constructor
  const RandomBackgroundColor({super.key});

  @override
  State<RandomBackgroundColor> createState() => _RandomBackgroundColorState();
}

class _RandomBackgroundColorState extends State<RandomBackgroundColor> {
  final RgbColorGenerator _rgbIntGenerator = RgbColorGenerator();

  // code aesthetics using getters and setters to set color values
  Color _backgroundColor = RgbColorGenerator.defaultColor;
  Color get backgroundColor => _backgroundColor;
  set backgroundColor(Color color) => setState(() {
        _backgroundColor = color;
      });
  final MenuController _menuController = MenuController();

  void _handleSecondaryTapDown(TapDownDetails details) {
    _menuController.open(position: details.localPosition);
  }

  void _handleTap() {
    // close menu if opened
    if (_menuController.isOpen) {
      _menuController.close();
    } else {
      // set color value
      backgroundColor = _rgbIntGenerator.randomColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onSecondaryTapDown: _handleSecondaryTapDown,
      child: Tooltip(
        message: 'Tap anywhere to generate background color',
        child: TouchAssitanceMenu(
          menuController: _menuController,
          color: backgroundColor,
          onreset: () => backgroundColor = RgbColorGenerator.defaultColor,
          child: Scaffold(
            backgroundColor: backgroundColor,
            body: const Center(
              child: Text(
                'Hello there',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
