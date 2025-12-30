import 'package:commerce/app/components/button_components.dart';
import 'package:commerce/app/components/form_components.dart';
import 'package:commerce/app/components/space.dart';
import 'package:commerce/app/components/text_components.dart';
import 'package:commerce/app/modules/changePassword/view/change-password.dart';
import 'package:commerce/app/modules/mot_de_passe_oubli%C3%A9/view/forgot_password.dart';
import 'package:commerce/utils/colors.dart';
import 'package:flutter/material.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {

  

  @override
  Widget build(BuildContext context) {
  return 
    Scaffold(
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
                TextComponents(txt: "Verification Code",txtsize: 26,fw: FontWeight.bold,family: "Bold",),
                h(20),
                TextComponents(txt: "Please enter the 4 digit code sent to your email ",txtsize: 15,txtalign: TextAlign.center,),
                h(40),
                TextComponents(txt: "Enter Code",txtsize: 15,fw: FontWeight.bold,),
                h(10),
                FormComponents(
                  hide: false,
                  textInputType: TextInputType.number,
                ),
                h(20),
                TextComponents(txt: "Code expire in 00:30",txtsize: 15,),
                h(20),
                InkWell(
                  onTap: () {
                    Navigator.push( context, MaterialPageRoute(builder: (context) => const ChangePassword()));
                  },
                  child: ButtonComponents(txtButton: "Verify", buttonColor:mainColor,)),
                h(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [InkWell(
                    onTap: () {
                      Navigator.push( context, MaterialPageRoute(builder: (context) => OTP()));
                    },
                    child: TextComponents(txt:"Resend Code",txtsize: 15,color: mainColor,),),
                  w(20),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => const ForgotPassword()));
                    },
                    child: TextComponents(txt:"Cancel",txtsize: 15,color: Colors.black,),),
                  ],),
              ],
          ),
        ),
      ),
    );
  }
}
  