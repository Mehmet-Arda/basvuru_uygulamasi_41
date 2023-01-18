import 'dart:async';

import 'package:basvuru_uygulamasi_41/screens/student_forgot_password_screen.dart';
import 'package:basvuru_uygulamasi_41/screens/student_home_screen.dart';
import 'package:basvuru_uygulamasi_41/screens/student_main_screen.dart';
import 'package:basvuru_uygulamasi_41/screens/student_signup_screen.dart';
import 'package:basvuru_uygulamasi_41/storage_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:basvuru_uygulamasi_41/admin_signin_controller.dart';
import "package:basvuru_uygulamasi_41/students_db_helper.dart";
import "package:firebase_auth/firebase_auth.dart";


class StudentSigninScreen extends StatefulWidget{
  @override
  _StudentSigninScreenState createState()=>_StudentSigninScreenState();

}

class _StudentSigninScreenState extends State<StudentSigninScreen>{
  final blueColor = Color(0XFF5e92f3);
  final yellowColor = Color(0XFFfdd835);

  late Future <Map<dynamic,dynamic>> girisYapanOgrenci;

  StudentHelper _studentHelper =StudentHelper();

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  bool girisDurumu=true;
  bool durum=false;

  SigninController _signinController = SigninController();
  ResetPasswordScreen _resetPasswordScreen = ResetPasswordScreen();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          buildBackgroundTopCircle(),
          buildBackgroundBottomCircle(),

          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.only(left: 16,right: 16,top: 40,bottom: 0),
              child: Column(
                children: [

                  Text(
                    "Giriş Yap",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Righteous"),
                  ),
                  SizedBox(height: 14,),
                  buildAvatarContainer(),



                  Container(
                    height: 270,
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 10),

                    margin: EdgeInsets.only(top:40),
                    decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: Offset(0,1),
                        ),

                      ]

                    ),
                    child: Column(
                      children: [
                        buildTextField("E-MAIL ADRESİ", "test123@gmail.com", false,_emailController ),
                        SizedBox(
                          height: 20,
                        ),
                        buildTextField("ŞİFRE", "********", true,_passwordController),
                        Container(
                         margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                          child: Text(
                            "E-posta veya şifre yanlış.",
                            style: TextStyle(
                              color: girisDurumu==true?Colors.transparent:Colors.red
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    margin:EdgeInsets.only(top: 30),
                    child:
                    Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            //SizedBox(width: 15),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.push(context, MaterialPageRoute(builder:(context)=>ResetPasswordScreen() ));
                                });
                              },
                              child: Text(
                                "Şifremi Unuttum",
                                style: TextStyle(
                                    color: blueColor,
                                    //decoration: TextDecoration.underline,
                                    fontFamily: "Righteous"
                                ),
                              ),
                            ),
                            SizedBox(width: 40),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.push(context, MaterialPageRoute(builder:(context)=>StudentSignupScreen() ));
                                });
                              },
                              child: Text(
                                "Kayıt Oluştur",
                                style: TextStyle(
                                    color: blueColor,
                                    //decoration: TextDecoration.underline,
                                    fontFamily: "Righteous"
                                ),
                              ),
                            ),
                          ],
                        ),


                        SizedBox(height: 20,),
                        ElevatedButton(
                          onPressed: () async{


                            List sayac=[0,0,0];

                              var user= await _studentHelper.signIn(_emailController.text,_passwordController.text).then((value) async {
                                setState(() {
                                  durum=true;
                                });
                                print("1.$value");
                                Map studentDocMap= await StudentHelper.getStudent(value);
                                print("2.$studentDocMap");
                                var ref= await StudentHelper.StudentApplicationCounter(studentDocMap["studentId"]).then((value) {sayac=value;});
                                print("3.$sayac");

                                Navigator.push(context, MaterialPageRoute(builder:(context)=>StudentMainScreen(studentDocMap, sayac)));


                              }).onError((error, stackTrace) {

                                setState((){
                                  girisDurumu=false;
                                  durum=false;
                                });

                              });


                              if(durum==true){
                                setState((){
                                  girisDurumu=true;
                                  durum=false;
                                });
                              } else if(durum==false){
                                setState((){
                                  girisDurumu=false;
                                });
                              }




                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 60,vertical:12),
                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Giriş Yap",
                                  style: TextStyle(
                                    fontFamily: "Righteous",
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Icon(Icons.arrow_right,color:Colors.yellow),
                              ],

                            ),
                          ),

                        ),
                        SizedBox(height: 25),


                      ],),
                  ),
                ],
              ),
            ),
          ),
          Container(margin:EdgeInsets.only(top: 28,left: 14),child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_rounded,color: Colors.white,size: 30,))),





        ],
      )

    );
  }
  Positioned buildBackgroundTopCircle()
  {
    return Positioned(
      top: 0,
      child: Transform.translate(
        offset: Offset(0.0,-MediaQuery.of(context).size.width/1.3),
        child: Transform.scale(
          scale: 1.35,
          child: Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color:blueColor,
              borderRadius: BorderRadius.circular((
                  MediaQuery.of(context).size.width

              )),
            ),
          ),
        ),
      ),
    );
  }
  Positioned buildBackgroundBottomCircle()
  {
    return  Positioned(
      top:MediaQuery.of(context).size.height-MediaQuery.of(context).size.width,
      right: MediaQuery.of(context).size.width/2,
      child:Container(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color:blueColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular((
              MediaQuery.of(context).size.width

          )),
        ),
      ),
    );
  }
  Container buildAvatarContainer()
  {
    return Container(
      margin: EdgeInsets.only(top:8),
      width:130,
      height: 130,
      decoration: BoxDecoration(
          color: yellowColor,
          borderRadius: BorderRadius.circular(65),
          boxShadow: [BoxShadow(
              color:Colors.black.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 20
          ),]
      ),
      child: Center(
        child: Stack(
          children: [
            Positioned(
              left:1.0,
              top:3.0,
              child: Icon(Icons.person_outline,size: 60,color:Colors.black.withOpacity(0.1),),
            ),
            Icon(Icons.person_outline,size: 60,color: Colors.white,),
          ],
        ),
      ),
    );
  }
  Container buildTextField(String labelText,String placeHolder,bool isPassword, TextEditingController tec){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(
              color: blueColor,
              fontFamily:"Righteous",
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: tec,
            keyboardType: TextInputType.emailAddress,
            obscureText: isPassword,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              hintText:placeHolder,
              border:OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color:Colors.grey.shade300),
              ),

            ),
          ),
        ],
      ),
    );

  }

}