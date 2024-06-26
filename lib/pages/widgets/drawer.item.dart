import 'package:flutter/material.dart';
//import 'package:demo_app/pages/widgets/drawer.item.dart';

class MyDrawerItem extends StatelessWidget {
  //Déclaration des constantes
  final String title;
  final Icon itemIcon;
  final Function onTap;
  const MyDrawerItem({
    Key? key,
    //ajout de parametres
    required this.title,
    required this.itemIcon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return //Item1
        ListTile(
      //Les icons pour les onglets
      leading: itemIcon,
      trailing: const Icon(Icons.arrow_forward_ios_sharp),

      onTap: () => onTap(),

      //Les titres
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
