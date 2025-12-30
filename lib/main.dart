import 'package:commerce/app/components/button_components.dart';
import 'package:commerce/app/components/text_components.dart';
import 'package:commerce/app/modules/splash/view/splash.dart';
import 'package:commerce/utils/colors.dart';
import 'package:commerce/utils/constante.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mainColor),//colorScheme permet de changer la couleur de l'appli
      ),
      home: Splash(),//home permet de changer la page de l'appli
    );
  }
}

