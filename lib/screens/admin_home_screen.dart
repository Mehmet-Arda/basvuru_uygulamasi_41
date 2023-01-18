import 'package:basvuru_uygulamasi_41/storage_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class AdminHomeScreen extends StatefulWidget{
  late Map adminInfo;
  late List sayac;
  AdminHomeScreen(this.adminInfo,this.sayac);
  @override
  _AdminHomeScreenState createState()=>_AdminHomeScreenState(adminInfo,sayac);


}


class _AdminHomeScreenState extends State<AdminHomeScreen>{


  late Map adminInfo;
  late List sayac;



  _AdminHomeScreenState(this.adminInfo,this.sayac);


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Ana Sayfa",style: TextStyle(fontFamily: "Recursive",fontSize: 25),),
        centerTitle: true,
        elevation: 4,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient:  LinearGradient(
                colors: [Colors.blueGrey.shade700,Colors.blueGrey.shade500],
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
                  colors: [Colors.blueGrey.shade200,Colors.blueGrey.shade100],
                  begin: Alignment.bottomLeft,
                  end:Alignment.topRight,
                )
            ),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20),
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
                      backgroundColor: Colors.blueGrey.shade700,

                      child: Icon(Icons.admin_panel_settings_rounded,size: 70,color: Colors.white,),
                    )),

                SizedBox(height: 10,),
                Text("Hoşgeldiniz,",style: TextStyle(fontSize: 25,fontFamily: "Righteous",color: Colors.red),),
                SizedBox(height: 10,),
                Container(

                    child: Column(
                      children: [
                        Text("${adminInfo["admin_name"]} ",style: TextStyle(fontSize: 25,fontFamily: "Recursive",),),
                        Text("${adminInfo["admin_surname"]}",style: TextStyle(fontSize: 25,fontFamily: "Recursive",),),
                      ],
                    )),
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
                Text("Başvurular",style: TextStyle(fontSize: 20,fontFamily: "Righteous"),),


              ],
            ),
          )
        ],
      ),
    );
  }
}
