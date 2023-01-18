import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../storage_helper.dart';
import '../students_db_helper.dart';



class YatayGecisApplicationScreen extends StatefulWidget{

  late Map studentInfo;

  YatayGecisApplicationScreen(this.studentInfo);

  @override
  _YatayGecisApplicationScreenState createState()=>_YatayGecisApplicationScreenState(studentInfo);


}

class _YatayGecisApplicationScreenState extends State<YatayGecisApplicationScreen> {
  late Map studentInfo;

  _YatayGecisApplicationScreenState(this.studentInfo);


  String fileNameforText="Dosyalar seçilmedi.";

  Map schoolFaculty0 = {
    "Kocaeli Üniversitesi": {"Teknoloji Fakültesi": ["Bilişim Sistemleri Mühendisliği", "Biyomedikal Mühendisliği", "Enerji Sistemleri Mühendisliği", "Otomotiv Mühendisliği"],
      "Mühendislik Fakültesi": ["Bilgisayar Mühendisliği", "Elektrik Mühendisliği","Mekatronik Mühendisliği","Yazılım Mühendisliği","Kimya Mühendisliği"],
      "Fen-Edebiyat Fakültesi": ["Biyoloji", "Arkeoloji", "Fizik","Kimya","Matematik"],
      "Güzel Sanatlar Fakültesi": ["Grafik Tasarımı", "Heykel", "Resim","Fotoğraf","Oyunculuk"],
      "Eğitim Fakültesi": ["Fen Bilgisi Öğretmenliği", "İngilizce Öğretmenliği", "Sınıf Öğretmenliği","Türkçe Öğretmenliği","Okul Öncesi Öğretmenliği"],
    },
  };

  Map facultyDepartmentTemp = {"": ""};
  List departmentTemp = [""];

  var schoolName;
  var facultyName;
  var departmentName;

  bool isFileSelected=false;
  late List <File> file;

  UploadTask? task;





  List <String> downloadDestination=[
    "applications_files/default_files/default_yatay_gecis_files/default_yatay_gecis_pdfs/Yatay_Gecis_Formu.pdf",
    "applications_files/default_files/default_yatay_gecis_files/default_yatay_gecis_pdfs/Genel_amacli_Dilekce_Ornegi.pdf",
    "applications_files/default_files/default_yatay_gecis_files/default_yatay_gecis_docs/YatayGecis_formu1.docx",
    "applications_files/default_files/default_yatay_gecis_files/default_yatay_gecis_docs/YatayGecis_formu2.docx",
  ];


