import 'package:commerce/app/components/button_components.dart';
import 'package:commerce/app/components/form_components.dart';
import 'package:commerce/app/components/space.dart';
import 'package:commerce/app/components/text_components.dart';
import 'package:commerce/app/modules/changePassword/view/change_state.dart';
import 'package:commerce/utils/colors.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
                TextComponents(txt: "Enter new password",txtsize: 26,fw: FontWeight.bold,family: "Bold",),
                h(20),
                TextComponents(txt: "Please enter your new password",txtsize: 15,txtalign: TextAlign.center,),
                h(10),
                TextComponents(txt: "New password",txtsize: 15,fw: FontWeight.bold,),
                h(10),
                FormComponents(
                  hide: true,
                  textInputType: TextInputType.visiblePassword,
                ),
                TextComponents(txt: "Must be at least 8 characters",txtsize: 12,txtalign: TextAlign.center,),
                h(20),
                TextComponents(txt: "Confirm Password",txtsize: 15,fw: FontWeight.bold,),
                h(10),
                FormComponents(
                  hide: true,
                  textInputType: TextInputType.visiblePassword,
                ),
                TextComponents(txt: "Password must be at least 8 characters",txtsize: 12,txtalign: TextAlign.center,),
                h(100),
                InkWell(onTap: (){
                  Navigator.push( context, MaterialPageRoute(builder: (context) => const ChangeState()));
                }, child: ButtonComponents(txtButton: "Save", buttonColor:mainColor,)),
              ],              
            ),
          ),
        ),          
    );
  }
}
  