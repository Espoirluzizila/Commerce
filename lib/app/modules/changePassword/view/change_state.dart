import 'package:commerce/app/components/button_components.dart';
import 'package:commerce/app/components/space.dart';
import 'package:commerce/app/components/text_components.dart';
import 'package:commerce/app/modules/welcome/view/welcome.dart';
import 'package:commerce/utils/colors.dart';
import 'package:flutter/material.dart';

class ChangeState extends StatefulWidget {
  const ChangeState({super.key});

  @override
  State<ChangeState> createState() => _ChangeStateState();
}

class _ChangeStateState extends State<ChangeState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Container(
  width: MediaQuery.of(context).size.width,
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      h(40),
      Icon(Icons.check_circle, color: Colors.green, size: 100),
      h(20),
      TextComponents(
        txt: "Congratulations",
        txtsize: 28,
        fw: FontWeight.bold,
        family: "Bold",
      ),
      h(20),
      TextComponents(
        txt: "Your account has been successfully \ncreated",
        txtsize: 20,
        txtalign: TextAlign.center,
      ),
      h(80),
      InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Welcome()));
        },
        child: ButtonComponents(
          txtButton: "Continuar Shopping",
          buttonColor: mainColor,
        ),
      ),
    ],
  ),
),
      ),   
    );
  }
}