import 'package:basvuru_uygulamasi_41/screens/student_signup_screen.dart';
import 'package:basvuru_uygulamasi_41/screens/student_signin_screen.dart';
import 'package:basvuru_uygulamasi_41/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }

}
