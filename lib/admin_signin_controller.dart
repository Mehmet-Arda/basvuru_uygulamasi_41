
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class SigninController {

  FirebaseFirestore _firestore =FirebaseFirestore.instance;
  bool isFound=false;
  int boyut=0;
  var administrator;

  Future <Map>control_find(String e_mail,String password)async {


    var _collectionRef=await _firestore.collection("administrators");

    await _collectionRef.get().then((value) => boyut=value.docs.length);
    isFound=false;

    for(int i=0; i< boyut ;i++)
    {
      print(i);

      await _collectionRef.get().then((admin){

        if(admin.docs[i].data()["e_mail"]==e_mail &&  admin.docs[i].data()["password"]==password)
        {
          print("if içine girdi, bulundu");
          isFound=true;

          administrator=admin.docs[i].data();


        }
        else{isFound=false; print("bulunamadı"); }

      });
      if(isFound){ print("arama bitti.");break;}


    }

    if(isFound){return administrator;}else{return administrator={"boş":"boş"};}









  }
  }