import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const style1 =
    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

class NavigateButton extends StatelessWidget {
  NavigateButton({
    required this.label,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ));
  }
}

class container extends StatelessWidget {
  container({required this.image, required this.text});
  final Image image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff424657),
      ),
      child: Row(
        children: [
          image,
          SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class ProjectsContainer extends StatelessWidget {
  ProjectsContainer({
    required this.text,
    required this.image,
    required this.text2,
    required this.gitcode,
    required this.demovid,
  });
  final String text;
  final String text2;
  final String image;
  final String gitcode;
  final String demovid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Expanded(
        child: Container(
          child: Column(
            children: [
              Container(
                  height: 200,
                  width: 200,
                  child: Image(image: AssetImage(image))),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      text,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      text2,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              launchUrl(demovid);
                            },
                            child: Text(
                              "▶ Demo video ",
                              style: TextStyle(color: Colors.green),
                            )),
                        TextButton(
                            onPressed: () {
                              launchUrl(gitcode);
                            },
                            child: Text(
                              '<> Code',
                              style: TextStyle(color: Colors.green),
                            )),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class contactContainer extends StatelessWidget {
  contactContainer(
      {required this.height,
      required this.textEditingController,
      required this.hinttext});
  final double height;
  final String hinttext;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: height,
          decoration: BoxDecoration(
              color: Color(0xffC8C9CE),
              borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration:
                  InputDecoration(hintText: hinttext, border: InputBorder.none),
              controller: textEditingController,
            ),
          ),
        ),
      ),
    );
  }
}

const styleSkills = TextStyle(color: Colors.white);

void launchUrl(String Url) async {
  String url = '$Url';
  try {
    await launch(url);
  } catch (e) {
    throw 'Could not launch $url';
  }
}
