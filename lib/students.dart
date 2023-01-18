import 'package:cloud_firestore/cloud_firestore.dart';

class Student{

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

  Student.withInfo({this.id,this.ogrPhoto,this.ogrAdi,this.ogrSoyadi,this.tcNumber,
    this.email,this.telNo,this.address,this.birthDay,
    this.university,this.faculty,this.department,
    this.grade,this.schoolNumber,this.password});

  Student({this.id,this.ogrAdi,this.ogrSoyadi,this.ogrPhoto});





}