import 'package:commerce/app/components/button_components.dart';
import 'package:commerce/app/components/form_components.dart';
import 'package:commerce/app/components/space.dart';
import 'package:commerce/app/components/text_components.dart';
import 'package:commerce/app/modules/connexion/view/login.dart';
import 'package:commerce/app/modules/otp/view/otp.dart';
import 'package:commerce/utils/colors.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: 
         SingleChildScrollView(
          padding: EdgeInsets.all(15),
           child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                TextComponents(txt: "Forgot Password ?",txtsize: 26,fw: FontWeight.bold,family: "Bold",),
                h(20),
                TextComponents(txt: "Don't worry, it occurs. Please enter the email address associated with your account and we will email you a link to reset your password",txtsize: 15,txtalign: TextAlign.center,),
                h(40),
                Image.asset(  
                  "assets/images/forgot-password.png", 
                  scale: 5,
                ),
                h(20),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [TextComponents(txt: "Email/Phone",txtsize: 15,fw: FontWeight.bold,)],),
                h(10),
                h(20),
                FormComponents(
                  textInputType: TextInputType.emailAddress,
                ),
                h(20),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OTP()));
                  },
                  child: ButtonComponents(txtButton: "Send", buttonColor:mainColor,)),
                h(20),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: TextComponents(txt: "Back to Login",txtsize: 15,txtalign: TextAlign.center,)),
              ],
            )
                   ),
         ),
      );
  }
}