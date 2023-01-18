
import 'package:flutter/material.dart';


class StudentProfileScreen extends StatefulWidget{
  late Map studentInfo;
  StudentProfileScreen(this.studentInfo);
  @override
  _StudentProfileScreenState createState()=>_StudentProfileScreenState(studentInfo);

}


class _StudentProfileScreenState extends State<StudentProfileScreen> {
  late Map studentInfo;

  _StudentProfileScreenState(this.studentInfo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Öğrenci Bilgileri",style: TextStyle(fontFamily: "Recursive",fontSize: 25),),
        centerTitle: true,
        elevation: 4,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient:  LinearGradient(
                colors: [Colors.blue,Colors.lightBlueAccent],
                begin: Alignment.bottomLeft,
                end:Alignment.topRight,
              )
          ),
        ),

      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent],
            )),

        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),

        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(

                      width: 100,
                      height: 100,
                     decoration: BoxDecoration(
                      color: Colors.grey[800],
                       borderRadius: BorderRadius.circular(65),
                          boxShadow: [
                        BoxShadow(
                         color: Colors.black.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 20),
                        ]),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(studentInfo["studentImage"]),
                      )),
                  SizedBox(width: 15,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Öğrencinin,",style: TextStyle(fontFamily: "Righteous",fontSize: 25,color: Colors.lightGreenAccent.shade400),),
                      SizedBox(height: 15,),
                      Text("Adı: ${studentInfo["studentName"]}",style: TextStyle(fontFamily: "Recursive",fontSize: 20,),),
                      SizedBox(height: 5,),
                      Text("Soyadı: ${studentInfo["studentSurname"]}",style: TextStyle(fontFamily: "Recursive",fontSize: 20),),
                      SizedBox(height: 5,),
                      Text("TC No: ${studentInfo["tcNumber"]}",style: TextStyle(fontFamily: "Recursive",fontSize: 20),),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
             // color: Colors.redAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container( padding: EdgeInsets.all(16),
                        decoration:BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(16))
                        ),
                        child: Center(child: Text("Okulu: ${studentInfo["schoolName"]}",style: TextStyle(fontFamily: "Recursive",fontSize: 20,),))),
                    SizedBox(height: 10,),
                    Container( padding: EdgeInsets.all(16),
                        decoration:BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(16))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: Text("Fakültesi: ${studentInfo["faculty"]}",style: TextStyle(fontFamily: "Recursive",fontSize: 17,),)),
                            SizedBox(height: 6,),
                            Center(child: Text("Bölümü: ${studentInfo["department"]}",style: TextStyle(fontFamily: "Recursive",fontSize: 17,),)),
                          ],
                        )),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16))
                      ),
                        child: Center(child: Text("Sınıfı: ${studentInfo["grade"]}",style: TextStyle(fontFamily: "Recursive",fontSize: 20,),))),
                    SizedBox(height: 10,),
                    Container(
                        padding: EdgeInsets.all(16),
                        decoration:BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(16))
                        ),
                        child: Center(child: Text("Okul Numarası: ${studentInfo["schoolNumber"]}",style: TextStyle(fontFamily: "Recursive",fontSize: 20,),))),
                  ],
                )),
          ],
        ),
      ),


    );
  }
}