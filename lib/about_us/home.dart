import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50),
              Text(
                'About the Author',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 40,
                  fontFamily: "Signatra",
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Meet the Creator',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  fontFamily: "Signatra",
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/about_us.png'),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Name: Mahmud Morenikeji Latifat \n Matric Number: 19/55EE115',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Mahmud Morenikeji Latifat is a passionate Student of Plant Biology at the University of Ilorin, Ilorin, Nigeria',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Expertise',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '- A plant biologist',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Background',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '- Lateefah holds a degree in Plant Biology, Faculty of Life Sciences. She is dedicated to continuous learning and sharing her knowledge with the biologist community through researches and open-source contributions.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),

              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                      text: 'Developed by:-',
                    ),
                    
                    TextSpan(
                      text: ' Yusasive',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 50, 155, 241),
                        decoration: TextDecoration.none,
                        fontSize: 20,
                        fontFamily: "signatra",
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _launchURL('https://www.linkedin.com/in/yuusuf-abdullahi-temidayo-yusasive/');
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
