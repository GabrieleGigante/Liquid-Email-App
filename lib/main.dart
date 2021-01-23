import 'package:flutter/material.dart';
import 'package:liquid_email/components/BottomNavBar.dart';
import 'package:liquid_email/pages/EmailPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*DefaultAssetBundle.of(context)
        .loadString("credentials.json")
        .then((value) => print(value));*/
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext ctx) {
          return BottomNavBar(); //EmailPage("Primary");
        }
      },
    );
  }
}
