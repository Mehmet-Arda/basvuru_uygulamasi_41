import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:basvuru_uygulamasi_41/students.dart';
import 'package:basvuru_uygulamasi_41/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*
String? id;
String? ogrAdi;
String? ogrSoyadi;
int? tcNumber;
String? email;
int? telNo;
String? address;
String? birthDay;
String? university;
String? faculty;
String? department;
int? grade;
int? schoolNumber;
String? password;
String? ogrPhoto;
*/

class StudentHelper{


  final FirebaseFirestore _firestore= FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  StorageHelper _storageHelper = StorageHelper();
  String mediaUrl="";

  String documentId="";

  StudentHelper.withDocumentId(this.documentId);

  StudentHelper();


  Future<String> signIn(String e_mail,String password)async{
    var user = await _firebaseAuth.signInWithEmailAndPassword(email: e_mail, password: password);
    return user.user!.uid.toString();
  }

  signOut()async{
    return await _firebaseAuth.signOut();
  }
  
  Future<User?>addStudent(File imageFile,String ogrAdi, String ogrSoyadi, int tcNumber,
      String email,int telNo,String address,String birthDay,
      String university,String faculty,String department,
      String grade,int schoolNumber,String password) async{


    String extens=imageFile.path.split(".").last;

    final fileName="${schoolNumber}_${ogrAdi}_${ogrSoyadi}_${DateTime.now()}.${extens}";
    final destination = "students_images/$fileName";



    StorageHelper _storageHelper=StorageHelper();

    final mediaUrl=await _storageHelper.uploadFile(destination, imageFile);



    
    var ref = await _firestore.collection("students");

    var user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);


    var documentRef = await ref.doc(user.user?.uid).set({
      "studentId": user.user?.uid,
      "studentName":ogrAdi,
      "studentSurname":ogrSoyadi,
      "studentImage":mediaUrl,
      "tcNumber":tcNumber,
      "e-mail":email,
      "telNo": telNo,
      "address":address,
      "birthDay":birthDay,
      "schoolName":university,
      "faculty":faculty,
      "department":department,
      "grade":grade,
      "schoolNumber":schoolNumber,

      });
    return user.user;

