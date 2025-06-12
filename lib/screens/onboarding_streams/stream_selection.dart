import 'package:aql_app/constants/app_images.dart';
import 'package:aql_app/core_components/constants/dx_colors.dart';
import 'package:aql_app/core_components/dx_text.dart';
import 'package:aql_app/nav.dart';
import 'package:aql_app/screens/onboarding_streams/widget/search.dart';
import 'package:aql_app/screens/onboarding_streams/widget/streamcard.dart';
import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  final List<Map<String, dynamic>> streams = [
    {
      "title": "UPSC CSE",
      "image": AppImages.india,
      "color": DxColors.pastelgreen,
    },
    {"title": "NEET", "image": AppImages.neet, "color": DxColors.pastelpink},
    {"title": "JEE", "image": AppImages.jee, "color": DxColors.pastelgreen},
    {"title": "CAT", "image": AppImages.cat, "color": DxColors.pastelbluue},
    {"title": "GATE", "image": AppImages.gate, "color": DxColors.pastelbluue},
    {"title": "JEE", "image": AppImages.jee, "color": DxColors.pastelpink},
    {"title": "CAT", "image": AppImages.cat, "color": DxColors.pastelblue},
    {"title": "JEE", "image": AppImages.jee, "color": DxColors.pastelgreen},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DxColors.white,
      appBar: AppBar(
        backgroundColor: DxColors.white,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DxText(
              text: 'Streams',
              type: DxTextType.h2,
              fontWeight: FontWeight.w700,
            ),
            DxText(
              text: 'Please select streams to enroll',
              type: DxTextType.p2,
              color: DxColors.grey,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 67,
              height: 34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: DxColors.skip),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BottomNav()),
                    );
                  },
                  child: Center(
                    child: DxText(
                      text: 'Skip',
                      type: DxTextType.p2,
                      color: DxColors.skip,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SearchCustom(),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.3,
              padding: const EdgeInsets.all(13.0),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children:
                  streams.map((stream) {
                    return StreamCard(
                      title: stream["title"],
                      imageurl: stream["image"],
                      colorstream: stream["color"],
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
