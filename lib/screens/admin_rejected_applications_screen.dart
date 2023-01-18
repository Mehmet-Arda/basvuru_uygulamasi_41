import 'package:basvuru_uygulamasi_41/screens/admin_application_details_screen.dart';
import 'package:basvuru_uygulamasi_41/storage_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:basvuru_uygulamasi_41/students_db_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class AdminRejectedApplicationsScreen extends StatefulWidget{
  late Map adminInfo;
  AdminRejectedApplicationsScreen(this.adminInfo);
  @override
  _AdminRejectedApplicationsScreenState createState()=>_AdminRejectedApplicationsScreenState(adminInfo);

}


class _AdminRejectedApplicationsScreenState extends State<AdminRejectedApplicationsScreen> {
  late Map adminInfo;

  final Stream<QuerySnapshot> _applicationStream0 = FirebaseFirestore.instance.collection('applications').snapshots();
  final Stream<QuerySnapshot> _applicationStream1 = FirebaseFirestore.instance.collection('applications').snapshots();
  final Stream<QuerySnapshot> _applicationStream2 = FirebaseFirestore.instance.collection('applications').snapshots();
  final Stream<QuerySnapshot> _applicationStream3 = FirebaseFirestore.instance.collection('applications').snapshots();
  final Stream<QuerySnapshot> _applicationStream4 = FirebaseFirestore.instance.collection('applications').snapshots();
  final Stream<QuerySnapshot> _applicationStream5 = FirebaseFirestore.instance.collection('applications').snapshots();


