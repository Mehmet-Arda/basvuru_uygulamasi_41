
import 'package:basvuru_uygulamasi_41/screens/admin_approved_applications_screen.dart';
import 'package:basvuru_uygulamasi_41/screens/admin_rejected_applications_screen.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:basvuru_uygulamasi_41/admin_signin_controller.dart';
import "package:basvuru_uygulamasi_41/students_db_helper.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'admin_exit_screen.dart';
import 'admin_home_screen.dart';
import 'admin_pending_applications_screen.dart';



class AdminMainScreen extends StatefulWidget{

  late Map adminDocMap;
  late List sayac;

  AdminMainScreen(this.adminDocMap,this.sayac);

  @override
  _AdminMainScreenState createState()=>_AdminMainScreenState(adminDocMap,sayac);


}

class _AdminMainScreenState extends State<AdminMainScreen>{
  late Map adminDocMap;
  late List sayac;

  _AdminMainScreenState(this.adminDocMap,this.sayac);

  final navigationKey=GlobalKey<CurvedNavigationBarState>();

  int index=2;

  @override
  Widget build(BuildContext context) {

    List screens=[
      AdminApprovedApplicationsScreen(adminDocMap),
      AdminPendingApplicationsScreen(adminDocMap),
      AdminHomeScreen(adminDocMap, sayac),
      AdminRejectedApplicationsScreen(adminDocMap),
      AdminExitScreen(),
    ];


    return Scaffold(

      extendBody: true,

      body: screens[index],

      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.red.shade800,
        items: <Widget>[
          Icon(Icons.done_rounded,size: 30,color: Colors.white,),
          Icon(Icons.horizontal_rule_rounded,size: 30,color: Colors.white,),
          Icon(Icons.home_rounded,size: 30,color: Colors.white,),
          Icon(Icons.close_rounded,size: 30,color: Colors.white,),
          Icon(Icons.exit_to_app_rounded,size: 30,color: Colors.white,),
        ],
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        buttonBackgroundColor: Colors.blue.shade700,
        backgroundColor: Colors.transparent,
        index: index,
        onTap: (index)=>setState(()=>this.index
        =index),
        height: 60,

      ),
    );

  }
}
