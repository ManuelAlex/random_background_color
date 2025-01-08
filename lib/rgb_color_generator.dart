
import 'dart:math';
import 'dart:ui';

/// A simple class that generates random Color  from 0 to 16,777,215
/// Following RGB number values
class RgbColorGenerator {
  /// List of integers from 0 to 255
   static const int maxRgbValue = 255;
   /// default color before any other random color is genrated
   /// as observed from flutter scaffold background color
   /// can be used to reset to original color
   static const Color defaultColor =
   Color.fromRGBO(maxRgbValue, maxRgbValue, maxRgbValue, 1);
    /// Full opacity value (Alpha = 255)
   static const int fullOpacityValue = 0xFF000000;
 
   
   ///  Getter that return values in the range 0 to 16,777,215 inclusive
   ///  Generated  random color using bitwise operations.
  Color get randomColor {
    // Got this idea from a previous serverpod project that was rejecting 
    // the flutter [Color] class. we generated custom color in a similar way

    final int randomValue = (Random().nextInt(maxRgbValue+1) << 16) | // Red
                            (Random().nextInt(maxRgbValue+1) << 8)  | // Green
                            Random().nextInt(maxRgbValue+1);  
                          //  print(randomValue) ;       // Blue 

    return Color(randomValue | fullOpacityValue);

  }
   
  /// [RgbColorGenerator] constructor

  RgbColorGenerator();
  
 
}
