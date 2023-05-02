import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:attendance_frontend_flutter/Screens/Authentication/LoginScreen.dart';
import 'package:attendance_frontend_flutter/Screens/DashBoard/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AtLocation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        backgroundColor: Colors.white,
        splash: Center(
          child: Image.asset(
            "assets/images/1.png",
            fit: BoxFit.cover,
            width: 400,
            height: 200,
          ),
        ),
        nextScreen: KeyboardVisibilityProvider(
          child: AuthCheck(),
        ),
      ),
      localizationsDelegates: [
        MonthYearPickerLocalizations.delegate,
      ],
    );
  }
}

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  bool userAvailable = false;
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() async {
    sharedPreferences = await SharedPreferences.getInstance();

    try {
      if (sharedPreferences.getString('EmployeeID') != null) {
        setState(() {
          userAvailable = true;
        });
      }
    } catch (e) {
      setState(() {
        userAvailable = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return userAvailable ? HomeScreen() : LoginScreen();
    // return const LoginScreen();
  }
}