    //return Student.withInfo(id:documentRef.id,ogrPhoto: ogrPhoto,ogrAdi: ogrAdi,ogrSoyadi: ogrSoyadi,tcNumber:,);

  }




 Future addDgsApplication(List <String> destination,List<File> file,String applicationType,Map studentInfo,String schoolName,String facultyName,String departmentName)async{

    StorageHelper _storageHelper=StorageHelper();

    final urlDownload0=await _storageHelper.uploadFile(destination[0], file[0]);

    final urlDownload1=await _storageHelper.uploadFile(destination[1], file[1]);

    var applicationDate="${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}";


    var ref = await _firestore.collection("applications");
    print(ref.id);
    String id=ref.doc().id;
    print(id);

    ref.doc(id).set({

      "application_id":id,
      "approval_status":"Beklemede",
      "application_type":applicationType,
      "student_id":studentInfo["studentId"],
      "student_name":studentInfo["studentName"],
      "student_surname":studentInfo["studentSurname"],
      "student_image_url":studentInfo["studentImage"],
      "application_file0_url":urlDownload0,
      "application_file1_url":urlDownload1,
      "applied_school":schoolName,
      "applied_faculty":facultyName,
      "applied_department":departmentName,
      "application_date":applicationDate,

    }).then((value) {
     /* final snackBar=SnackBar(content: Text("Başvuru Oluşturuldu"),);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    */
    });








  }







  Future addCapApplication(List <String> destination,List<File> file,String applicationType,Map studentInfo,String schoolName,String facultyName,String departmentName)async{

    StorageHelper _storageHelper=StorageHelper();

    final urlDownload0=await _storageHelper.uploadFile(destination[0], file[0]);

    final urlDownload1=await _storageHelper.uploadFile(destination[1], file[1]);

    final urlDownload2=await _storageHelper.uploadFile(destination[2], file[2]);

    var applicationDate="${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}";


    var ref = await _firestore.collection("applications");
    print(ref.id);
    String id=ref.doc().id;
    print(id);

    ref.doc(id).set({

      "application_id":id,
      "approval_status":"Beklemede",
      "application_type":applicationType,
      "student_id":studentInfo["studentId"],
      "student_name":studentInfo["studentName"],
      "student_surname":studentInfo["studentSurname"],
      "student_image_url":studentInfo["studentImage"],
      "application_file0_url":urlDownload0,
      "application_file1_url":urlDownload1,
      "application_file2_url":urlDownload2,
      "applied_school":schoolName,
      "applied_faculty":facultyName,
      "applied_department":departmentName,
      "application_date":applicationDate,

    }).then((value) {
      /* final snackBar=SnackBar(content: Text("Başvuru Oluşturuldu"),);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    */
    });








  }




  Future addYatayGecisApplication(List <String> destination,List<File> file,String applicationType,Map studentInfo,String schoolName,String facultyName,String departmentName)async{

    StorageHelper _storageHelper=StorageHelper();

    final urlDownload0=await _storageHelper.uploadFile(destination[0], file[0]);

    final urlDownload1=await _storageHelper.uploadFile(destination[1], file[1]);

    final urlDownload2=await _storageHelper.uploadFile(destination[2], file[2]);

    final urlDownload3=await _storageHelper.uploadFile(destination[3], file[3]);

    var applicationDate="${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}";


    var ref = await _firestore.collection("applications");
    print(ref.id);
    String id=ref.doc().id;
    print(id);

    ref.doc(id).set({

      "application_id":id,
      "approval_status":"Beklemede",
      "application_type":applicationType,
      "student_id":studentInfo["studentId"],
      "student_name":studentInfo["studentName"],
      "student_surname":studentInfo["studentSurname"],
      "student_image_url":studentInfo["studentImage"],
      "application_file0_url":urlDownload0,
      "application_file1_url":urlDownload1,
      "application_file2_url":urlDownload2,
      "application_file3_url":urlDownload3,
      "applied_school":schoolName,
      "applied_faculty":facultyName,
      "applied_department":departmentName,
      "application_date":applicationDate,

    }).then((value) {
      /* final snackBar=SnackBar(content: Text("Başvuru Oluşturuldu"),);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    */
    });








  }


  static Future  getStudent(String studentDocId)async{

    var students = await FirebaseFirestore.instance.collection("students");

    return await students.doc(studentDocId).get().then((value) {return value.data();});

  }

  static Future  getAdmin(String adminDocId)async{

    var administrator = await FirebaseFirestore.instance.collection("administrators");

    return await administrator.doc(adminDocId).get().then((value) {return value.data();});

  }

  static Future <List>ApplicationCounter()async{


    List sayac=[0,0,0];
    int onaylanan=0;
    await FirebaseFirestore.instance
        .collection('applications')
        .where('approval_status',isEqualTo: "Beklemede" )
        .get().then((value) {sayac[1]=value.docs.length;});

    await FirebaseFirestore.instance
        .collection('applications')
        .where('approval_status',isEqualTo: "Onaylandı" )
        .get().then((value) {sayac[0]=value.docs.length;});


    await FirebaseFirestore.instance
        .collection('applications')
        .where('approval_status',isEqualTo: "Reddedildi" )
        .get().then((value) {sayac[2]=value.docs.length;});

    return sayac.toList();

  }


  static Future <List>StudentApplicationCounter(String studentId)async{


    List sayac=[0,0,0];

    await FirebaseFirestore.instance
        .collection('applications').get().then((value) {
          int size=value.docs.length;

          for(int i=0; i< size ;i++){
            if(value.docs[i].data()["student_id"]==studentId && value.docs[i].data()["approval_status"]=="Beklemede"){
              sayac[1]=sayac[1]+1;
            }

          }
    });

    await FirebaseFirestore.instance
        .collection('applications').get().then((value) {
      int size=value.docs.length;

      for(int i=0; i< size ;i++){
        if(value.docs[i].data()["student_id"]==studentId && value.docs[i].data()["approval_status"]=="Onaylandı"){
          sayac[0]=sayac[0]+1;
        }

      }
    });
    await FirebaseFirestore.instance
        .collection('applications').get().then((value) {
      int size=value.docs.length;

      for(int i=0; i< size ;i++){
        if(value.docs[i].data()["student_id"]==studentId && value.docs[i].data()["approval_status"]=="Reddedildi"){
          sayac[2]=sayac[2]+1;
        }

      }
    });




    return sayac.toList();

  }






}