  @override
  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: Text(
          "YatGeç Başvurusu Oluştur",
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

        decoration: BoxDecoration(
          gradient:  LinearGradient(colors: [Colors.blueGrey.shade700,Colors.blueGrey.shade300],
            begin: Alignment.bottomLeft,
            end:Alignment.topRight,
          ),
        ),
        child: Center(
          child: ListView(
              children:[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(40,20, 40,0),
                      padding:
                      EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      decoration: BoxDecoration(
                          color: Colors.green.shade600,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.blue.shade800, width: 2)),
                      child: Column(
                        children: [
                          Text(
                            "Üniversite Seçiniz",
                            style: TextStyle(
                                fontFamily: "Righteous",
                                fontSize: 15,
                                color: Colors.white
                            ),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                              dropdownColor: Colors.lightBlue,

                              onChanged: (value) {
                                schoolName = value;

                                facultyDepartmentTemp =
                                schoolFaculty0[schoolName];

                                facultyName = null;

                                setState(() {});
                              },
                              iconSize: 25,
                              icon: Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                color: Colors.white,
                              ),
                              value: schoolName,
                              items: schoolFaculty0.keys.map((items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items,style: TextStyle(color: Colors.white),),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ), //Üniversite
                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                      padding:
                      EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      decoration: BoxDecoration(
                          color: Colors.green.shade600,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.blue.shade800, width: 2)),
                      child: Column(
                        children: [
                          Text(
                            "Fakülte Seçiniz",
                            style: TextStyle(
                                fontFamily: "Righteous",
                                fontSize: 15,
                                color: Colors.white
                            ),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                              dropdownColor: Colors.lightBlue,
                              onChanged: (value) {
                                facultyName = value;

                                departmentName = null;

                                departmentTemp =
                                facultyDepartmentTemp[facultyName];

                                setState(() {});
                              },
                              iconSize: 25,
                              icon: Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                color: Colors.white,
                              ),
                              value: facultyName,
                              items: facultyDepartmentTemp.keys.map((items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items.toString(),style: TextStyle(color: Colors.white),),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ), //Fakülte

                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                      padding:
                      EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      decoration: BoxDecoration(
                          color: Colors.green.shade600,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.blue.shade800, width: 2)),
                      child: Column(
                        children: [
                          Text(
                            "Bölüm Seçiniz",
                            style: TextStyle(
                                fontFamily: "Righteous",
                                fontSize: 15,
                                color: Colors.white
                            ),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                              dropdownColor: Colors.lightBlue,
                              onChanged: (value) {
                                departmentName = value;

                                setState(() {});
                              },
                              iconSize: 25,
                              icon: Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                color: Colors.white,
                              ),
                              value: departmentName,
                              items: departmentTemp.map((items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items.toString(),style: TextStyle(color: Colors.white),),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ), //Bölüm

                    SizedBox(
                      height: 30,
                    ),



                    ElevatedButton(onPressed:() {
                      StorageHelper.downloadFile(downloadDestination[0],"YatayGecisPdf1.pdf");
                      StorageHelper.downloadFile(downloadDestination[1],"YatayGecisPdf2.pdf");
                      StorageHelper.downloadFile(downloadDestination[2],"YatayGecisDoc1.docx");
                      StorageHelper.downloadFile(downloadDestination[3],"YatayGecisDoc2.docx").then((value) {
                        final snackBar=SnackBar(content: Text("Dosyalar İndirildi",textAlign: TextAlign.center,),);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);});},
                        style:ElevatedButton.styleFrom(
                          elevation: 4,
                          primary: Colors.green.shade600,
                          fixedSize: const Size(300, 60),

                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.file_download),
                            SizedBox(width: 10,),
                            Text("İlgili Dokümanları İndir",style: TextStyle(fontFamily: "Recursive",fontSize: 15),),
                          ],
                        )),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed:() {selectFile().then((value) {}); },
                        style:ElevatedButton.styleFrom(
                          elevation: 4,
                          primary: Colors.green.shade600,
                          fixedSize: const Size(300, 60),

                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.attach_file_rounded),
                            SizedBox(width: 10,),
                            Text("Yüklenecek Dosyayı Seçin",style: TextStyle(fontFamily: "Recursive",fontSize: 15),),
                          ],
                        )),
                    SizedBox(height: 10,),
                    Text(fileNameforText,style: TextStyle(color: Colors.white),),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed:() {


                      if(isFileSelected==false){return;}
                      else{
                        addApplication().then((value) {final snackBar=SnackBar(content: Text("Başvuru Oluşturuldu",textAlign: TextAlign.center,),);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);});
                      }

                    },
                        style:ElevatedButton.styleFrom(
                          elevation: 4,
                          primary: Colors.green.shade600,
                          fixedSize: const Size(300, 60),

                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.cloud_upload_rounded),
                            SizedBox(width: 10,),
                            Text("Yeni Başvuruyu Oluştur",style: TextStyle(fontFamily: "Recursive",fontSize: 15),),
                          ],
                        )),


                  ],
                ),
              ]),
        ),
      ),

    );



  }

  Future selectFile()async{

    var result =await FilePicker.platform.pickFiles(allowMultiple: true);

    if(result==null){return;}

    if(result.files.length!=4){
      setState(() {isFileSelected=false;fileNameforText="Gerekli dosyaları seçiniz.";});
    }
    else{setState(() {isFileSelected=true;
    fileNameforText="1.dosya: ${result.files[0].path!.split("/").last}"
        "\n2.dosya: ${result.files[1].path!.split("/").last}"
        "\n3.dosya: ${result.files[2].path!.split("/").last}"
        "\n4.dosya: ${result.files[3].path!.split("/").last}"
    ;});}



    String temp0=result.files[0].path!;
    String temp1=result.files[1].path!;

    int doc1index=0;
    int doc2index=0;

    List extensions=[result.files[0].path!.split(".").last,result.files[1].path!.split(".").last,
      result.files[2].path!.split(".").last,result.files[3].path!.split(".").last];

    doc1index= extensions.indexOf("docx");
    doc2index=extensions.indexOf("docx",doc1index+1);

    for(int i=0 ;i<=3;i++){

      if(result.files[i].path!.split(".").last=="docx"){doc1index=i;}

    }


    setState(() {

        file=[
          File(result.files[3].path!),
          File(result.files[2].path!),
          File(result.files[1].path!),
          File(result.files[0].path!),
        ];



    });


  }

  Future addApplication()async{


    String extens0=file[0].path.split("/").last.toString();
    extens0=extens0.split(".").last;

    String extens1=file[1].path.split("/").last.toString();
    extens1=extens1.split(".").last;

    String extens2=file[2].path.split("/").last.toString();
    extens2=extens2.split(".").last;

    String extens3=file[3].path.split("/").last.toString();
    extens3=extens3.split(".").last;


    DateTime now = DateTime.now();
    print(now);

    final fileName0="${studentInfo["schoolNumber"]}_${studentInfo["studentName"]}_${studentInfo["studentSurname"]}_$now.${extens0}";
    final destination0 = "applications_files/yatay_gecis_applications_files/yatay_gecis_applications_pdfs/pdf0/$fileName0";

    final fileName1="${studentInfo["schoolNumber"]}_${studentInfo["studentName"]}_${studentInfo["studentSurname"]}_$now.${extens1}";
    final destination1 = "applications_files/yatay_gecis_applications_files/yatay_gecis_applications_pdfs/pdf1/$fileName1";

    final fileName2="${studentInfo["schoolNumber"]}_${studentInfo["studentName"]}_${studentInfo["studentSurname"]}_$now.${extens2}";
    final destination2 = "applications_files/yatay_gecis_applications_files/yatay_gecis_applications_docs/docx0/$fileName2";

    final fileName3="${studentInfo["schoolNumber"]}_${studentInfo["studentName"]}_${studentInfo["studentSurname"]}_$now.${extens3}";
    final destination3 = "applications_files/yatay_gecis_applications_files/yatay_gecis_applications_docs/docx1/$fileName3";

    List <String> uploadDestination=[destination0,destination1,destination2,destination3];

    StudentHelper _studentHelper=StudentHelper();

    _studentHelper.addYatayGecisApplication(uploadDestination,file,"Yatay Geçiş",studentInfo,schoolName,facultyName,departmentName);





  }
}