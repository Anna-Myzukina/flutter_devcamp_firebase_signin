import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase_signin/mentors_details.dart';
import 'package:flutter_devcamp_firebase_signin/mentors_models.dart';

class FlutterDevCamp2024UI extends StatefulWidget {
  const FlutterDevCamp2024UI({super.key});

  @override
  State<FlutterDevCamp2024UI> createState() => _FlutterDevCamp2024UIState();
}

class _FlutterDevCamp2024UIState extends State<FlutterDevCamp2024UI> {
  bool isTopicsVisible = false;


  final List<MentorsModel> mentorModel = [
    MentorsModel('assets/images/simon.jpeg', 'Simon',
        'https://www.linkedin.com/in/simonlightfoot/'),
    MentorsModel('assets/images/franklin.jpeg', 'Franklin',
        'https://www.linkedin.com/in/franklin-oladipo/'),
    MentorsModel('assets/images/nishtha.jpeg', 'Nishtha',
        'https://www.linkedin.com/in/nishtha-saraswat/'),
    MentorsModel('assets/images/renuka.jpeg', 'Renuka',
        'https://www.linkedin.com/in/renukakelkar/'),
    MentorsModel('assets/images/shree.jpeg', 'Shree',
        'https://www.linkedin.com/in/shrihriday/'),
    MentorsModel('assets/images/sumith.jpeg', 'Sumith',
        'https://www.linkedin.com/in/sumith-damodaran/'),
    MentorsModel('assets/images/yeasin.jpeg', 'Yeasin',
        'https://www.linkedin.com/in/mdyeasinsheikh/'),
    MentorsModel('assets/images/anthony.jpeg', 'Anthony',
        'https://www.linkedin.com/in/atuoha-anthony/'),
  ];

  final List<Widget> topics = [
    const Text('Introduction to flutter'),
    const Text('Flutter Basics and Layout'),
    const Text('Intro to state management Riverpod with API'),
    const Text('Riverpod with Firebase'),
    const Text('Flutter and API Integration'),
    const Text('Flutter with Firebase database , storage'),
    const Text('Riverpod With advance Concepts'),
  ];

  bool _isTopicsVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Flutter DevCamp',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            const Text(
              'Welcome to Flutter DevCamp',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Image(image: AssetImage('assets/images/devcamp_img.jpeg')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(
                      _isTopicsVisible ? Colors.green : Colors.blue),
                  shape: WidgetStatePropertyAll<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)))),
              onPressed: () {
                setState(() {
                  _isTopicsVisible = !_isTopicsVisible;
                });
              },
              child: Text(
                _isTopicsVisible
                    ? 'hide topics'.toUpperCase()
                    : 'click me'.toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
              flex: _isTopicsVisible ? 1 : 0,
              child: Visibility(
                visible: _isTopicsVisible,
                child: Container(
                  color: Colors.red,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: topics.length,
                      itemBuilder: (context, index) {
                        return Text('${index + 1}. ${topics[index]}');
                      }),
                ),
              ),
            ),
            const Text(
              'Mentors List',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  //shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: topics.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 120,
                      width: 100,
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => MentorsDetails(
                                  mentorsModel: mentorModel[index],
                                ))
                              );
                            },
                            child: SizedBox(
                              height: 120,
                              width: 100,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            AssetImage(mentorModel[index].img),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(mentorModel[index].name)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset(
                                    'assets/images/flutter_logo.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Text('Write your feedback'),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.check_circle_sharp,
                  color: Colors.blue,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  label: const Text('Write your feedback'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
            )
          ],
        ),
      ),
    );
  }
}