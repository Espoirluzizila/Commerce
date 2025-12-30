import 'package:flutter/material.dart';

class ButtonComponents extends StatelessWidget {
  final String txtButton; // libellé du bouton
  final Color buttonColor; // couleur passée par l'appelant

  const ButtonComponents({super.key, required this.txtButton, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width, // largeur adaptative
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Center(
        child: Text(
          txtButton,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
