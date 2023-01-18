import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import "package:basvuru_uygulamasi_41/students_db_helper.dart";

class StudentSignupScreen extends StatefulWidget {
  @override
  _StudentSignupScreenState createState() => _StudentSignupScreenState();
}

class _StudentSignupScreenState extends State<StudentSignupScreen> {
  final blueColor = Color(0XFF5e92f3);
  final yellowColor = Color(0XFFfdd835);

  StudentHelper _studentHelper = StudentHelper();

  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _surnameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _schoolNumberController = new TextEditingController();
  final TextEditingController _tcNumberController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _telNoController = new TextEditingController();
  final TextEditingController _addressController = new TextEditingController();


  final _formKey = GlobalKey<FormState>();

  File? image;

  bool isNameCorrect = true;
  bool isSurnameCorrect = true;
  bool isTCNumberCorrect = true;
  bool isEmailCorrect = true;
  bool isPasswordCorrect = true;

  DateTime? _dateTime;
  String birthDay = "";
  var schoolName;
  var facultyName;
  var departmentName;
  var grade;


  Map schoolFaculty0 = {
    "Kocaeli Üniversitesi": {
      "Teknoloji Fakültesi": [
      "Bilişim Sistemleri Mühendisliği",
        "Biyomedikal Mühendisliği",
        "Enerji Sistemleri Mühendisliği",
        "Otomotiv Mühendisliği"
      ],
      "Mühendislik Fakültesi": ["Bilgisayar Mühendisliği", "Elektrik Mühendisliği","Mekatronik Mühendisliği","Yazılım Mühendisliği","Kimya Mühendisliği"],
      "Fen-Edebiyat Fakültesi": ["Biyoloji", "Arkeoloji", "Fizik","Kimya","Matematik"],
      "Güzel Sanatlar Fakültesi": ["Grafik Tasarımı", "Heykel", "Resim","Fotoğraf","Oyunculuk"],
      "Eğitim Fakültesi": ["Fen Bilgisi Öğretmenliği", "İngilizce Öğretmenliği", "Sınıf Öğretmenliği","Türkçe Öğretmenliği","Okul Öncesi Öğretmenliği"],
    },
  };

