import 'package:aql_app/constants/app_images.dart';
import 'package:aql_app/constants/dx_icons.dart';
import 'package:aql_app/constants/global_variables.dart';
import 'package:aql_app/core_components/constants/dx_colors.dart';
import 'package:aql_app/core_components/dx_icon.dart';
import 'package:aql_app/core_components/dx_text.dart';
import 'package:aql_app/screens/homepage/recent_tests.dart';
import 'package:aql_app/screens/homepage/widgets/drpdown.dart';
import 'package:aql_app/screens/homepage/widgets/stream_wdgt.dart';
import 'package:aql_app/screens/homepage/widgets/test_cntr.dart';
import 'package:flutter/material.dart';

class Homepge extends StatelessWidget {
  Homepge({super.key});

  final List<Map<String, dynamic>> iconTextData = [
    {
      'icns': DxIcons.cap,
      'text': 'Stream',
      'dropdownItems': ['Item 1'],
    },
    {
      'icns': DxIcons.book,
      'text': 'Settings',
      'dropdownItems': ['Item 1'],
    },
    {
      'icns': DxIcons.bookmark,
      'text': 'Chapter',
      'dropdownItems': ['Item 1'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 450,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 210,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 225, 198),
                    image: DecorationImage(
                      image: AssetImage(AppImages.laptop),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100, left: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 52,
                          width: 52,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: DxColors.white, width: 2),
                          ),
                          child: const CircleAvatar(
                            backgroundImage: AssetImage(AppImages.avatar),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DxText(
                              text: 'Welcome Back',
                              type: DxTextType.p1,
                              color: DxColors.white,
                            ),
                            DxText(
                              text: name,
                              type: DxTextType.h4,
                              color: DxColors.white,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 28, top: 8),
                              child: Image.asset(
                                DxIcons.notifs,
                                height: 40,
                                width: 40,
                              ),
                            ),
                            Positioned(
                              right: 28,
                              top: 8,
                              child: Container(
                                height: 15,
                                width: 19,
                                decoration: BoxDecoration(
                                  color: DxColors.notifsred,
                                  borderRadius: BorderRadius.circular(3.22),
                                ),
                                child: const Center(
                                  child: Text(
                                    '3+',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 180,
                  left: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ],
                      color: DxColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...iconTextData.map(
                          (item) => Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: IconTextDropdownRow(
                              svgPath: item['icns']!,
                              text: item['text']!,
                              dropdownItems: List<String>.from(
                                item['dropdownItems'],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: SizedBox(
                            height: 42,
                            width: 220,
                            child: TextButton(
                              onPressed: () {
                                // Handle button tap
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: DxColors.skip,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.content_paste,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Quick test',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DxText(
                    text: 'Recent Tests',
                    type: DxTextType.h7,
                    color: DxColors.black,
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecentTests()),
                    );
                  },
                  child: DxText(
                    text: 'See More',
                    type: DxTextType.p2,
                    color: DxColors.skip,
                  ),
                ),
              ],
            ),
          ),
          TestCntr(colr: DxColors.circlgreen, txt: '80', percent: "0.8"),
          TestCntr(colr: DxColors.red, txt: '40', percent: "0.4"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DxText(text: 'My Streams', type: DxTextType.h7),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: DxColors.greencntr,
                borderRadius: BorderRadius.circular(16),
              ),
              width: double.infinity,
              height: 96,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      height: 72,
                      width: 72,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: DxColors.navgrey.withOpacity(.20),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(AppImages.india),
                    ),
                    SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DxText(text: 'UPSC CSE', type: DxTextType.h6),
                        DxText(
                          text: '6 Subjects | 84 Chapters',
                          type: DxTextType.p3,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: DxColors.circlgreen.withOpacity(0.10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: DxIcon(DxIcons.verify),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                DxText(text: 'All Streams', type: DxTextType.h7),
                Spacer(),
                DxText(
                  text: 'See More',
                  type: DxTextType.p2,
                  color: DxColors.stateInformation,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return StreamWidget(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