  _AdminRejectedApplicationsScreenState(this.adminInfo);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar:AppBar(
          automaticallyImplyLeading: false,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))
          ),
          title: Text("Reddedilen Başvurular",style: TextStyle(fontFamily: "Recursive",fontSize: 25),),
          centerTitle: true,
          elevation: 4,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueGrey.shade700,Colors.blueGrey.shade500],
                  begin: Alignment.bottomLeft,
                  end:Alignment.topRight,
                )
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            dragStartBehavior: DragStartBehavior.start,
            tabs: [
              Tab(icon: Icon(Icons.list,size: 25,),text: "Tümü",),
              Tab(icon: Icon(Icons.list_alt_rounded,size: 25,),text: "DGS",),
              Tab(icon: Icon(Icons.list_alt_rounded,size: 25,),text: "CAP",),
              Tab(icon: Icon(Icons.list_alt_rounded,size: 25,),text: "YG",),
              Tab(icon: Icon(Icons.list_alt_rounded,size: 25,),text: "Yokul",),
              Tab(icon: Icon(Icons.list_alt_rounded,size: 25,),text: "İntibk",),
            ],
          ),
        ),
        body: TabBarView(
          children: [


            StreamBuilder<QuerySnapshot>(
              stream: _applicationStream0,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Hata!'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text("Yükleniyor..."));
                }
                int sayac=0;
                List <Map<String,dynamic>>basvuru=[];

                snapshot.data?.docs.forEach((element){

                  if(element.get("approval_status")=="Reddedildi"){
                    sayac++;

                    basvuru.add(element.data()as Map<String,dynamic>);

                  }

                });

                return ListView.builder(


                    itemCount: sayac,
                    itemBuilder: (context,index){
                      var data=basvuru[index];

                      return Card(

                        color: Colors.red,
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: ListTile(

                          contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),

                          onTap: (){
                            print(data["student_id"]);
                            print(data["application_id"]);
                            showDialog(context: context,
                                builder: (context){
                                  return AlertDialog(
                                    contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    title: Row(
                                      children: [
                                        Icon(Icons.info_rounded,size: 40,color: Colors.blue.shade600,),
                                        SizedBox(width: 15,),
                                        Center(child: Text("Başvurulan Yer",style: TextStyle(fontFamily: "Recursive",fontSize: 20,color: Colors.green.shade800),)),
                                      ],
                                    ),
                                    elevation: 4,

                                    content: Container(
                                      height: 120,
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 10,),
                                          Center(child: Text("${data['applied_school']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),)),
                                          SizedBox(height: 10,),
                                          Center(child: Text("${data['applied_faculty']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),)),
                                          SizedBox(height: 10,),
                                          Flexible(child: Text("${data['applied_department']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),)),
                                        ],
                                      ),
                                    ),

                                  );

                                }
                            );
                          },
                          leading: CircleAvatar(radius: 30,backgroundImage: NetworkImage(data["student_image_url"]),),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${data['student_name']}",style: TextStyle(fontSize: 18,fontFamily: "Recursive"),),
                              Text("${data['student_surname']}",style: TextStyle(fontSize: 18,fontFamily: "Recursive"),),
                            ],
                          ),
                          subtitle: Text(data['application_date'],style: TextStyle(fontSize: 15,fontFamily: "Recursive")),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${data['application_type']}",style: TextStyle(fontSize: 20,fontFamily: "Recursive"),),
                              //SizedBox(height: 5,),
                              Text("${data['approval_status']}",style: TextStyle(fontSize: 20,fontFamily: "Recursive"),),
                            ],
                          ),
                        ),
                      );

                    }
                );
              },
            ),

            StreamBuilder<QuerySnapshot>(
              stream: _applicationStream1,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Hata!'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text("Yükleniyor..."));
                }
                int sayac=0;
                List <Map<String,dynamic>>basvuru=[];

                snapshot.data?.docs.forEach((element){

                  if(element.get("approval_status")=="Reddedildi" && element.get("application_type")=="Dgs"){
                    sayac++;

                    basvuru.add(element.data()as Map<String,dynamic>);

                  }

                });

                return ListView.builder(


                    itemCount: sayac,
                    itemBuilder: (context,index){
                      var data=basvuru[index];

                      return Card(

                        color: Colors.red,
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: ListTile(

                          contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),

                          onTap: (){
                            print(data["student_id"]);
                            print(data["application_id"]);
                            showDialog(context: context,
                                builder: (context){
                                  return AlertDialog(
                                    contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    title: Row(
                                      children: [
                                        Icon(Icons.info_rounded,size: 40,color: Colors.blue.shade600,),
                                        SizedBox(width: 15,),
                                        Center(child: Text("Başvurulan Yer",style: TextStyle(fontFamily: "Recursive",fontSize: 20,color: Colors.green.shade800),)),
                                      ],
                                    ),
                                    elevation: 4,

                                    content: Container(
                                      height: 120,
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 10,),
                                          Center(child: Text("${data['applied_school']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),)),
                                          SizedBox(height: 10,),
                                          Center(child: Text("${data['applied_faculty']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),)),
                                          SizedBox(height: 10,),
                                          Flexible(child: Text("${data['applied_department']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),)),
                                        ],
                                      ),
                                    ),

                                  );

                                }
                            );
                          },
                          leading: CircleAvatar(radius: 30,backgroundImage: NetworkImage(data["student_image_url"]),),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${data['student_name']}",style: TextStyle(fontSize: 18,fontFamily: "Recursive"),),
                              Text("${data['student_surname']}",style: TextStyle(fontSize: 18,fontFamily: "Recursive"),),
                            ],
                          ),
                          subtitle: Text(data['application_date'],style: TextStyle(fontSize: 15,fontFamily: "Recursive")),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${data['application_type']}",style: TextStyle(fontSize: 20,fontFamily: "Recursive"),),
                              //SizedBox(height: 5,),
                              Text("${data['approval_status']}",style: TextStyle(fontSize: 20,fontFamily: "Recursive"),),
                            ],
                          ),
                        ),
                      );

                    }
                );
              },
            ),

            StreamBuilder<QuerySnapshot>(
              stream: _applicationStream2,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Hata!'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text("Yükleniyor..."));
                }
                int sayac=0;
                List <Map<String,dynamic>>basvuru=[];

                snapshot.data?.docs.forEach((element){

                  if(element.get("approval_status")=="Reddedildi"&& element.get("application_type")=="Çap"){
                    sayac++;

                    basvuru.add(element.data()as Map<String,dynamic>);

                  }

                });

                return ListView.builder(


                    itemCount: sayac,
                    itemBuilder: (context,index){
                      var data=basvuru[index];


                      return Card(

                        color: Colors.red,
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: ListTile(

                          contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),

                          onTap: (){
                            print(data["student_id"]);
                            print(data["application_id"]);
                            showDialog(context: context,
                                builder: (context){
                                  return AlertDialog(
                                    contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    title: Row(
                                      children: [
                                        Icon(Icons.info_rounded,size: 40,color: Colors.blue.shade600,),
                                        SizedBox(width: 15,),
                                        Center(child: Text("Başvurulan Yer",style: TextStyle(fontFamily: "Recursive",fontSize: 20,color: Colors.green.shade800),)),
                                      ],
                                    ),
                                    elevation: 4,

                                    content: Container(
                                      height: 120,
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 10,),
                                          Center(child: Text("${data['applied_school']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),)),
                                          SizedBox(height: 10,),
                                          Center(child: Text("${data['applied_faculty']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),)),
                                          SizedBox(height: 10,),
                                          Flexible(child: Text("${data['applied_department']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),)),
                                        ],
                                      ),
                                    ),

                                  );

                                }
                            );
                          },
                          leading: CircleAvatar(radius: 30,backgroundImage: NetworkImage(data["student_image_url"]),),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${data['student_name']}",style: TextStyle(fontSize: 18,fontFamily: "Recursive"),),
                              Text("${data['student_surname']}",style: TextStyle(fontSize: 18,fontFamily: "Recursive"),),
                            ],
                          ),
                          subtitle: Text(data['application_date'],style: TextStyle(fontSize: 15,fontFamily: "Recursive")),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${data['application_type']}",style: TextStyle(fontSize: 20,fontFamily: "Recursive"),),
                              //SizedBox(height: 5,),
                              Text("${data['approval_status']}",style: TextStyle(fontSize: 20,fontFamily: "Recursive"),),
                            ],
                          ),
                        ),
                      );




                    }
                );
              },
            ),

            StreamBuilder<QuerySnapshot>(
              stream: _applicationStream3,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Hata!'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text("Yükleniyor..."));
                }
                int sayac=0;
                List <Map<String,dynamic>>basvuru=[];

                snapshot.data?.docs.forEach((element){

                  if(element.get("approval_status")=="Reddedildi"&& element.get("application_type")=="Yatay Geçiş"){
                    sayac++;

                    basvuru.add(element.data()as Map<String,dynamic>);

                  }

                });



                return ListView.builder(


                    itemCount: sayac,
                    itemBuilder: (context,index){
                      var data=basvuru[index];


                      return Card(

                        color: Colors.red,
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: ListTile(

                          contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),

                          onTap: (){
                            print(data["student_id"]);
                            print(data["application_id"]);
                            showDialog(context: context,
                                builder: (context){
                                  return AlertDialog(
                                    contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    title: Row(
                                      children: [
                                        Icon(Icons.info_rounded,size: 40,color: Colors.blue.shade600,),
                                        SizedBox(width: 15,),
                                        Center(child: Text("Başvurulan Yer",style: TextStyle(fontFamily: "Recursive",fontSize: 20,color: Colors.green.shade800),)),
                                      ],
                                    ),
                                    elevation: 4,

                                    content: Container(
                                      height: 120,
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 10,),
                                          Center(child: Text("${data['applied_school']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),)),
                                          SizedBox(height: 10,),
                                          Center(child: Text("${data['applied_faculty']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),)),
                                          SizedBox(height: 10,),
                                          Flexible(child: Text("${data['applied_department']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),)),
                                        ],
                                      ),
                                    ),

                                  );

                                }
                            );
                          },
                          leading: CircleAvatar(radius: 30,backgroundImage: NetworkImage(data["student_image_url"]),),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${data['student_name']}",style: TextStyle(fontSize: 18,fontFamily: "Recursive"),),
                              Text("${data['student_surname']}",style: TextStyle(fontSize: 18,fontFamily: "Recursive"),),
                            ],
                          ),
                          subtitle: Text(data['application_date'],style: TextStyle(fontSize: 15,fontFamily: "Recursive")),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${data['application_type']}",style: TextStyle(fontSize: 20,fontFamily: "Recursive"),),
                              //SizedBox(height: 5,),
                              Text("${data['approval_status']}",style: TextStyle(fontSize: 20,fontFamily: "Recursive"),),
                            ],
                          ),
                        ),
                      );




                    }
                );
              },
            ),

            StreamBuilder<QuerySnapshot>(
              stream: _applicationStream4,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Hata!'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text("Yükleniyor..."));
                }
                int sayac=0;
                List <Map<String,dynamic>>basvuru=[];

                snapshot.data?.docs.forEach((element){

                  if(element.get("approval_status")=="Reddedildi" && element.get("application_type")=="Yaz Okulu"){
                    sayac++;

                    basvuru.add(element.data()as Map<String,dynamic>);



                  }

                });



                return ListView.builder(


                    itemCount: sayac,
                    itemBuilder: (context,index){
                      var data=basvuru[index];


                      return Card(

                        color: Colors.red,
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: ListTile(

                          contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),

                          onTap: (){
                            print(data["student_id"]);
                            print(data["application_id"]);
                            showDialog(context: context,
                                builder: (context){
                                  return AlertDialog(
                                    contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    title: Row(
                                      children: [
                                        Icon(Icons.info_rounded,size: 40,color: Colors.blue.shade600,),
                                        SizedBox(width: 15,),
                                        Center(child: Text("Başvurulan Yer",style: TextStyle(fontFamily: "Recursive",fontSize: 20,color: Colors.green.shade800),)),
                                      ],
                                    ),
                                    elevation: 4,

                                    content: Container(
                                      height: 120,
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 10,),
                                          Center(child: Text("${data['applied_school']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),)),
                                          SizedBox(height: 10,),
                                          Center(child: Text("${data['applied_faculty']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),)),
                                          SizedBox(height: 10,),
                                          Flexible(child: Text("${data['applied_department']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),)),
                                        ],
                                      ),
                                    ),

                                  );

                                }
                            );
                          },
                          leading: CircleAvatar(radius: 30,backgroundImage: NetworkImage(data["student_image_url"]),),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${data['student_name']}",style: TextStyle(fontSize: 18,fontFamily: "Recursive"),),
                              Text("${data['student_surname']}",style: TextStyle(fontSize: 18,fontFamily: "Recursive"),),
                            ],
                          ),
                          subtitle: Text(data['application_date'],style: TextStyle(fontSize: 15,fontFamily: "Recursive")),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${data['application_type']}",style: TextStyle(fontSize: 20,fontFamily: "Recursive"),),
                              //SizedBox(height: 5,),
                              Text("${data['approval_status']}",style: TextStyle(fontSize: 20,fontFamily: "Recursive"),),
                            ],
                          ),
                        ),
                      );




                    }
                );
              },
            ),

            StreamBuilder<QuerySnapshot>(
              stream: _applicationStream5,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Hata!'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text("Yükleniyor..."));
                }
                int sayac=0;
                List <Map<String,dynamic>>basvuru=[];

                snapshot.data?.docs.forEach((element){

                  if(element.get("approval_status")=="Reddedildi"&& element.get("application_type")=="İntibak"){
                    sayac++;

                    basvuru.add(element.data()as Map<String,dynamic>);



                  }

                });



                return ListView.builder(


                    itemCount: sayac,
                    itemBuilder: (context,index){
                      var data=basvuru[index];


                      return Card(

                        color: Colors.red,
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: ListTile(

                          contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),

                          onTap: (){
                            print(data["student_id"]);
                            print(data["application_id"]);
                            showDialog(context: context,
                                builder: (context){
                                  return AlertDialog(
                                    contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    title: Row(
                                      children: [
                                        Icon(Icons.info_rounded,size: 40,color: Colors.blue.shade600,),
                                        SizedBox(width: 15,),
                                        Center(child: Text("Başvurulan Yer",style: TextStyle(fontFamily: "Recursive",fontSize: 20,color: Colors.green.shade800),)),
                                      ],
                                    ),
                                    elevation: 4,

                                    content: Container(
                                      height: 120,
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 10,),
                                          Center(child: Text("${data['applied_school']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),)),
                                          SizedBox(height: 10,),
                                          Center(child: Text("${data['applied_faculty']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),)),
                                          SizedBox(height: 10,),
                                          Flexible(child: Text("${data['applied_department']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),)),
                                        ],
                                      ),
                                    ),

                                  );

                                }
                            );
                          },
                          leading: CircleAvatar(radius: 30,backgroundImage: NetworkImage(data["student_image_url"]),),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${data['student_name']}",style: TextStyle(fontSize: 18,fontFamily: "Recursive"),),
                              Text("${data['student_surname']}",style: TextStyle(fontSize: 18,fontFamily: "Recursive"),),
                            ],
                          ),
                          subtitle: Text(data['application_date'],style: TextStyle(fontSize: 15,fontFamily: "Recursive")),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${data['application_type']}",style: TextStyle(fontSize: 20,fontFamily: "Recursive"),),
                              //SizedBox(height: 5,),
                              Text("${data['approval_status']}",style: TextStyle(fontSize: 20,fontFamily: "Recursive"),),
                            ],
                          ),
                        ),
                      );




                    }
                );
              },
            ),


          ],
        ),
      ),
    );


  }
  Color renkBelirle(String basvuruDurumu){
    if(basvuruDurumu=="Beklemede"){
      return Colors.yellow.shade500;
    }
    else if(basvuruDurumu=="Onaylandı"){
      return Colors.green.shade400;
    }
    else{return Colors.redAccent.shade400;}
  }


  CollectionReference applications = FirebaseFirestore.instance.collection('applications');

  Future<void> updateApplicationStatus(Map data,String durum) {
    return applications
        .doc(data["application_id"])
        .update({'approval_status': durum})
        .then((value) => print("Application Updated"))
        .catchError((error) => print("Failed to update application: $error"));
  }


}