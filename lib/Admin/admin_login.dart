import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'add_quiz.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController userpasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFededeb),
      body: Container(
        child: Stack(
          children: [
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
              padding: const EdgeInsets.only(
                top: 45.0,
                left: 20.0,
                right: 20.0,
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 53, 51, 51),
                    Colors.black,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(
                      MediaQuery.of(context).size.width, 110.0),
                ),
              ),
            ),
            //Begin container 2,
            Container(
              margin: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                top: 60.0,
              ),
              child: Form(
                child: Column(
                  children: [
                    const Text(
                      "Portail administrateur",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                left: 10.0,
                                top: 0.0,
                                bottom: 5.0,
                              ),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 160, 160, 147),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: TextFormField(
                                  controller: usernamecontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Veuillez saisir un nom d\'utilisateur';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "John",
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 160, 160, 147),
                                      fontSize: 26,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                left: 10.0,
                                top: 0.0,
                                bottom: 5.0,
                              ),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 160, 160, 147),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: TextFormField(
                                  controller: userpasswordcontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Veuillez saisir votre mot de passe';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Votre mot de passe",
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 160, 160, 147),
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            GestureDetector(
                              //redirect to loginAdmin page
                              onTap: () {
                                loginAdmin();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12.0,
                                ),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Me connecter",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  loginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()['id'] != usernamecontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Le nom de l'utilisateur saisi est incorrect !",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
          );
        } else if (result.data()['password'] !=
            userpasswordcontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Le mot de passe que vous saisi est incorrect !",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
          );
        } else {
          Route route = MaterialPageRoute(builder: (context) => const AddQuiz());
          Navigator.pushReplacement(context, route);
        }
      });
    });
  }
}
