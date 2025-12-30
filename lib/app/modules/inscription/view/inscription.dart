import 'package:commerce/app/components/button_components.dart';
import 'package:commerce/app/components/form_components.dart';
import 'package:commerce/app/components/space.dart';
import 'package:commerce/app/components/text_components.dart';
import 'package:commerce/utils/colors.dart';
import 'package:flutter/material.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20,right: 20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: TextComponents(txt: "Sign Up Now",txtsize: 25,fw: FontWeight.bold,family: "Bold",)),
              h(40),
              TextComponents(txt: "Email",txtsize: 15),
              h(10),
              FormComponents(
              ),
              h(20),
              TextComponents(txt: "Phone Number",txtsize: 15),
              h(20),
              FormComponents(
                hide: false,
                textInputType: TextInputType.phone,
              ),
              TextComponents(txt: "Password",txtsize: 15),
              h(10),
              FormComponents(
                hide: true,
                textInputType: TextInputType.visiblePassword,
              ),
              h(20),
              ButtonComponents(txtButton: "Sign Up", buttonColor: mainColor),
              h(80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Expanded(
                  child: Container(
                    height: 1,
                    width: 120,
                    color: Colors.black38,),
                ),
                  w(20,),
                TextComponents(txt: "Or continue with",txtsize: 15,color: Colors.black38,),
                w(20,),
                Expanded(
                  child: Container(
                    height: 1,
                    width: 120,
                    color: Colors.black38,),
                ),
              ]),
              h(20),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: mainColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:Center(child: Image.asset("assets/images/facebook.jpg",height: 30,width: 30,),),
                ),
                ),
                w(20),
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: mainColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:Center(child: Image.asset("assets/images/google.jpg",height: 30,width: 30,),),
                ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}