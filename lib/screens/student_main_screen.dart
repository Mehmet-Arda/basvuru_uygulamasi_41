import 'package:basvuru_uygulamasi_41/screens/student_applications_screen.dart';
import 'package:basvuru_uygulamasi_41/screens/student_create_application_screen.dart';
import 'package:basvuru_uygulamasi_41/screens/student_forgot_password_screen.dart';
import 'package:basvuru_uygulamasi_41/screens/student_home_screen.dart';
import 'package:basvuru_uygulamasi_41/screens/student_profile_screen.dart';
import 'package:basvuru_uygulamasi_41/screens/student_signup_screen.dart';
import 'package:basvuru_uygulamasi_41/screens/students_exit_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:basvuru_uygulamasi_41/admin_signin_controller.dart';
import "package:basvuru_uygulamasi_41/students_db_helper.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:curved_navigation_bar/curved_navigation_bar.dart';




class StudentMainScreen extends StatefulWidget{

  late Map studentDocMap;
  late List sayac;

  StudentMainScreen(this.studentDocMap,this.sayac);

  @override
  _StudentMainScreenState createState()=>_StudentMainScreenState(studentDocMap,sayac);


}

class _StudentMainScreenState extends State<StudentMainScreen>{
  late Map studentDocMap;
  late List sayac;

  _StudentMainScreenState(this.studentDocMap,this.sayac);

  final navigationKey=GlobalKey<CurvedNavigationBarState>();

  int index=2;


  StudentHelper _studentHelper=StudentHelper();


  @override
  Widget build(BuildContext context) {

    List screens=[
      StudentProfileScreen(studentDocMap),
      StudentApplicationsScreen(studentDocMap),
      StudentHomeScreen(studentDocMap,sayac),
      StudentCreateApplicationScreen(studentDocMap),
      StudentExitScreen(),
    ];


    return Scaffold(

      extendBody: true,

      body: screens[index],

      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.blue.shade700,
        items: <Widget>[
          Icon(Icons.person_rounded,size: 30,color: Colors.white,),
          Icon(Icons.list,size: 30,color: Colors.white,),
          Icon(Icons.home_rounded,size: 30,color: Colors.white,),
          Icon(Icons.add_circle_rounded,size: 30,color: Colors.white,),
          Icon(Icons.exit_to_app_rounded,size: 30,color: Colors.white,),
        ],
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        buttonBackgroundColor: Colors.green.shade600,
        backgroundColor: Colors.transparent,
        index: index,
        onTap: (index)=>setState(()=>this.index
        =index),
        height: 60,

      ),
    );

  }

  appBarText(int index){
    switch(index){
      case 0: return Text("Profil",style: TextStyle(fontFamily: "Recursive",fontSize: 25),);
      case 1: return Text("Başvurularım",style: TextStyle(fontFamily: "Recursive",fontSize: 25),);
      case 2: return Text("Ana Sayfa",style: TextStyle(fontFamily: "Recursive",fontSize: 25),);
      case 3: return Text("Yeni Başvuru Oluştur",style: TextStyle(fontFamily: "Recursive",fontSize: 25),);
      case 4 : return Text("Çıkış",style: TextStyle(fontFamily: "Recursive",fontSize: 25),);

    }
  }


}