import 'package:commerce/app/components/button_components.dart';
import 'package:commerce/app/components/space.dart';
import 'package:commerce/app/components/text_components.dart';
import 'package:commerce/app/modules/connexion/view/login.dart';
import 'package:commerce/app/modules/inscription/view/inscription.dart';
import 'package:commerce/utils/colors.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        backgroundColor: homebg,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20,right: 20),
        color: homebg,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            TextComponents(txt: "Welcome",txtsize: 30,fw: FontWeight.bold,family: "Bold",),
            h(40),
            TextComponents(txt: "MainMode Shopping House ",txtsize: 18,),
            h(40),
            Image.asset("assets/images/Mightygram.jpg",
            height: 200,),
            h(40),
            InkWell(
              onTap: (){
                Navigator.push( context, MaterialPageRoute(builder: (context) => const Inscription()));
              },
               child: ButtonComponents(txtButton: "Sign Un", buttonColor:mainColor,)),
            h(20),
            InkWell
            (
              onTap: (){
                Navigator.push( context, MaterialPageRoute(builder: (context) => const Login()));
              },
              child: ButtonComponents(txtButton: "Login", buttonColor: loginBottomColor,)),
            h(20),
            TextComponents(txt: "No thanks"),
          ],
        )
      ),
    );
  }
}