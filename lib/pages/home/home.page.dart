import 'package:demo_app/pages/widgets/drawer.widget.dart';
import 'package:flutter/material.dart';

//On crée la class homepage
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  //On crée le builder de la page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Begin NavBar
      appBar: AppBar(
        title: const Text("Page d'accueil"),
      ),

      //Begin Navigation
      drawer: const MyDrawer(), //on appelle le Navbar menu
      //Navigation
      //End NavBar
      // FormScreen(),

      //Begin Body
      body: const Center(
        child: Text(
          "Bienvenue mon ami(e) !",
          style: TextStyle(fontSize: 32, color: Colors.blue),
        ),
      ),
    );
  }
}
