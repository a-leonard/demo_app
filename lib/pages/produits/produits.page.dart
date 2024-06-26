import 'package:flutter/material.dart';
import '../constantes/colors.dart' as color;

class ProduitPage extends StatelessWidget {
  const ProduitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of products"),
      ),
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(
          top: 70,
          left: 30,
          right: 30,
        ), //padding de l'icon
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Traiding online",
                  style: TextStyle(
                    fontSize: 30,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                //Icon,
                Expanded(child: Container()), //on decale l'icon à droit
                Icon(Icons.arrow_back_ios,
                    size: 25, color: color.AppColor.homePageIcons),
                const SizedBox(
                  width: 5,
                ),

                Icon(Icons.calendar_today_outlined,
                    size: 30, color: color.AppColor.homePageIcons),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 25,
                  color: color.AppColor.homePageIcons,
                ),
              ],
            ),

            const SizedBox(
              //width: 30,
              height: 30,
            ),

            Row(
              children: [
                Text(
                  "Traiding",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                Expanded(child: Container()), //on décale à droit
                Text(
                  "Voir détails",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageDetail,
                  ),
                ),

                const SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
              ],
            ),

            //space
            const SizedBox(
              height: 20,
            ),

            //Begin Section 1
            Container(
              //section 2
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColor.gradientFirst.withOpacity(0.8),
                    color.AppColor.gradientSecond.withOpacity(0.9),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(80),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(5, 10),
                    blurRadius: 20,
                    color: color.AppColor.gradientSecond.withOpacity(0.2),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 25,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next Workout",
                      style: TextStyle(
                        fontSize: 16,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Legs Toning",
                      style: TextStyle(
                        fontSize: 25,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "And Glutes workouts",
                      style: TextStyle(
                        fontSize: 25,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: color.AppColor.homePageContainerTextSmall,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "60 min",
                              style: TextStyle(
                                fontSize: 15,
                                color:
                                    color.AppColor.homePageContainerTextSmall,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                    color: color.AppColor.gradientFirst,
                                    blurRadius: 10,
                                    offset: const Offset(4, 8))
                              ]),
                          child: const Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: 55,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

//space between the first and second party
            const SizedBox(
              height: 5,
            ),

            //on peut utliser sizedbox au lieu de container
            SizedBox(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  //image1 container
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                      //la marge
                      top: 300,
                      //right: 100,
                    ),
                    height: 120, //la hauteur
                    //image1
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage(
                          "images/assets/media/bg/350.jpg",
                        ),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40,
                          offset: const Offset(8, 10),
                          color: color.AppColor.gradientSecond.withOpacity(0.3),
                        ),
                        BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(-1, -5),
                          color: color.AppColor.gradientSecond.withOpacity(0.3),
                        )
                      ],
                    ),
                  ),

                  //image2 à superposer à la prémière
                  Container(
                    height: 200,
                    width: 350,
                    //width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                      right: 200,
                      bottom: 30,
                      //top: 0,
                    ),
                    //image2
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage(
                          "images/assets/media/logos/stars.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  //Text container,
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: const EdgeInsets.only(
                      left: 150,
                      top: 50,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "you are doing what?",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.homePageDetail,
                          ),
                        ),

                        //space
                        const SizedBox(
                          height: 10,
                        ),

                        RichText(
                          text: const TextSpan(
                              text: "Keep it up\n",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: "Stick to your plan",
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // troisième section,
            Row(
              //Title
              children: [
                Text(
                  "Few choices",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: color.AppColor.homePageTitle,
                  ),
                )
              ],
            ),

            Expanded(
              //few products
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (_, i) {
                  return Row(
                    children: [
                      Container(
                        width: 200,
                        height: 170,
                        padding: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage(
                                "images/assets/media/client-logos/logo2.png",
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  offset: const Offset(5, 5),
                                  color: color.AppColor.gradientSecond
                                      .withOpacity(0.1)),
                              BoxShadow(
                                  blurRadius: 3,
                                  offset: const Offset(-5, -5),
                                  color: color.AppColor.gradientSecond
                                      .withOpacity(0.1)),
                            ]),
                        child: Center(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "Glutes",
                              style: TextStyle(
                                fontSize: 20,
                                color: color.AppColor.homePageDetail,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
