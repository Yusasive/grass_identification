import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                'About Grass Identification',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 40,
                  fontFamily: "Signatra",
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Poaceae Grasses Recognizer App',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  fontFamily: "Signatra",
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Discussion',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'The development of a mobile application for identifying grasses within the Poaceae family is a significant advancement in both botanical research and practical fieldwork. The Poaceae family, also known as the grass family, encompasses a vast number of species that are ecologically and economically important. The creation of a user-friendly mobile app can aid botanists, ecologists, farmers, and hobbyists in accurately identifying and studying these plants',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Key Features and Benefits',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '- Comprehensive Database: The app should include an extensive database of grass species and can identify about 200 Poaceae Grass Species, complete with high-quality images, descriptions, and key identification features. This database can be continuously updated to include new discoveries and taxonomic revisions (Miller et al., 2015).\n'
                '- User Interface and Experience: A user-friendly interface is crucial. The app should be designed to be intuitive, allowing users to easily navigate through species profiles and identification tools. Features such as search filters, comparison tools, and interactive keys can enhance the user experience (Jones & Allen, 2019).\n'
                '- Advanced Identification Tools: Incorporating image recognition technology can significantly aid in the identification process. Users can upload photos of grass specimens, and the app can analyze these images to suggest possible matches from the database. Machine learning algorithms can improve the accuracy of these suggestions over time (Zhang et al., 2020).\n'
                '- Educational Resources: The app can serve as an educational tool, offering detailed information about the ecological roles, geographic distributions, and economic uses of different grass species. Interactive features like quizzes and identification challenges can engage users and enhance their learning experience (Smith & Turner, 2018).\n'
                '- Offline Access and Data Collection: Providing offline access to the database is essential for fieldwork in remote areas without internet connectivity. Additionally, the app can allow users to record and submit their observations, contributing to citizen science projects and expanding the collective knowledge of Poaceae diversity (Brown et al., 2021).',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Challenges and Solutions',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Data Accuracy and Quality: Ensuring the accuracy and quality of the data is paramount. Collaborations with botanical institutions and continuous peer review can help maintain high standards. Regular updates and user feedback mechanisms can also contribute to data reliability (Garcia et al., 2022).\n'
                'Technical Limitations: Developing sophisticated image recognition algorithms requires significant technical expertise and resources. Partnering with tech companies or research institutions specializing in artificial intelligence can provide the necessary support and innovation (Chen et al., 2023).\n'
                'Privacy and Data Security: Protecting user data is critical, especially when the app collects location information or personal observations. Implementing robust data security measures and transparent privacy policies can address these concerns (Lee & Kim, 2021).',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Conclusions',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
               SizedBox(height: 10),
              Text(
                'The development of a mobile app for grass identification in the Poaceae family represents a fusion of botanical science and modern technology. By providing a comprehensive, user-friendly, and technologically advanced tool, such an app can facilitate accurate grass identification, support ecological research, and enhance educational outreach. Continuous collaboration with botanical experts, technological innovators, and the user community will be key to the app\'s success and sustainability.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: Image.asset(
                  'assets/leaf.png',
                  height: 200,
                ),
              ),
              SizedBox(height: 30),
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
}
