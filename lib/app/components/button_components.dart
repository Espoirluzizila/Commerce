import 'package:commerce/utils/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonComponents extends StatelessWidget {

  String txtButton;//ici on a creer un attribut de type string

  ButtonComponents(
    {super.key, required this.txtButton, required Color buttonColor}//ici on a creer un constructeur
    );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,//mediaquery permet de recuperer la taille de l'ecran de l'utilisateur
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(7),
      ),child: Center(child: Text(txtButton,style: TextStyle(color: Colors.white,fontSize: 16),)),
    );
  }
}