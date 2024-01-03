import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinay/main.dart';


void main(){
  testWidgets('Calculator', (WidgetTester tester) async{
    await tester.pumpWidget(MyApp());
  });
}