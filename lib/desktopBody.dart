import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/class.dart';
import 'package:url_launcher/url_launcher.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<GlobalKey> navbarkeys = List.generate(4, (index) => GlobalKey());

  final Uri url = Uri.parse("https://github.com/Ayan1mulani");

  void scrollTo(int index) {
    if (index >= 0 && index < navbarkeys.length) {
      final key = navbarkeys[index];
      final RenderBox renderBox =
          key.currentContext!.findRenderObject() as RenderBox;
      renderBox.localToGlobal(Offset.zero,
          ancestor: context.findRenderObject());
      Scrollable.ensureVisible(key.currentContext!,
          duration: Duration(milliseconds: 500));
    }
  }

  Future<void> onLaunchUrl() async {
    try {
      final launched = await launch(url.toString());
      if (!launched) {
        throw Exception("Failed to launch URL");
      }
    } catch (e) {
      print("Error launching URL: $e");
    }
  }

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController messagecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff252734),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                key: navbarkeys.first,
              ),
              Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0XFF20212C),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Image.network(
                          'https://img.icons8.com/?size=512&id=7I3BjCqe9rjG&format=png'),
                      Expanded(child: SizedBox()),
                      NavigateButton(
                          label: "Home", onPressed: () => scrollTo(0)),
                      NavigateButton(
                          label: "Skills", onPressed: () => scrollTo(1)),
                      NavigateButton(
                          label: "Projects", onPressed: () => scrollTo(2)),
                      NavigateButton(
                          label: "Contact", onPressed: () => scrollTo(3)),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            "Hi,\ni'm  Ayan Mulani\nA Flutter Developer",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffFFB53A)),
                              onPressed: () {
                                openCV();
                              },
                              child: Text(
                                "Download CV",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 500,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_1080,q_100,w_1080/v1/gcs/platform-data-dsc/events/flutter_webinar_logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: Color(0xff333646),
                height: 200,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(key: navbarkeys[1], height: 20),
                    Center(
                      child: Text("What i can do", style: style1),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        container(
                            image: Image.network(
                                "https://img.icons8.com/?size=512&id=7I3BjCqe9rjG&format=png"),
                            text: "FLUTTER"),
                        SizedBox(width: 10),
                        container(
                            image: Image.network(
                                "https://img.icons8.com/?size=512&id=62452&format=png"),
                            text: 'Firebase'),
                        SizedBox(width: 10),
                        container(
                            image: Image.network(
                                "https://img.icons8.com/?size=512&id=21896&format=png"),
                            text: "Rest API"),
                        SizedBox(width: 10),
                        container(
                            image: Image.network(
                                "https://img.icons8.com/?size=512&id=20906&format=png"),
                            text: "Git hub")
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(key: navbarkeys[2], height: 50),
              Text("Work Projects", style: style1),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProjectsContainer(
                    demovid: 'https://youtu.be/HxPMXo30C8Q?feature=shared',
                    image: 'images/food.jpg',
                    text: "Food delivery app",
                    text2: 'Payment gateway, cloud firestore,',
                    gitcode:
                        "https://github.com/Ayan1mulani/Food_delivery_app/tree/main/lib",
                  ),
                  ProjectsContainer(
                      demovid: 'https://youtu.be/31Y72c2wsYQ?feature=shared',
                      text: "crypto App",
                      image: "images/cry.jpg",
                      text2: "Authentication, Api, ",
                      gitcode:
                          "https://github.com/Ayan1mulani/Crypto_App/tree/main/lib"),
                  ProjectsContainer(
                      demovid:
                          'https://youtube.com/shorts/X4M68Uow9cg?feature=shared',
                      text: "Group messaging App",
                      image: "images/mes2.jpg",
                      text2: 'Firestore,streambuilder,Auth,',
                      gitcode:
                          "https://github.com/Ayan1mulani/Group_Messaging_APP/tree/main/lib")
                ],
              ),
              SizedBox(
                height: 160,
              ),
              Text("Skills", style: style1),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Payment gateways",
                          style: styleSkills,
                        ),
                        Text(
                          "Git hub",
                          style: styleSkills,
                        ),
                        Text(
                          "Authentaction",
                          style: styleSkills,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Cloud Firestore",
                          style: styleSkills,
                        ),
                        Text(
                          "Rest API",
                          style: styleSkills,
                        ),
                        Text(
                          "Responsive design",
                          style: styleSkills,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.only(left: 150, right: 150),
                child: Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0XFF333646),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text("Get in touch", style: style1),
                        Row(
                          children: [
                            contactContainer(
                                height: 40,
                                hinttext: "Your name",
                                textEditingController: namecontroller),
                            contactContainer(
                                hinttext: "Your email",
                                textEditingController: emailcontroller,
                                height: 40),
                          ],
                        ),
                        contactContainer(
                            hinttext: "Your Message",
                            textEditingController: messagecontroller,
                            height: 100),
                        Container(
                          height: 40,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0XFFFFAF29)),
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('client')
                                    .add({
                                  'name': namecontroller.text,
                                  'email': emailcontroller.text,
                                  'message': messagecontroller.text
                                });
                              },
                              key: navbarkeys[3],
                              child: Text("Get in touch",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                            width: 300,
                            child: Divider(height: 10, thickness: 1)),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                onLaunchUrl();
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                child: Image.network(
                                    'https://banhawy.github.io/cv/img/github-logo.png'),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                _launchPhone('+91 8668361520');
                              },
                              child: Icon(
                                Icons.phone,
                                color: Color(0xff3B82F6),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                _launchGmail('ayanmulani158@gmail.com');
                              },
                              child: Icon(
                                Icons.mail,
                                color: Color.fromARGB(255, 106, 116, 131),
                              ),
                            )
                          ],
                        )
                      ],
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

void _launchPhone(String phoneNumber) async {
  String url = 'tel:$phoneNumber';
  try {
    await launch(url);
  } catch (e) {
    throw 'Could not launch $url';
  }
}

void _launchGmail(String gmail) async {
  String url = 'mailto:$gmail';
  try {
    await launch(url);
  } catch (e) {
    throw 'Could not launch $url';
  }
}

void openCV() async {
  const googleDriveLink =
      'https://drive.google.com/file/d/1ENtFuCE88IoMolpW862Mg0pI4HYL3u2g/view?usp=sharing';
  if (await canLaunch(googleDriveLink)) {
    await launch(googleDriveLink);
  } else {
    throw 'Could not launch $googleDriveLink';
  }
}
