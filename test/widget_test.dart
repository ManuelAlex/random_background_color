// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:random_background_color/my_app.dart';

void main() {
  testWidgets('Random Color background test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the test 'Hello there' is present.
    expect(find.text('Hello there'), findsOneWidget);
    const int maxRgbValue = 255;
// store inital background color
final  Color ?intialBackgroundColor =
      (tester.widget(find.byType(Scaffold)) as Scaffold).backgroundColor;
      //verify that starting background color is white 
      expect( intialBackgroundColor
      
 ,const Color.fromRGBO(maxRgbValue, maxRgbValue, maxRgbValue, 1),);
    
    final Finder getureDetectorFInder =find.byType(GestureDetector);
    final GestureDetector gestureDetector= 
    tester.widget<GestureDetector>(getureDetectorFInder);
    // verify that the method is not empty
    expect(gestureDetector.onTap, isNotNull);
    await tester.tap(getureDetectorFInder);
    await tester.pump();
    final Color? randomBackgroundColor =
      (tester.widget(find.byType(Scaffold)) as Scaffold).backgroundColor;

    // Verify that background color has changed,
    // that is from white to another random color

    expect(intialBackgroundColor, 
    isNot(randomBackgroundColor),);
    
  });



  
}
