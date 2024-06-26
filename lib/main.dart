import 'package:demo_app/Admin/admin_login.dart';
import 'package:demo_app/pages/jeux/game.home.page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/pages/home/home.page.dart';
import 'package:demo_app/pages/compteur.page.dart';
import 'package:demo_app/pages/produits/produits.page.dart';

import 'pages/jeux/question.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const DwmApp());
}

//La partie MaterialApp
class DwmApp extends StatelessWidget {
  const DwmApp({Key? key}) : super(key: key);

  @override
  //My app begin
  Widget build(BuildContext context) {
    return MaterialApp(
      //on désactive le bandereau de debugage
      debugShowCheckedModeBanner: false,
      //Mon système de routage,
      routes: {
        //"/": (context) => const AdminLogin(),
        "/": (context) => Question(
              category: 'home',
            ),
        // "/": (context) => const FormScreen(),
        "/home": (context) => const HomePage(),
        "/compteur": (context) => const CompteurPage(),
        "/produits": (context) => const ProduitPage(),
        "/jeux": (context) => const GameHomePage(),
      },

      //Je définis les couleurs de mon thème ainsi que le texte
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 22, color: Colors.teal),
          bodyLarge: TextStyle(fontSize: 32, color: Colors.blue),
          bodySmall: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 150, 0, 112),
          ),
        ),

        //icons colors,
        iconTheme: const IconThemeData(color: Colors.teal, size: 25),
      ),

      //Quand on spécifie la route "/" plus besoin de la class HomePage encore
      //  home: FormScreen(),
    );
  }
}
