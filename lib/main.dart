import 'package:flutter/material.dart';
import 'package:quiz/screens/welcome_screen.dart';
import 'package:quiz/screens/login_screen.dart';
import 'package:quiz/screens/registration_screen.dart';
import 'package:quiz/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'images/logo.png',
        ),
        splashIconSize: 150.0,
        splashTransition: SplashTransition.slideTransition,
        nextScreen: FirebaseAuth.instance.currentUser == null
            ? WelcomeScreen()
            : HomeScreen(),
      ),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
