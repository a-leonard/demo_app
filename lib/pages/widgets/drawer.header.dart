import 'package:flutter/material.dart';

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Theme.of(context).primaryColor],
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
                "images/logos/100_3.jpg"), // image logo 1 avec la fonction CircleAvatar
            //"images/assets/media/users/100_6.jpg"), // image logo 1 avec la fonction CircleAvatar
            radius: 50,
          ),
          CircleAvatar(
            backgroundImage: AssetImage(
                //"images/"), // image logo 2 avec la fonction CircleAvatar
                "images/logos/stars.png"), // image logo 2 avec la fonction CircleAvatar
            radius: 40,
          )
        ],
      ),
    );
  }
}
