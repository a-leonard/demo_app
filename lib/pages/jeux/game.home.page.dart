import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/pages/jeux/question.dart';
import 'package:flutter/material.dart';

class GameHomePage extends StatefulWidget {
  const GameHomePage({Key? key}) : super(key: key);

  @override
  State<GameHomePage> createState() => _GameHomePageState();
}

class _GameHomePageState extends State<GameHomePage> {
  //Mes déclarations
  Stream? quizStream;
  PageController controller = PageController();
  Widget allQuiz() {
    return StreamBuilder(
      stream: quizStream,
      builder: (context, AsyncSnapshot snapshop) {
        return snapshop.hasData
            ? PageView.builder(
                controller: controller,
                itemCount: snapshop.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshop.data.docs[index];
                  return;
                },
              )
            : Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:
      backgroundColor: const Color(0xffedf3f6),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 300, //hauteur du container 2
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      top: 50.0,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFF2a2b31),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.asset(
                            "images/assets/media/users/300_5.jpg",
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 30.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            "COMPAORE A. LEONARD",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        )
                      ],
                    ),
                  ),

                  //Container 3,
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 84, 85, 88),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    margin: const EdgeInsets.only(
                      top: 180.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          child: Image.asset(
                            // "images/assets/media/error/bg6.jpg",
                            //"images/assets/media/users/300_5.jpg",
                            "images/jeux/place1.jpg",
                            height: 300.0,
                            width: 300.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "JOUER &\n GAGNER",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.5,
                              ),
                            ),
                            Text(
                              "Vous devinez\n l'image ci-après.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ], //
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                ),
                child: Text(
                  "Catégorie de jeux",
                  style: TextStyle(
                    color: Color.fromARGB(255, 5, 6, 10),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              //Begin categorie
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                ),
                //Begin Row
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Begin Container of image,
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Question(
                              category: 'Alimentation',
                            ),
                          ),
                        );
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 10.0, //showdown
                        child: Container(
                          width: 200.0,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              //image
                              Image.asset(
                                "images/assets/media/products/4.png",
                                height: 100.0,
                                width: 100.0,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                "Boissons",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 5, 6, 10),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //Begin Container of image,
                    const SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Question(
                              category: 'Boissons',
                            ),
                          ),
                        );
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Question(
                                category: 'lieux',
                              ),
                            ),
                          );
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          elevation: 10.0, //showdown
                          child: Container(
                            width: 200.0,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                //image
                                Image.asset(
                                  "images/jeux/chaise.jpg",
                                  height: 100.0,
                                  width: 80.0,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const Text(
                                  "Lieux",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 5, 6, 10),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Begin categorie
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                ),
                //Begin Row
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Begin Container of image,
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Question(
                              category: 'Habillement',
                            ),
                          ),
                        );
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 10.0, //showdown
                        child: Container(
                          width: 200.0,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              //image
                              Image.asset(
                                "images/assets/media/products/13.png",
                                height: 100.0,
                                width: 100.0,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                "Chaussures",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 5, 6, 10),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //Begin Container of image,
                    const SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Question(
                              category: 'Enseignement',
                            ),
                          ),
                        );
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 10.0, //showdown
                        child: Container(
                          width: 200.0,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              //image
                              Image.asset(
                                "images/jeux/prof.jpg",
                                height: 100.0,
                                width: 80.0,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                "Enseignement",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 5, 6, 10),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Begin categorie
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                ),
                //Begin Row
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Begin Container of image,
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Question(
                              category: 'Batiments',
                            ),
                          ),
                        );
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 10.0, //showdown
                        child: Container(
                          width: 200.0,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              //image
                              Image.asset(
                                "images/assets/media/stock-600x400/img-57.jpg",
                                height: 100.0,
                                width: 100.0,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                "Batiments",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 5, 6, 10),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //Begin Container of image,
                    const SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Question(
                              category: 'Fruits',
                            ),
                          ),
                        );
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 10.0, //showdown
                        child: Container(
                          width: 200.0,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              //image
                              Image.asset(
                                "images/assets/media/stock-600x400/img-3.jpg",
                                height: 100.0,
                                width: 80.0,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                "Fruits",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 5, 6, 10),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
