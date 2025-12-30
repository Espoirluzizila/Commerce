import 'package:commerce/app/components/text_components.dart';
import 'package:commerce/app/modules/splash/controller/controller.dart';
import 'package:commerce/utils/colors.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {// on cree une fonction asynchrone
    super.initState();
    time(context); // on appelle la fonction
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homebg,
      body: Center(
        child: Container(
          width: 240,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Mightygram.jpg",
                height: 100,
                width: 100,
              ),
              TextComponents(
                txt: "COMMERCE",
                txtsize: 30,
                txtalign: TextAlign.center,
                fw: FontWeight.bold,
                color: Colors.black,
              ),
              TextComponents(
                txt: "E-COMMERCE",
                txtsize: 15,
                txtalign: TextAlign.center,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
