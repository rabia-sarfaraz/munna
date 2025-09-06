import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'get_started_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/verification_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/gender_screen.dart';
import 'screens/name_screen.dart';

void main() {
  runApp(const MunnaMatchApp());
}

class MunnaMatchApp extends StatelessWidget {
  const MunnaMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Munna Match',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins', primarySwatch: Colors.brown),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/get_started': (context) => const GetStartedScreen(),
        '/sign_up': (context) => const SignUpScreen(),
        '/verification': (context) => const VerificationScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/gender': (context) => const GenderScreen(),
        '/name': (context) => const NameScreen(),
      },
    );
  }
}
