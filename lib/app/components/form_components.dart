import 'package:flutter/material.dart';

class FormComponents extends StatelessWidget {


  TextInputType textInputType;
  bool hide;
  
  

  FormComponents(
    {
       this.textInputType=TextInputType.emailAddress,
       this.hide=false,
      }
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: hide,
      decoration: InputDecoration(
        suffixIcon: hide? Icon(
          Icons.remove_red_eye_outlined):null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}