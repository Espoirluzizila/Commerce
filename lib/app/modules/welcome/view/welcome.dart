import 'package:commerce/app/components/button_components.dart';
import 'package:commerce/app/components/space.dart';
import 'package:commerce/app/components/text_components.dart';
import 'package:commerce/utils/colors.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/amaan-abid-wmMS2nqpcQo-unsplash.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.black.withOpacity(0.55),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextComponents(
                txt: "Discover Your Style",
                txtsize: 32,
                txtalign: TextAlign.center,
                fw: FontWeight.bold,
                family: "Bold",
                color: Colors.white,
              ),
              h(15),
              TextComponents(
                txt:
                    "Trendy clothes and accessories\nmade just for you",
                txtsize: 16,
                txtalign: TextAlign.center,
                color: Colors.white70,
              ),
              h(80),
              InkWell(
                onTap: () {
                  // Navigation vers Home ou Auth
                },
                child: ButtonComponents(
                  txtButton: "Get Started",
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
