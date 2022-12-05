import 'package:flutter/material.dart';
import 'package:udemy_practice_002/myHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Udemy Practice 2',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.amberAccent,
        errorColor: Colors.red,
        // colorScheme: const ColorScheme(
        //   primary: Colors.deepPurple,
        //   onPrimary: Colors.amberAccent,
        //   secondary: Colors.amberAccent,
        //   onSecondary: Colors.deepPurple,
        //   error: Colors.redAccent,
        //   onError: Colors.red,
        //   brightness: Brightness.light,
        //   background: Colors.white,
        //   onBackground: Colors.black,
        //   surface: Colors.black,
        //   onSurface: Colors.white,
        // ),
        fontFamily: "Quicksand",
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 30,
            color: Colors.amberAccent,
            // color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.accent,
          buttonColor: Colors.deepPurple,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 30,
                color: Colors.deepPurple,
                // color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
              titleMedium: const TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 25,
                color: Colors.deepPurple,

                // color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
              titleSmall: const TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 20,
                color: Colors.deepPurple,

                // color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w200,
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
            .copyWith(secondary: Colors.amberAccent),
      ),
      home: MyHomePage(),
    );
  }
}
