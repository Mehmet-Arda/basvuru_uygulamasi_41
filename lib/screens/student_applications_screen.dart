
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class StudentApplicationsScreen extends StatefulWidget{
  late Map studentInfo;
  StudentApplicationsScreen(this.studentInfo);
  @override
  _StudentApplicationsScreenState createState()=>_StudentApplicationsScreenState(studentInfo);

}


class _StudentApplicationsScreenState extends State<StudentApplicationsScreen> {
  late Map studentInfo;

  final Stream<QuerySnapshot> _applicationStream0 = FirebaseFirestore.instance.collection('applications').snapshots();
  final Stream<QuerySnapshot> _applicationStream1 = FirebaseFirestore.instance.collection('applications').snapshots();
  final Stream<QuerySnapshot> _applicationStream2 = FirebaseFirestore.instance.collection('applications').snapshots();
  final Stream<QuerySnapshot> _applicationStream3 = FirebaseFirestore.instance.collection('applications').snapshots();

  _StudentApplicationsScreenState(this.studentInfo);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar:AppBar(
          automaticallyImplyLeading: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))
          ),
          title: Text("Başvurularım",style: TextStyle(fontFamily: "Recursive",fontSize: 25),),
          centerTitle: true,
          elevation: 4,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade700,Colors.lightBlueAccent],
                  begin: Alignment.bottomLeft,
                  end:Alignment.topRight,
                )
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(icon: Icon(Icons.list,size: 25,),text: "Tamamı",),
              Tab(icon: Icon(Icons.done_all_rounded,size: 25,),text: "Onaylanan",),
              Tab(icon: Icon(Icons.horizontal_rule_rounded,size: 25,),text: "Beklemede",),
              Tab(icon: Icon(Icons.close_rounded,size: 25,),text: "Reddedilen",),
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

                  if(element.get("student_id")==studentInfo["studentId"] ){
                    sayac++;

                    basvuru.add(element.data()as Map<String,dynamic>);

                  }

                });



                return ListView.builder(


                    itemCount: sayac,
                    itemBuilder: (context,index){
                      var data=basvuru[index];


                      return Card(

                        color: renkBelirle(data["approval_status"]),
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
                                          Text("${data['applied_school']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),),
                                          SizedBox(height: 10,),
                                          Text("${data['applied_faculty']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),),
                                          SizedBox(height: 10,),
                                          Text("${data['applied_department']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),),
                                        ],
                                      ),
                                    ),

                                  );

                                }
                            );
                          },
                          leading: iconBelirle(data["approval_status"]),
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

                  if(element.get("approval_status")=="Onaylandı" && element.get("student_id")==studentInfo["studentId"] ){
                    sayac++;

                    basvuru.add(element.data()as Map<String,dynamic>);



                  }

                });



                return ListView.builder(


                    itemCount: sayac,
                    itemBuilder: (context,index){
                      var data=basvuru[index];


                      return Card(

                        color: renkBelirle(data["approval_status"]),
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
                                          Text("${data['applied_school']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),),
                                          SizedBox(height: 10,),
                                          Text("${data['applied_faculty']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),),
                                          SizedBox(height: 10,),
                                          Text("${data['applied_department']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),),
                                        ],
                                      ),
                                    ),

                                  );

                                }
                            );
                          },
                          leading: iconBelirle(data["approval_status"]),
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

                  if(element.get("approval_status")=="Beklemede" && element.get("student_id")==studentInfo["studentId"] ){
                    sayac++;

                    basvuru.add(element.data()as Map<String,dynamic>);



                  }

                });



                return ListView.builder(


                    itemCount: sayac,
                    itemBuilder: (context,index){
                      var data=basvuru[index];


                      return Card(

                        color: renkBelirle(data["approval_status"]),
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
                                          Text("${data['applied_school']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),),
                                          SizedBox(height: 10,),
                                          Text("${data['applied_faculty']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),),
                                          SizedBox(height: 10,),
                                          Text("${data['applied_department']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),),
                                        ],
                                      ),
                                    ),

                                  );

                                }
                            );
                          },
                          leading: iconBelirle(data["approval_status"]),
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

                  if(element.get("approval_status")=="Reddedildi" && element.get("student_id")==studentInfo["studentId"] ){
                    sayac++;

                    basvuru.add(element.data()as Map<String,dynamic>);



                  }

                });



                return ListView.builder(


                    itemCount: sayac,
                    itemBuilder: (context,index){
                      var data=basvuru[index];


                      return Card(

                        color: renkBelirle(data["approval_status"]),
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
                                          Text("${data['applied_school']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),),
                                          SizedBox(height: 10,),
                                          Text("${data['applied_faculty']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),),
                                          SizedBox(height: 10,),
                                          Text("${data['applied_department']}",style: TextStyle(fontFamily: "Recursive",fontSize: 15),),
                                        ],
                                      ),
                                    ),

                                  );

                                }
                            );
                          },
                          leading: iconBelirle(data["approval_status"]),
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
      return Colors.yellow.shade600;
    }
    else if(basvuruDurumu=="Onaylandı"){
      return Colors.green;
    }
    else{return Colors.red;}
  }

  Icon iconBelirle(String basvuruDurumu){
    if(basvuruDurumu=="Onaylandı"){
      return Icon(Icons.done_rounded,color: Colors.black,size: 30,);
    }
    if(basvuruDurumu=="Reddedildi"){
      return Icon(Icons.close_rounded,color: Colors.black,size: 30,);
    }
    else{
      return Icon(Icons.horizontal_rule_rounded,color: Colors.black,size: 30,);
    }

  }
}