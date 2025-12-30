import'package:flutter/material.dart';
import 'package:commerce/app/modules/home/view/home.dart';

Future<void> time(BuildContext context) async {//on cree une fonction
  await Future.delayed(const Duration(seconds: 3));//on cree une attente
  Navigator.pushReplacementNamed(context, '/welcome');
}
