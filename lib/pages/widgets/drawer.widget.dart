import 'package:demo_app/pages/widgets/drawer.header.dart';
import 'package:demo_app/pages/widgets/drawer.item.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const MyDrawerHeader(), //on includ le header
          //Menu items for the header
          MyDrawerItem(
              title: "Accueil", //item1
              itemIcon: const Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pop(); //retour à la page d'accueil
                //On active la navigation de la page d'accueil
                Navigator.pushNamed(context, "/");
              }),
          MyDrawerItem(
              title: "Compteur", //item2
              itemIcon: const Icon(Icons.ac_unit_rounded),
              onTap: () {
                Navigator.of(context).pop(); //retour à la page d'accueil
                //On active la navigation de la page compteur
                Navigator.pushNamed(context, "/compteur"); //Route compteur
              }),
          MyDrawerItem(
              title: "Produits", //item3
              itemIcon: const Icon(Icons.account_balance),
              onTap: () {
                Navigator.of(context).pop(); //retour à la page d'accueil
                //On active la navigation de la page produits
                Navigator.pushNamed(context, "/produits"); //Route produits
              }),
          MyDrawerItem(
              title: "Jeux", //item3
              itemIcon: const Icon(Icons.access_time_filled_rounded), //item
              onTap: () {
                Navigator.of(context).pop(); //retour à la page d'accueil
                //On active la navigation de la page produits
                Navigator.pushNamed(context, "/jeux"); //Route produits
              }),
          MyDrawerItem(
            title: "login", //item4
            itemIcon: const Icon(Icons.account_circle_outlined), //item
            onTap: () {
              Navigator.of(context).pop(); //retour à la page d'accueil
              //On active la navigation de la page produits
              Navigator.pushNamed(context, "/login"); //Route de la connexion
            },
          ),
        ],
      ),
    );
  }
}
