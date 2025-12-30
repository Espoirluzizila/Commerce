import 'package:commerce/app/components/button_components.dart';
import 'package:commerce/app/components/text_components.dart';
import 'package:commerce/app/modules/splash/view/splash.dart';
import 'package:commerce/app/modules/welcome/view/welcome.dart';
import 'package:commerce/app/modules/home/view/home.dart'; // conservé si besoin d'auth
import 'package:commerce/app/modules/catalog/view/catalog.dart';
import 'package:commerce/app/modules/product_detail/view/product_detail.dart';
import 'package:commerce/app/modules/cart/view/cart.dart';
import 'package:commerce/app/modules/checkout/view/checkout.dart';
import 'package:commerce/app/modules/wishlist/view/wishlist.dart';
import 'package:commerce/utils/colors.dart';
import 'package:commerce/utils/constante.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appState = AppState();
  await appState.load();
  runApp(AppStateScope(notifier: appState, child: const MyApp()));
}

import 'state/app_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mainColor), // colorScheme permet de changer la couleur de l'appli
        useMaterial3: true,
      ),
      home: const Splash(), // page de démarrage
      routes: {
        '/welcome': (context) => const Welcome(),
        '/home': (context) => const Home(), // conservé si besoin
        '/catalog': (context) => const Catalog(),
        '/product': (context) => const ProductDetail(),
        '/cart': (context) => const CartView(),
        '/checkout': (context) => const CheckoutView(),
        '/wishlist': (context) => const WishlistView(),
      },
    );
  }
}

