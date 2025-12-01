import 'package:flutter/material.dart';
import 'package:sparktech_demo/screens/dashboard.dart';
import 'package:sparktech_demo/screens/login_screen.dart';
import 'package:sparktech_demo/screens/pin_verify_screen.dart';
import 'package:sparktech_demo/screens/registration_screen.dart';
import 'package:sparktech_demo/utils/utility.dart';




void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  String? token = await retrieveUserData('accessTkn');

  if(token!=null)
  {
    runApp( MyApp('/dashboard') );
  }
  else
  {
    runApp( MyApp('/login') );
  }

}

class MyApp extends StatelessWidget {

  final String firstRoute;
  MyApp(this.firstRoute);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Demo Task",
        initialRoute: firstRoute,
        routes:
        {

          "/login" :(context)=> loginScreen(),
          "/registration" :(context)=> registrationScreen(),
          "/pinVerify" :(context)=> pinVerificationScreen(),
          "/dashboard" : (context) => Dashboard(),



        }

    );
  }
}


