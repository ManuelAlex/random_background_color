

import 'package:flutter/material.dart';
import 'package:random_background_color/rgb_color_generator.dart';
/// The class [RandomBackgroundColor] is base of the core implementation 
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
  Color? _backgroundColor;
  Color? get backgroundColor=>_backgroundColor;
  set backgroundColor(Color? color)=> setState(() {
    _backgroundColor=color;
   
  });



  @override
  Widget build(BuildContext context) {
  
    return Tooltip(
      message: 'Double-tap to reset background color',
      child: GestureDetector(
       
        onTap: () {
          // set color value
       backgroundColor=_rgbIntGenerator.randomColor; 
     //  print(backgroundColor==Scaffold.of(context).widget.backgroundColor) ;
      
          },
        child: Scaffold(
          
          backgroundColor: backgroundColor ?? RgbColorGenerator.defaultColor ,
          
          body: const Center(
            child:  Text('Hello there'),
          ),
         
        ),
      ),
    );
  }
}
