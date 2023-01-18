import 'package:basvuru_uygulamasi_41/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class AdminExitScreen extends StatefulWidget{
  @override
  _AdminExitScreenState createState()=>_AdminExitScreenState();

}


class _AdminExitScreenState extends State<AdminExitScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Text("Çıkış",style: TextStyle(fontFamily: "Recursive",fontSize: 25),),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient:  LinearGradient(
                colors: [Colors.blueGrey.shade700,Colors.blueGrey.shade500],
                begin: Alignment.bottomLeft,
                end:Alignment.topRight,
              )
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient:  LinearGradient(
                  colors: [Colors.blueGrey.shade700,Colors.blueGrey.shade300],
                  begin: Alignment.bottomLeft,
                  end:Alignment.topRight,
                )
            ),
            padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
            child: Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.exit_to_app_rounded,size: 250,color: Colors.white,),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>WelcomeScreen() ));
                  },
                      style: ElevatedButton.styleFrom(primary: Colors.orange.shade400,fixedSize: const Size(300,70)),
                      child:Container(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        child:
                        Text("Oturumu Kapat",style: TextStyle(fontFamily: "Recursive",fontSize: 25),),

                      )),

                  SizedBox(height: 20,),
                  ElevatedButton(onPressed:(){
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  },
                      style: ElevatedButton.styleFrom(primary: Colors.red.shade400,fixedSize: const Size(300,70)),
                      child:Container(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        child:
                        Text("Uygulamayı Kapat",style: TextStyle(fontFamily: "Recursive",fontSize: 25),),

                      )),

                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}