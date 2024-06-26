import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  String category;
  Question({super.key, required this.category});
 // const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
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
                    return Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 40.0,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: //Image.asset(
                                    Image.network(
                                  ds['Image'],
                                  //"images/assets/media/stock-900x600/25.jpg",
                                  height: 300,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            //Begin Container 2,
                            Container(
                              margin: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFF81B1B1),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text(
                                ds['reponse1'],
                                //"Une moto",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            //Begin Container 3,
                            const SizedBox(
                              height: 15.0,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFF81B1B1),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text(
                                ds['reponse2'],
                                //"Un vélo",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFF81B1B1),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text(
                                ds['reponse3'],
                                //"Un avion",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFF81B1B1),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text(
                                ds['reponse4'],
                                //"Un train",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFF004840,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50.0,
                left: 20.0,
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFf35b32),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 120,
                  ),
                  const Text(
                    "Cyclisme",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            //Begin container,
            const SizedBox(
              height: 20,
            ),
            //appel du widget allQuiz
            allQuiz()
          ],
        ),
      ),
    );
  }
}
