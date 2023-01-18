import 'package:basvuru_uygulamasi_41/screens/student_signin_screen.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'admin_signin_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isAdmin = false;
  bool isStudent = false;
  final blueColor = Color(0XFF5e92f3);
  final yellowColor = Color(0XFFfdd835);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Stack(
        children: [


          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/images/arka_plan21.jpg"),
                  fit: BoxFit.fill),
            ),
            child: Container(
                color:Colors.blueGrey.withOpacity(.7)
                ),
          ),

          Container(

            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 28,
                ),
                RichText(
                  text: TextSpan(
                    text: "Kocaeli Üniversitesi",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily:"Righteous",
                        //fontWeight:FontWeight.normal,
                        color: Colors.white
                    ),

                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Başvuru Sistemi",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Righteous",
                        //fontWeight:FontWeight.bold,
                        color: Colors.white
                    ),

                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    text: "DGS-ÇAP-Yaz Okulu-Yatay Geçiş-Ders İntibakı",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Recursive",
                        color: Colors.white
                    ),

                  ),
                ),

                SizedBox(
                  height: 14,
                ),


                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 14, 0),

                  height: 420,
                  width: 300,

                  decoration: BoxDecoration(

                    color:Colors.black.withOpacity(.7),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
                    boxShadow:[
                      BoxShadow(
                        color:Colors.black.withOpacity(0.3),
                        blurRadius: 14,
                        spreadRadius: 3,

                      )
                    ],
                  ),

                  child:
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isAdmin = true;
                            isStudent = false;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RotatedBox(

                              quarterTurns:3,

                              child: Container(
                                margin: EdgeInsets.only(right: 18),
                                child: RichText(
                                  text: TextSpan(
                                    text: isAdmin? "YÖNETİCİ":"",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Righteous",
                                        color: Colors.white
                                    ),

                                  ),
                                ),
                              ),

                            ),
                            Container(
                              margin: EdgeInsets.only(top: 18),

                                height:160,
                                width: 4,
                                decoration:
                                BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color:isAdmin? Colors.redAccent.shade400:Colors.transparent
                                ),

                            ),
                            SizedBox(width: 10,),

                            Container(
                              padding: EdgeInsets.all(25),

                              height: 180,
                              width: 190,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: isAdmin
                                          ? <Color>[
                                        Colors.redAccent.shade200,
                                        Colors.redAccent.shade400,
                                        //Colors.redAccent.shade400
                                      ]
                                          : <Color>[Colors.blueGrey, Colors.grey]),
                                  //color: Colors.red,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 15,
                                        spreadRadius: 5),
                                  ]),
                              child: Image.asset('lib/images/admin.png'),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isAdmin = false;
                            isStudent = true;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RotatedBox(
                              quarterTurns:3,

                              child: Container(
                                margin: EdgeInsets.only(left: 18),
                                child: RichText(
                                  text: TextSpan(
                                    text: isStudent? "ÖĞRENCİ":"",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Righteous",
                                        color: Colors.white
                                    ),

                                  ),
                                ),
                              ),

                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: 18),

                                height:160,
                                width: 4,
                                decoration:
                                BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color:isStudent? Colors.blue:Colors.transparent,
                                )
                            ),
                            SizedBox(width: 10,),
                            Container(
                              padding: EdgeInsets.all(25),
                              height: 180,
                              width: 190,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: isStudent
                                          ? <Color>[
                                        Colors.lightBlue.shade400,
                                        Colors.blue.shade500
                                      ]
                                          : <Color>[Colors.blueGrey, Colors.grey]),
                                  //color: Colors.red,
                                  borderRadius:  BorderRadius.only(topRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 15,
                                        spreadRadius: 5),
                                  ]),
                              child: Image.asset('lib/images/graduated.png'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25,),

                    ],
                  ),

                ),
                SizedBox(
                  height: 8,
                ),

                Container(

                  padding: EdgeInsets.all(10),

                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: (isAdmin ||isStudent)?Colors.green.withOpacity(.7):Colors.red.withOpacity(.7),
                      borderRadius:BorderRadius.circular(60),

                      boxShadow: [
                        BoxShadow(
                            color: Colors.black87.withOpacity(.7),
                            spreadRadius: 2,
                            blurRadius: 2
                        )]

                  ),
                  child: ElevatedButton(

                    style: ButtonStyle(
                        backgroundColor: (isAdmin ||isStudent)?MaterialStateProperty.all<Color>(Colors.blue):MaterialStateProperty.all<Color>(Colors.blueGrey),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60),
                                side: BorderSide(color: Colors.black)
                            )
                        )
                    ),
                    onPressed: (){

                      if(isAdmin){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>AdminSigninScreen() ));

                      }else if(isStudent){

                        Navigator.push(context, MaterialPageRoute(builder:(context)=>StudentSigninScreen() ));

                      }


                    },
                    child:Icon(Icons.arrow_forward,color:Colors.white,size:35),
                  ),

                ),



              ],
            ),
          ),







        ],
      ),
    );
  }
}