  Map facultyDepartmentTemp = {"": ""};
  List departmentTemp = [""];
  List gradeList = ["Hazırlık", "1", "2", "3", "4"];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildBackgroundTopCircle(),
          buildBackgroundBottomCircle(),


          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Kayıt Oluştur",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Righteous"),
                  ),
                  SizedBox(height: 14,),


                  buildImageProfile(),

                  Container(
                    height: MediaQuery.of(context).size.height-250,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 2,
                            spreadRadius: 1,
                            offset: Offset(0, 1),
                          ),
                        ]),
                    child: ListView(
                      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z-ığüşöçIİĞÜŞÖÇ]+|\s'))
                          ],
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.orangeAccent, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.green,
                            ),
                            labelText: "Öğrenci Adı",
                            hintText: "Muhammet Furkan",
                            //helperText: "Öğrenci Adı boş bırakılamaz",
                          ),
                        ), //Ad
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _surnameController,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z-ığüşöçIİĞÜŞÖÇ]+|\s'))
                          ],
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.orangeAccent, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.green,
                            ),
                            labelText: "Öğrenci Soyadı",
                            hintText: "Çelik",
                            //helperText: "Öğrenci Soyadı boş bırakılamaz",
                          ),
                        ), //Soyad
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _tcNumberController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(11)
                          ],
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.orangeAccent, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.account_box_rounded,
                              color: Colors.green,
                            ),
                            labelText: "TC Kimlik Numarası",
                            hintText: "01234567890",
                            //helperText: "Öğrenci Soyadı boş bırakılamaz",
                          ),
                        ), //TC Numarası
                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.orangeAccent, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Colors.green,
                            ),
                            labelText: "E-Mail",
                            hintText: "furkan_1907@gmail.com",
                            //helperText: "Öğrenci Soyadı boş bırakılamaz",
                          ),
                        ), //E mail
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _telNoController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(11)
                          ],
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.orangeAccent, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.phone_android_outlined,
                              color: Colors.green,
                            ),
                            labelText: "Telefon Numarası",
                            hintText: "0532 015 52 20",
                            //helperText: "Öğrenci Soyadı boş bırakılamaz",
                          ),
                        ), //Tel No
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          maxLines: 3,
                          controller: _addressController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.orangeAccent, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: Colors.green,
                            ),
                            labelText: "Adres",
                            //hintText: "",
                            //helperText: "Öğrenci Soyadı boş bırakılamaz",
                          ),
                        ), //Adres
                        SizedBox(height: 20,),
                        datePicker(), //Doğum Günü
                        SizedBox(height: 20,),



                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.blue, width: 2)),
                          child: Column(
                            children: [
                              Text(
                                "Üniversite Seçiniz",
                                style: TextStyle(
                                    fontFamily: "Righteous",
                                    fontSize: 15
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
                                    color: Colors.black,
                                  ),
                                  value: schoolName,
                                  items: schoolFaculty0.keys.map((items) {
                                    return DropdownMenuItem(

                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ), //Üniversite
                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.blue, width: 2)),
                          child: Column(
                            children: [
                              Text(
                                "Fakülte Seçiniz",
                                style: TextStyle(
                                    fontFamily: "Righteous",
                                    fontSize: 15
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
                                    color: Colors.black,
                                  ),
                                  value: facultyName,
                                  items: facultyDepartmentTemp.keys.map((items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items.toString()),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ), //Fakülte

                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.blue, width: 2)),
                          child: Column(
                            children: [
                              Text(
                                "Bölüm Seçiniz",
                                style: TextStyle(
                                    fontFamily: "Righteous",
                                    fontSize: 15
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
                                    color: Colors.black,
                                  ),
                                  value: departmentName,
                                  items: departmentTemp.map((items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items.toString()),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ), //Bölüm

                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.blue, width: 2)),
                          child: Column(
                            children: [ Text(
                              "Sınıf Seçiniz",
                              style: TextStyle(
                                  fontFamily: "Righteous",
                                  fontSize: 15
                              ),
                            ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  dropdownColor: Colors.lightBlue,
                                  onChanged: (value) {
                                    grade = value;
                                    setState(() {});
                                  },
                                  iconSize: 25,
                                  icon: Icon(
                                    Icons.arrow_drop_down_circle_outlined,
                                    color: Colors.black,),
                                  value: grade,
                                  items: gradeList.map((items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items.toString()),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ), //Sınıf

                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          controller: _schoolNumberController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(11)
                          ],
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.orangeAccent, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.perm_identity_rounded,
                              color: Colors.green,
                            ),
                            labelText: "Okul Numarası",
                            hintText: "12345678911",
                            //helperText: "Öğrenci Soyadı boş bırakılamaz",
                          ),
                        ), //Okul Numarası
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.orangeAccent, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.password_outlined,
                              color: Colors.green,
                            ),
                            labelText: "Şifre",
                            //hintText: "",
                            //helperText: "Öğrenci Soyadı boş bırakılamaz",
                          ),
                        ),
                        //SizedBox(height: 20,),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.yellow.shade600),
                            onPressed: () {



                              _studentHelper.addStudent(image!,_nameController.text,_surnameController.text,
                                int.parse(_tcNumberController.text),_emailController.text,
                                int.parse(_telNoController.text),_addressController.text,birthDay,schoolName.toString(),
                                facultyName.toString(),departmentName.toString(),grade,int.parse(_schoolNumberController.text),
                                _passwordController.text,).then((value) {
                                  final snackBar=SnackBar(content: Text("Öğrenci Kaydı Oluşturuldu",textAlign: TextAlign.center,),);
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);});




                            },
                            child: Container(
                              padding:
                              EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Kayıt Oluştur",
                                    style: TextStyle(
                                      fontFamily: "Righteous",
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(Icons.arrow_right, color: Colors.black),
                                ],
                              ),
                            ),
                          ),
                        ), //Şifre
                      ],
                    ),
                  ),
                 //Kayıt Oluştur Butonu
                ],
              ),
            ),
          ),
          Container(margin:EdgeInsets.only(top: 28,left: 14),child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_rounded,color: Colors.white,size: 30,))),

        ],
      ),
      
    );
  }

  Positioned buildBackgroundTopCircle() {
    return Positioned(
      top: 0,
      child: Transform.translate(
        offset: Offset(0.0, -MediaQuery.of(context).size.width / 1.3),
        child: Transform.scale(
          scale: 1.35,
          child: Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius:
                  BorderRadius.circular((MediaQuery.of(context).size.width)),
            ),
          ),
        ),
      ),
    );
  }

  Positioned buildBackgroundBottomCircle() {
    return Positioned(
      top: MediaQuery.of(context).size.height -
          MediaQuery.of(context).size.width,
      right: MediaQuery.of(context).size.width / 2,
      child: Container(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: blueColor.withOpacity(0.15),
          borderRadius:
              BorderRadius.circular((MediaQuery.of(context).size.width)),
        ),
      ),
    );
  }

  Container buildImageProfile() {
    return Container(
        margin: EdgeInsets.only(top: 8),
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
        child: Center(
          child: Stack(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: image != null
                    ? Image.file(image!).image
                    : AssetImage("lib/images/rdj.webp"),
              ),
              Positioned(
                bottom: 15,
                right: 15,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: ((builder) => bottomSheet()),
                    );
                  },
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            "Bir Profil Fotoğrafı Seçiniz",
            style: TextStyle(fontFamily: "Righteous", fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: Icon(Icons.camera),
                label: Text(
                  "Kamera",
                  style: TextStyle(fontFamily: "Rigtheous"),
                ),
              ),
              SizedBox(
                width: 25,
              ),
              TextButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: Icon(Icons.image),
                label: Text(
                  "Galeri",
                  style: TextStyle(fontFamily: "Rigtheous"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future takePhoto(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = File(imageTemporary.path));
    } on PlatformException catch (e) {
      print("Fotoğraf seçme işlemi sırasında bir problem oluştu");
    }
  }

  Widget datePicker() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1963),
                  lastDate: DateTime.now(),
                ).then((date) {
                  setState(() {
                    _dateTime = date;
                    birthDay = date.toString().substring(0, 10);
                  });
                });
              },
              child: Text("Doğum Tarihinizi Seçiniz")),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.cake_rounded,
                size: 25,
                color: Colors.green,
              ),
              SizedBox(
                width: 10,
              ),
              Text(_dateTime == null ? "Tarih Seçilmedi" : birthDay),
            ],
          ),
        ],
      ),
    );
  }
}
