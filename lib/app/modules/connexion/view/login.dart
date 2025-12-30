import 'package:commerce/app/components/button_components.dart';
import 'package:commerce/app/components/form_components.dart';
import 'package:commerce/app/components/space.dart';
import 'package:commerce/app/components/text_components.dart';
import 'package:commerce/app/modules/mot_de_passe_oubli%C3%A9/view/forgot_password.dart';
import 'package:commerce/utils/colors.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              Center(child: TextComponents(txt: "Sign In Now",txtsize: 25,fw: FontWeight.bold,family: "Bold",)),
              h(40),
              TextComponents(txt: "Email/Phone",txtsize: 15),
              h(10),
              FormComponents(
                hide: false,
                textInputType: TextInputType.emailAddress,
              ),
              h(20),
              TextComponents(txt: "Password",txtsize: 15),
              h(10),
              FormComponents(
                hide: true,
                textInputType: TextInputType.visiblePassword,
              ),
              h(20),
              Row(
                children: [
                  TextComponents(txt: "Remember me",txtsize: 15,color: Colors.black38,),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      Navigator.push( context, MaterialPageRoute(builder: (context) => const ForgotPassword()));
                    },
                    child: TextComponents(txt: "Forgot Password",txtsize: 15,color: mainColor,)),
                ],
              ),
              h(20),
              ButtonComponents(txtButton: "Login", buttonColor: mainColor),
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
              h(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextComponents(txt: "Don't have an account?",txtsize: 15,color: Colors.black38,),
                  TextComponents(txt: "Sign Up",txtsize: 15,color: mainColor,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}