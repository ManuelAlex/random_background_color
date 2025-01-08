import 'package:flutter/material.dart';
import 'package:random_background_color/legend_item.dart';

/// An Assitive menu to show the currnent rgb color values
class TouchAssitiveMenu extends StatefulWidget {
  /// [TouchAssitiveMenu] contructor
  const TouchAssitiveMenu({
    required this.child,
    required this.menuController,
    required this.color,
    required this.onreset,
    super.key,
  });

  /// The child of this widget
  final Widget child;

  /// controller for [MenuAnchor]
  final MenuController menuController;

  /// VoidCallback that resets the background color to it default color
  final VoidCallback onreset;

  /// current color of the background
  final Color color;

  @override
  State<TouchAssitiveMenu> createState() => _TouchAssitiveMenuState();
}

class _TouchAssitiveMenuState extends State<TouchAssitiveMenu> {
  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      controller: widget.menuController,
      menuChildren: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              tooltip: 'Tap to reset color',
              onPressed: widget.onreset,
              icon: const Icon(
                Icons.restart_alt,
              ),
            ),
            LegendItem(
              color: Colors.red,
              text: 'Red (${(widget.color.r * 255).round()})',
              size: 20,
            ),
            LegendItem(
              color: Colors.green,
              text: 'Green(${(widget.color.g * 255).round()})',
              size: 20,
            ),
            LegendItem(
              color: Colors.blue,
              text: 'Blue(${(widget.color.b * 255).round()})',
              size: 20,
            ),
          ],
        ),
      ],
      child: widget.child,
    );
  }
}
