import 'package:flutter/material.dart';

class CompteurPage extends StatefulWidget {
  const CompteurPage({Key? key}) : super(key: key);

  @override
  State<CompteurPage> createState() => _CompteurPageState();
}

class _CompteurPageState extends State<CompteurPage> {
  //Mes déclarations
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page compteur => $counter"),
      ),
      body: Center(
        child: Text("Ceci est un compteur: $counter "),
      ),

      //on insére un bouton flottant,
      floatingActionButton: Row(
        mainAxisAlignment:
            MainAxisAlignment.end, //on met le bouton à l'extrème droite
        children: [
          //The first floatingActionButton
          FloatingActionButton(
            heroTag: "moins", //on différencie les deux buttons flottants
            onPressed: () {
              //on regenere le rendu
              setState(() {
                --counter; // on decrément le compteur
              });
            },
            child: const Icon(Icons.remove), //l'icon du bouton moins (-)
          ),

          //on met un espace entre les deux boutons,
          const SizedBox(
            width: 20,
          ),

          //The second floatingActionButton
          FloatingActionButton(
            heroTag: "plus", //on différencie les deux buttons flottants
            onPressed: () {
// la fonction setstate modifie et actualise les variables
              setState(() {
                ++counter; //on incrément le compteur
              });
            },
            child: const Icon(Icons.add), //l'icon du bouton plus (+)
          )
        ],
      ),
    );
  }
}
