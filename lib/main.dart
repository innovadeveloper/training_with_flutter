import 'package:flutter/material.dart';
import 'package:training_with_flutter/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/page_menu_selector',
      routes: AppRoutes().routes(),
      theme: ThemeData(
        primaryColor: Colors.deepPurple[600],
        // accentColor: Colors.amber,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepPurple[600],
        ),
        textTheme: TextTheme(
          headline3: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
          headline4: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
          headline5: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
          headline6: TextStyle(
              fontSize: 14.0,
              // fontStyle: FontStyle.italic,
              fontFamily: 'Poppins'),
          bodyText2: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      // home: Scaffold(
      //   // appBar: AppBar(
      //   //   title: Text('Material App Bar'),
      //   // ),
      //   body: SplashScreen(),
      // ),
    );
  }
}
