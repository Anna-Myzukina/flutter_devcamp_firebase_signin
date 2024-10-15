import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase_signin/mentors_models.dart';
import 'package:url_launcher/url_launcher.dart';

class MentorsDetails extends StatelessWidget {
  const MentorsDetails({required this.mentorsModel, super.key});

  final MentorsModel mentorsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(
          mentorsModel.name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Image.asset(mentorsModel.img),
          InkWell(
            onTap: () {
              _launchUrl(mentorsModel.url);
            },
            child: Text(
              mentorsModel.name,
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){}),
    );
  }
}

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}