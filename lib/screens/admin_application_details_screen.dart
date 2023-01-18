
import 'package:basvuru_uygulamasi_41/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class AdminApplicationDetailScreen extends StatefulWidget{
  late Map studentInfo;
  late Map applicationInfo;
  AdminApplicationDetailScreen(this.studentInfo,this.applicationInfo);
  @override
  _AdminApplicationDetailScreenState createState()=>_AdminApplicationDetailScreenState(studentInfo,applicationInfo);

}


class _AdminApplicationDetailScreenState extends State<AdminApplicationDetailScreen> {
  late Map studentInfo;
  late Map applicationInfo;

  _AdminApplicationDetailScreenState(this.studentInfo,this.applicationInfo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Başvuru Detayları",style: TextStyle(fontFamily: "Recursive",fontSize: 25),),
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
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue.shade300, Colors.lightBlueAccent.shade100],
            )),

        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),

        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.black38,blurRadius: 18,spreadRadius: 3)],
              ),
              

              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(),
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
                          Text("Öğrenci Bilgileri",style: TextStyle(fontFamily: "Righteous",fontSize: 23,color: Colors.green.shade600),),
                          SizedBox(height: 5,),
                          Text("Adı: ${studentInfo["studentName"]}",style: TextStyle(fontFamily: "Recursive",fontSize: 17,),),
                          SizedBox(height: 3,),
                          Text("Soyadı: ${studentInfo["studentSurname"]}",style: TextStyle(fontFamily: "Recursive",fontSize: 17),),
                          SizedBox(height: 3,),
                          Text("TC No: ${studentInfo["tcNumber"]}",style: TextStyle(fontFamily: "Recursive",fontSize: 17),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Okulu: ${studentInfo["schoolName"]}",style: TextStyle(fontFamily: "Recursive",fontSize: 18,),),
                      SizedBox(height: 6,),
                      Text("Fakültesi: ${studentInfo["faculty"]}",style: TextStyle(fontFamily: "Recursive",fontSize: 18,),),
                      SizedBox(height: 6,),
                      Text("Bölümü: ${studentInfo["department"]}",style: TextStyle(fontFamily: "Recursive",fontSize: 18,),),
                      SizedBox(height: 6,),
                      Text("Sınıfı: ${studentInfo["grade"]}",style: TextStyle(fontFamily: "Recursive",fontSize: 18,),),
                      SizedBox(height: 6,),
                      Text("Okul Numarası: ${studentInfo["schoolNumber"]}",style: TextStyle(fontFamily: "Recursive",fontSize: 18,),),
                    ],
                  ),
                ],
              ),
            ),


            SizedBox(height: 15,),

            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.black38,blurRadius: 18,spreadRadius: 3)],
              ),


              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text("Başvuru Hakkında Bilgiler",style: TextStyle(fontFamily: "Righteous",fontSize: 23,color: Colors.red.shade600),)),
                  SizedBox(height: 10,),
                  Center(child: Text("${applicationInfo["applied_school"]}",style: TextStyle(fontFamily: "Recursive",fontSize: 18,),)),
                  SizedBox(height: 10,),
                  Center(child: Text("${applicationInfo["applied_faculty"]}",style: TextStyle(fontFamily: "Recursive",fontSize: 18,),)),
                  SizedBox(height: 10,),
                  Center(child: Text("${applicationInfo["applied_department"]}",style: TextStyle(fontFamily: "Recursive",fontSize: 18,),)),
                  SizedBox(height: 10,),
                  basvuruBelgeleri(applicationInfo["application_type"]),
                  SizedBox(height: 10,),
                  Text("Başvuru Tipi: ${applicationInfo["application_type"]}",style: TextStyle(fontFamily: "Righteous",fontSize: 16,),),

                ],
              ),
            ),



          ],
        ),
      ),


    );
  }
  
  Row basvuruBelgeleri(String basvuruTuru){
    if(basvuruTuru=="Dgs"){
      return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: (){

            StorageHelper.downloadFilewithURL(applicationInfo["application_file0_url"],"dgsBasvuru.pdf");

          },
          child: Container(
            decoration:BoxDecoration(
                color: Colors.blueGrey.shade600,
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            height: 70,
            width: 70,
            child:Icon(Icons.picture_as_pdf_rounded,size: 50,color: Colors.white,) ,
          ),
        ),
        SizedBox(width: 20,),
        InkWell(
          onTap: (){

            StorageHelper.downloadFilewithURL(applicationInfo["application_file1_url"],"dgsBasvuru.docx");

          },
          child: Container(
            decoration:BoxDecoration(
                color: Colors.blueGrey.shade600,
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            height: 70,
            width: 70,
            child:Icon(Icons.insert_drive_file_rounded,size: 50,color: Colors.white,) ,
          ),
        ),
      ],
    );
    }

    if(basvuruTuru=="Çap"){
      return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: (){

            StorageHelper.downloadFilewithURL(applicationInfo["application_file0_url"],"capBasvuru0.pdf");

          },
          child: Container(
            decoration:BoxDecoration(
                color: Colors.blueGrey.shade600,
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            height: 70,
            width: 70,
            child:Icon(Icons.picture_as_pdf_rounded,size: 50,color: Colors.white,) ,
          ),
        ),
        SizedBox(width: 20,),
        InkWell(
          onTap: (){

            StorageHelper.downloadFilewithURL(applicationInfo["application_file1_url"],"capBasvuru1.pdf");

          },
          child: Container(
            decoration:BoxDecoration(
                color: Colors.blueGrey.shade600,
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            height: 70,
            width: 70,
            child:Icon(Icons.picture_as_pdf_rounded,size: 50,color: Colors.white,) ,
          ),
        ),
        SizedBox(width: 20,),
        InkWell(
          onTap: (){

            StorageHelper.downloadFilewithURL(applicationInfo["application_file2_url"],"capBasvuru.docx");

          },
          child: Container(
            decoration:BoxDecoration(
                color: Colors.blueGrey.shade600,
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            height: 70,
            width: 70,
            child:Icon(Icons.insert_drive_file_rounded,size: 50,color: Colors.white,) ,
          ),
        ),
      ],
    );
    }

    else{
      return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: (){

            StorageHelper.downloadFilewithURL(applicationInfo["application_file0_url"],"yataygecBasvuru0.pdf");

          },
          child: Container(
            decoration:BoxDecoration(
                color: Colors.blueGrey.shade600,
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            height: 70,
            width: 70,
            child:Icon(Icons.picture_as_pdf_rounded,size: 50,color: Colors.white,) ,
          ),
        ),
        SizedBox(width: 20,),
        InkWell(
          onTap: (){

            StorageHelper.downloadFilewithURL(applicationInfo["application_file1_url"],"yataygecBasvuru1.pdf");

          },
          child: Container(
            decoration:BoxDecoration(
                color: Colors.blueGrey.shade600,
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            height: 70,
            width: 70,
            child:Icon(Icons.picture_as_pdf_rounded,size: 50,color: Colors.white,) ,
          ),
        ),
        SizedBox(width: 20,),
        InkWell(
          onTap: (){

            StorageHelper.downloadFilewithURL(applicationInfo["application_file2_url"],"yataygecBasvuru0.docx");

          },
          child: Container(
            decoration:BoxDecoration(
                color: Colors.blueGrey.shade600,
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            height: 70,
            width: 70,
            child:Icon(Icons.insert_drive_file_rounded,size: 50,color: Colors.white,) ,
          ),
        ),
        SizedBox(width: 20,),
        InkWell(
          onTap: (){

            StorageHelper.downloadFilewithURL(applicationInfo["application_file3_url"],"yataygecBasvuru1.docx");

          },
          child: Container(
            decoration:BoxDecoration(
                color: Colors.blueGrey.shade600,
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            height: 70,
            width: 70,
            child:Icon(Icons.insert_drive_file_rounded,size: 50,color: Colors.white,) ,
          ),
        ),
      ],
    );
    }


  }

}