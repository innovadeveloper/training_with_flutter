import 'package:flutter/material.dart';
import 'package:training_with_flutter/pages/page_menu_selector.dart';
import 'package:training_with_flutter/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/bank_home',
      routes: AppRoutes().routes(),
      theme: ThemeData(
        // primaryColor: Colors.deepPurple[600],
        primaryColor: Colors.white,
        primaryColorDark: Colors.black,
        primaryColorLight: Colors.white,
        // accentColor: Colors.amber,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.white,
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
          headlineMedium: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
          headlineSmall: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
          bodySmall: TextStyle(
            fontSize: 14.0,
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
          bodyMedium: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontFamily: 'Poppins',
          )
        ),
      ),
      // home: PageMenuSelector(key: UniqueKey(),)
    );
  }
}
