import 'package:flutter/material.dart';
import  'package:firebase_auth/firebase_auth.dart';

class ResetPasswordScreen extends StatefulWidget{
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
  
}
class _ResetPasswordScreenState extends State<ResetPasswordScreen>{

  TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {


    return Scaffold(


      body: Stack(

        children: [
          buildBackgroundBottomCircle(context),
          buildBackgroundTopCircle(context),

          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

              padding:
              EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 0),
              child: Container(

                padding: EdgeInsets.only(left: 10,right: 10,top: 50,bottom: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Şifre Sıfırlama",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.normal,
                          fontFamily: "Righteous"
                      ),
                    ),

                    buildAvatarContainer(),

                    Container(
                      height: 250,
                      //width: 400,
                      padding: EdgeInsets.symmetric(horizontal:20, vertical: 15),
                      margin: EdgeInsets.only(top: 40),
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
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30,),

                          TextFormField(
                            textAlign: TextAlign.start,
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
                              hintText: "furkan_41@gmail.com",
                              //helperText: "Öğrenci Soyadı boş bırakılamaz",
                            ),
                          ),
                          SizedBox(height: 60,),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.yellow),
                            onPressed: () {

                              FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text).then((value) {
                                final snackBar=SnackBar(content: Text("Mail gönderildi",textAlign: TextAlign.center,),);
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);});


                            },
                            child: Container(
                              padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 12),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Mail Gönder",
                                    style: TextStyle(
                                      fontFamily: "Righteous",
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(Icons.send_rounded, color: Colors.black,size: 20,),
                                ],
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),






                  ],
                ),
              ),
            ),
          ),
          Container(margin:EdgeInsets.only(top: 40,left: 14),child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_rounded,color: Colors.white,size: 30,))),

        ],
      ),

    );





  }
  Positioned buildBackgroundTopCircle(BuildContext context)
  {
    return Positioned(
      top: 0,
      child: Transform.translate(
        offset: Offset(0.0,-MediaQuery.of(context).size.width/1.3),
        child: Transform.scale(
          scale: 1.35,
          child: Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color:Colors.grey[800],
              borderRadius: BorderRadius.circular((
                  MediaQuery.of(context).size.width

              )),
            ),
          ),
        ),
      ),
    );
  }
  Positioned buildBackgroundBottomCircle(BuildContext context)
  {
    return  Positioned(
      top:MediaQuery.of(context).size.height-MediaQuery.of(context).size.width,
      right: MediaQuery.of(context).size.width/2,
      child:Container(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color:Colors.blue.withOpacity(0.15),
          borderRadius: BorderRadius.circular((
              MediaQuery.of(context).size.width

          )),
        ),
      ),
    );
  }
  Container buildAvatarContainer()
  {
    return Container(
      margin: EdgeInsets.only(top:24),
      width:130,
      height: 130,
      decoration: BoxDecoration(
          color: Color(0XFFfdd835),
          borderRadius: BorderRadius.circular(65),
          boxShadow: [BoxShadow(
              color:Colors.black.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 20
          ),]
      ),
      child: Center(
        child: Stack(
          children: [
            Positioned(
              left:1.0,
              top:3.0,
              child: Icon(Icons.mark_email_read_rounded,size: 60,color:Colors.black.withOpacity(0.1),),
            ),
            Icon(Icons.mark_email_read_rounded,size: 60,color: Colors.white,),
          ],
        ),
      ),
    );
  }


}

