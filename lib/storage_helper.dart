import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:open_file/open_file.dart';


class StorageHelper{

  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  String? url;

  Future<String> uploadMedia(File file,String path) async{
    
    var uploadTask = _firebaseStorage.ref(path).child(
      "${file.path}.${file.path.split(".").last}"
    ).putFile(file);


    uploadTask.snapshotEvents.listen((event) { });
    
    var storageRef = await uploadTask.whenComplete(() => null);
    return url = await (await uploadTask).ref.getDownloadURL();

  }


  Future<String> uploadFile(String destination,File file)async{

    final ref =FirebaseStorage.instance.ref(destination);

    var uploadTask= ref.putFile(file);


    uploadTask.snapshotEvents.listen((event) { });

    var storageRef=await uploadTask.whenComplete(() => null);
    return url =await(await uploadTask).ref.getDownloadURL();

  }


  static Future<void> downloadFile(String destination,String fileName) async {

    Directory? appDocDir = await getExternalStorageDirectory();

    File downloadToFile = File('${appDocDir?.path}/$fileName');


    await FirebaseStorage.instance
        .ref(destination)
        .writeToFile(downloadToFile);

  }


  static Future<void> downloadFilewithURL(String url,String fileName) async {
    Directory? appDocDir = await getExternalStorageDirectory();

    File downloadToFile = File('${appDocDir?.path}/$fileName');


    await FirebaseStorage.instance
        .refFromURL(url)
        .writeToFile(downloadToFile);

    OpenFile.open(downloadToFile.path);



  }






}