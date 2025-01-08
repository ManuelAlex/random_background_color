import 'package:flutter/material.dart';

/// Legend item RGB color indicator
class LegendItem extends StatelessWidget {
  ///
  const LegendItem({
    required this.color,
    required this.text,
    required this.size,
    super.key,
  });

  /// legend item color
  final Color color;

  /// Legend item text
  final String text;

  /// Legend  item size
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: color,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            ':$text',
          ),
        ],
      ),
    );
  }
}
