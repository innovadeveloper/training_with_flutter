import 'package:flutter/material.dart';
import 'package:training_with_flutter/main.dart';
import 'package:training_with_flutter/pages/batery_info.dart';
import 'package:training_with_flutter/pages/home.dart';
import 'package:training_with_flutter/pages/login.dart';
import 'package:training_with_flutter/pages/onboarding.dart';
import 'package:training_with_flutter/pages/page_menu_selector.dart';
import 'package:training_with_flutter/pages/register_phone_number.dart';
import 'package:training_with_flutter/pages/register_pin_verify.dart';
import 'package:training_with_flutter/pages/selection_city.dart';
import 'package:training_with_flutter/pages/splash_screen.dart';

class AppRoutes {
  
 Map<String, WidgetBuilder> routes(){
   return {
        '/'  : (BuildContext context ) => SplashScreen(key: UniqueKey(),),
        '/page_menu_selector'  : (BuildContext context ) => PageMenuSelector(key : UniqueKey()),
        '/selection_city'  : (BuildContext context ) => SelectionCity(key : UniqueKey()),
        '/onboarding' : (BuildContext context ) => Onboarding(key : UniqueKey()),
        '/login' : (BuildContext context ) => Login(key : UniqueKey()),
        '/register_phone_number' : (BuildContext context ) => RegisterPhoneNumber(key : UniqueKey()),
        '/register_pin_verify' : (BuildContext context ) => RegisterPinVerify(key : UniqueKey()),
        '/home' : (BuildContext context ) => Home(key : UniqueKey()),
      };
 }
  
}