import 'package:basvuru_uygulamasi_41/screens/student_cap_application_screen.dart';
import 'package:basvuru_uygulamasi_41/screens/student_yatay_gecis_application_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'student_dgs_application_screen.dart';

class StudentCreateApplicationScreen extends StatefulWidget {
  late Map studentInfo;
  StudentCreateApplicationScreen(this.studentInfo);
  @override
  _StudentCreateApplicationScreenState createState() =>
      _StudentCreateApplicationScreenState(studentInfo);
}

class _StudentCreateApplicationScreenState
    extends State<StudentCreateApplicationScreen> {
  late Map studentInfo;

  bool isDgs=false;
  bool isCap=false;
  bool isYatayGecis=false;
  bool isIntibak=false;
  bool isYazOkulu=false;



  _StudentCreateApplicationScreenState(this.studentInfo);

  @override
  Widget build(BuildContext context) {

    List basvuruTuru=[ isDgs,isCap,isYatayGecis,isIntibak,isYazOkulu];

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
      backgroundColor: Colors.blue.shade400,
            title: Text(
                "Yeni Başvuru Oluştur",
              style: TextStyle(fontFamily: "Recursive", fontSize: 25),
                ),
          centerTitle: true,
          elevation: 4,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
        )),
      ),),

      body: Container(
        padding: EdgeInsets.fromLTRB(0, 55, 0, 0),
        color: Colors.blue.shade100,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    setState(() {

                      BasvuruButonRenkGuncelle("DGS");

                    });

                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    //color: Colors.white,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: isDgs?[Colors.green.shade600,Colors.greenAccent.shade700]: [Colors.blueGrey.shade700,Colors.grey.shade700]
                      ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                            BoxShadow(
                         color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                           spreadRadius: 5),
                        ]),
                    child: Center(
                      child: Text(
                        "DGS",style: TextStyle(fontFamily: "Recursive",fontSize: 30,color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30,),
                InkWell(
                  onTap: (){
                    setState(() {

                      BasvuruButonRenkGuncelle("CAP");

                    });

                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    //color: Colors.white,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: isCap?[Colors.green.shade600,Colors.greenAccent.shade700]: [Colors.blueGrey.shade700,Colors.grey.shade700]
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 15,
                              spreadRadius: 5),
                        ]),
                    child: Center(
                      child: Text(
                        "ÇAP",style: TextStyle(fontFamily: "Recursive",fontSize: 30,color: Colors.white),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    setState(() {

                      BasvuruButonRenkGuncelle("YatayGecis");

                    });

                  },
                  child: Container(
                    //margin: EdgeInsets.all(15),
                    height: 100,
                    width: 100,
                    //color: Colors.white,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: isYatayGecis?[Colors.green.shade600,Colors.greenAccent.shade700]: [Colors.blueGrey.shade700,Colors.grey.shade700]
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 15,
                              spreadRadius: 5),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Yatay",style: TextStyle(fontFamily: "Recursive",fontSize: 25,color: Colors.white),),
                        Text("Geçiş",style: TextStyle(fontFamily: "Recursive",fontSize: 25,color: Colors.white),),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 30,),
                InkWell(
                  onTap: (){
                    setState(() {

                      BasvuruButonRenkGuncelle("Intibak");

                    });

                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    //color: Colors.white,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: isIntibak?[Colors.green.shade600,Colors.greenAccent.shade700]: [Colors.blueGrey.shade700,Colors.grey.shade700]
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 15,
                              spreadRadius: 5),
                        ]),
                    child: Center(
                      child: Text(
                        "İntibak",style: TextStyle(fontFamily: "Recursive",fontSize: 23,color: Colors.white),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    setState(() {

                      BasvuruButonRenkGuncelle("YazOkulu");

                    });

                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    //color: Colors.white,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: isYazOkulu?[Colors.green.shade600,Colors.greenAccent.shade700]: [Colors.blueGrey.shade700,Colors.grey.shade700]
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 15,
                              spreadRadius: 5),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Yaz",style: TextStyle(fontFamily: "Recursive",fontSize: 25,color: Colors.white),),
                        Text("Okulu",style: TextStyle(fontFamily: "Recursive",fontSize: 25,color: Colors.white),),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 30,),
                Container(

                  height: 100,
                  width: 100,
                  child: ElevatedButton(

                      style: ButtonStyle(
                          backgroundColor: (basvuruTuru.contains(true))?MaterialStateProperty.all<Color>(Colors.blueAccent.shade400):MaterialStateProperty.all<Color>(Colors.redAccent.shade400),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60),
                                  side: BorderSide(color: Colors.black)
                              )
                          )
                      ),
                      onPressed: (){

                        if(isDgs){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>DgsApplicationScreen(studentInfo)));
                        }
                        if(isCap){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>CapApplicationScreen(studentInfo)));
                        }
                        if(isYatayGecis){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>YatayGecisApplicationScreen(studentInfo)));
                        }
                        if(isIntibak){
                         // Navigator.push(context,MaterialPageRoute(builder: (context)=>DgsApplicationScreen(studentInfo)));
                        }
                        if(isYazOkulu){
                         // Navigator.push(context,MaterialPageRoute(builder: (context)=>DgsApplicationScreen(studentInfo)));
                        }




                      },
                      child:
                      Icon(Icons.send_rounded,size: 35,)

                  ),
                ),

              ],
            ),

          ],


        ),
      ),

    );


  }

  void BasvuruButonRenkGuncelle(String tiklananBasvuru){

    switch(tiklananBasvuru){

      case "DGS":
        setState(() {
          isDgs=true;
          isCap=false;
          isYatayGecis=false;
          isIntibak=false;
          isYazOkulu=false;
        });

      break;

      case "CAP":
        setState(() {
          isDgs=false;
          isCap=true;
          isYatayGecis=false;
          isIntibak=false;
          isYazOkulu=false;
        });
        break;

      case "YatayGecis":
        setState(() {
          isDgs=false;
          isCap=false;
          isYatayGecis=true;
          isIntibak=false;
          isYazOkulu=false;
        });
        break;

      case "Intibak":
        setState(() {
          isDgs=false;
          isCap=false;
          isYatayGecis=false;
          isIntibak=true;
          isYazOkulu=false;
        });
        break;

      case "YazOkulu":
        setState(() {
          isDgs=false;
          isCap=false;
          isYatayGecis=false;
          isIntibak=false;
          isYazOkulu=true;
        });
        break;


    }

  }
}
