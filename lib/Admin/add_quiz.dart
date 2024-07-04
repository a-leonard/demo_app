import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

import '../service/database.dart';

class AddQuiz extends StatefulWidget {
  const AddQuiz({super.key});

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  //Upload an image
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {});
  }

  uploadItem() async {
    if (selectedImage != null &&
        reponse1controller.text != "" &&
        reponse2controller.text != "" &&
        reponse3controller.text != "" &&
        reponse4controller.text != "") {
      String addId = randomAlphaNumeric(10);
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child("blogImage").child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
      var downloadUrl = await (await task).ref.getDownloadURL();

      //Enregistrement dans la base de données
      Map<String, dynamic> addQuiz = {
        "Image": downloadUrl,
        "reponse1": reponse1controller.text,
        "reponse2": reponse2controller.text,
        "reponse3": reponse3controller.text,
        "reponse4": reponse4controller.text,
        "bonnereponse": bonnereponsecontroller.text,
      };
      await DatabaseMethods().addQuizCategory(addQuiz, value!).then((value) {
        //add flash message de confirmation
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Votre devinette a été ajoutée avec succès.",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        );
      });
    }
  }

  //DropDownListItems
  String? value;
  final List<String> quizitems = [
    'Animal',
    'Sport',
    'Football',
    'Lieux',
    'Science',
    'Habillement',
    'Fruit'
  ];

  //Controllers
  TextEditingController reponse1controller = TextEditingController();
  TextEditingController reponse2controller = TextEditingController();
  TextEditingController reponse3controller = TextEditingController();
  TextEditingController reponse4controller = TextEditingController();
  TextEditingController bonnereponsecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ajouter une devinette",
          style: TextStyle(
            color: Colors.black,
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0,
            bottom: 40.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Importer une image à deviner",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              //Upload an image
              selectedImage == null
                  ? GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Center(
                        child: Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 150.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),

              //Propositions de réponses
              const SizedBox(
                height: 20,
              ),
              //form  title 1
              const Text(
                "Résonse n°1",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              //espace
              const SizedBox(
                height: 20.0,
              ),
              Container(
                //Les propriétés du container
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),

                //Saisir la prémière réponse
                child: TextField(
                  controller: reponse1controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Saisir la réponse n°1 ici...",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //form  title 2
              const Text(
                "Résonse n°2",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              //espace
              const SizedBox(
                height: 20.0,
              ),
              Container(
                //Les propriétés du container
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),

                //Saisir la prémière réponse
                child: TextField(
                  controller: reponse2controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Saisir la réponse n°2 ici...",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //form  title 3
              const Text(
                "Résonse n°3",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              //espace
              const SizedBox(
                height: 20.0,
              ),
              Container(
                //Les propriétés du container
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),

                //Saisir la troisième réponse
                child: TextField(
                  controller: reponse3controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Saisir la réponse n°3 ici...",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              //form  title 4
              const Text(
                "Résonse n°4",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              //espace
              const SizedBox(
                height: 20.0,
              ),
              Container(
                //Les propriétés du container
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),

                //Saisir la quatrième réponse
                child: TextField(
                  controller: reponse4controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Saisir la réponse n°4 ici...",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //form  title 4
              const Text(
                "Bonne réponse:",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              //espace
              const SizedBox(
                height: 20.0,
              ),
              Container(
                //Les propriétés du container
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),

                //Saisir la bonne réponse
                child: TextField(
                  controller: bonnereponsecontroller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Saisir la bonne réponse ici...",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Begin container,
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xFFececFB),
                    borderRadius: BorderRadius.circular(10.0)),

                //DropDownButton,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: quizitems
                        .map(
                          (item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) => setState(() {
                      this.value = value;
                    }),
                    dropdownColor: Colors.white,
                    hint: const Text("Catégorie"),
                    iconSize: 36,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    value: value,
                  ),
                ),
              ),

              //button de validation,
              const SizedBox(
                height: 30.0,
              ),

              GestureDetector(
                onTap: () {
                  uploadItem();
                },
                child: Center(
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Valider",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
