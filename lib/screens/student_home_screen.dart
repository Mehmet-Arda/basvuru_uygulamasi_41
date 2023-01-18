import 'package:basvuru_uygulamasi_41/storage_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class StudentHomeScreen extends StatefulWidget{
  late Map studentInfo;
  late List sayac;
  StudentHomeScreen(this.studentInfo,this.sayac);
  @override
  _StudentHomeScreenState createState()=>_StudentHomeScreenState(studentInfo,sayac);


}


class _StudentHomeScreenState extends State<StudentHomeScreen>{

  final Stream<QuerySnapshot> _applicationStream = FirebaseFirestore.instance.collection('applications').snapshots();

  late Map studentInfo;
  late List sayac;




  _StudentHomeScreenState(this.studentInfo,this.sayac);


  @override
  Widget build(BuildContext context) {





    String studentImageUrl=studentInfo["studentImage"];

    StorageHelper _storageHelper=StorageHelper();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.shade400,
        title: Text("Ana Sayfa",style: TextStyle(fontFamily: "Recursive",fontSize: 25),),
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
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            decoration: BoxDecoration(
                gradient:  LinearGradient(
                  colors: [Colors.blue.shade100,Colors.blue.shade50],
                  begin: Alignment.bottomLeft,
                  end:Alignment.topRight,
                )
            ),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.center,

              children: [

                Container(
                    margin: EdgeInsets.only(top: 14),
                    width: 130,
                    height: 130,
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
                      backgroundImage: NetworkImage(studentImageUrl),
                    )),

                SizedBox(height: 10,),
                Text("Hoşgeldiniz,",style: TextStyle(fontSize: 25,fontFamily: "Righteous",color: Colors.red),),
                SizedBox(height: 10,),
                Column(
                  children: [
                    Text("${studentInfo["studentName"]}",style: TextStyle(fontSize: 25,fontFamily: "Recursive",),),
                    Text("${studentInfo["studentSurname"]}",style: TextStyle(fontSize: 25,fontFamily: "Recursive",),),
                  ],
                ),
                SizedBox(height: 10,),
                Divider(height: 2,thickness: 2,color: Colors.white,),
                Container(
                  height: 200,
                  margin: EdgeInsets.fromLTRB(20, 15, 20,0),
                  //padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            color: Colors.green,
                            child: Icon(Icons.done_rounded,color: Colors.white,size: 40,),
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            color: Colors.blueGrey.shade700,
                            child: Center(
                              child: Text(
                                sayac[0].toString(),style: TextStyle(fontFamily: "Righteous",fontSize: 30,color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 30,
                            width: 110,
                            child: Column(
                              children: [
                                Text("Kabul Edilen",style: TextStyle(fontFamily: "Recursive",fontSize: 15)),
                                Divider(height: 4,thickness: 4,color: Colors.white,),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //SizedBox(width: 15,),
                      Column(

                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 0),
                            height: 80,
                            width: 80,
                            color: Colors.yellow.shade600,
                            child: Icon(Icons.horizontal_rule_rounded,color: Colors.black,size: 40,),
                          ),

                          Container(
                            height: 80,
                            width: 80,
                            color: Colors.blueGrey.shade700,
                            child: Center(
                              child: Text(
                                sayac[1].toString(),style: TextStyle(fontFamily: "Righteous",fontSize: 30,color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 30,
                            width: 100,
                            child: Column(
                              children: [
                                Text("Beklemede",style: TextStyle(fontFamily: "Recursive",fontSize: 15)),
                                Divider(height: 4,thickness: 4,color: Colors.white,),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //SizedBox(width: 15,),
                      Column(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            color: Colors.red,
                            child: Icon(Icons.close_rounded,color: Colors.white,size: 40,),
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            color: Colors.blueGrey.shade700,
                            child: Center(
                              child: Text(
                                sayac[2].toString(),style: TextStyle(fontFamily: "Righteous",fontSize: 30,color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 30,
                            width: 100,
                            child: Column(
                              children: [
                                Text("Reddedilen",style: TextStyle(fontFamily: "Recursive",fontSize: 15)),
                                Divider(height: 4,thickness: 4,color: Colors.white,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                ),
                Text("Başvurularım",style: TextStyle(fontSize: 20,fontFamily: "Righteous"),),






              ],
            ),
          )
        ],
      ),
    );
  }
}
