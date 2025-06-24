import 'dart:io';

import 'package:aql_app/constants/app_images.dart';
import 'package:aql_app/constants/dx_icons.dart';
import 'package:aql_app/constants/global_variables.dart';
import 'package:aql_app/core_components/constants/dx_colors.dart';
import 'package:aql_app/core_components/dx_icon.dart';
import 'package:aql_app/core_components/dx_text.dart';
import 'package:aql_app/providers/examresults_provider.dart';
import 'package:aql_app/screens/homepage/recent_tests.dart';
import 'package:aql_app/screens/homepage/widgets/drpdown.dart';
import 'package:aql_app/screens/homepage/widgets/stream_wdgt.dart';
import 'package:aql_app/screens/homepage/widgets/test_cntr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:image_picker/image_picker.dart';

class Homepge extends StatefulWidget {
  const Homepge({super.key});

  @override
  State<Homepge> createState() => _HomepgeState();
}

class _HomepgeState extends State<Homepge> {
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

  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ExamResultProvider>(context, listen: false).fetchExamResult();
    });
  }

  Future<void> _showImageSourceDialog() async {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Wrap(
              children: [
                ListTile(
                  leading: Icon(Icons.photo_library, color: DxColors.greencndr),
                  title: Text('Gallery'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt, color: DxColors.greencndr),
                  title: Text('Camera'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
                if (_selectedImage != null)
                  ListTile(
                    leading: Icon(Icons.delete, color: Colors.red),
                    title: Text('Remove Photo'),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        _selectedImage = null;
                      });
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: 300,
        maxHeight: 300,
        imageQuality: 80,
      );

      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
      }
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error picking image: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // shimmer widget for test container loading
  Widget _buildTestContainerShimmer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Circle shimmer
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 16),
                // Text content shimmer
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 150,
                        height: 14,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 100,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
                // Right side shimmer
                Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 420,
            child: Stack(
              children: [
                //appbar container
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
                        // Modified Avatar with Image Picker
                        GestureDetector(
                          onTap: _showImageSourceDialog,
                          child: Container(
                            height: 52,
                            width: 52,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: DxColors.white,
                                width: 2,
                              ),
                            ),
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      _selectedImage != null
                                          ? FileImage(_selectedImage!)
                                          : const AssetImage(AppImages.avatar)
                                              as ImageProvider,
                                ),
                                // Small camera icon overlay
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 16,
                                    width: 16,
                                    decoration: BoxDecoration(
                                      color: DxColors.greencndr,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                //dropdown
                Positioned(
                  top: 180,
                  left: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 23,
                      right: 22,
                      top: 8,
                      bottom: 8,
                    ),
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
                            //widget
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
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: DxColors.greencndr,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.content_paste,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 8),
                                  DxText(
                                    text: 'Quick test',
                                    type: DxTextType.h7,
                                    fontWeight: FontWeight.w600,
                                    color: DxColors.white,
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
          //headings
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
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

          //exam results container
          Consumer<ExamResultProvider>(
            builder: (context, provider, _) {
              if (provider.isLoading) {
                return Column(
                  children: List.generate(
                    2,
                    (index) => _buildTestContainerShimmer(),
                  ),
                );
              } else if (provider.error != null) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          'Error loading test results',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: DxColors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${provider.error}',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: DxColors.grey),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => provider.fetchExamResult(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: DxColors.skip,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (provider.examResult == null ||
                  provider.examResult!.response.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        Text(
                          'No test results available',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: DxColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              final responses = provider.examResult!.response;

              return Column(
                children:
                    // to show how many cntainers
                    responses.take(2).map((response) {
                      // Calculate percentage correctly
                      double percentage = 0.0;
                      if (response.totalQuestions! > 0) {
                        percentage =
                            response.marksObtained! / response.totalScore!;
                      }

                      // Determine color based on percentage
                      Color circleColor = DxColors.red;
                      if (percentage >= 0.8) {
                        circleColor = DxColors.circlgreen;
                      } else if (percentage >= 0.6) {
                        circleColor = Colors.orange;
                      }

                      String formatDuration(int minutes) {
                        final hours = minutes ~/ 60;
                        final mins = minutes % 60;
                        if (hours > 0) {
                          return '${hours}h ${mins}m';
                        }
                        return '${mins}m';
                      }

                      //////////////////container
                      return TestCntr(
                        colr: circleColor,
                        txt: response.marksObtained.toString(),
                        percent: percentage.toStringAsFixed(2),
                        subject:
                            response.topic?.subject?.name
                                .toString()
                                .split('.')
                                .last,
                        chapter:
                            'Chapter ${response.topic?.chapterNo.toString().padLeft(2, '0')}',
                        topicName: response.topic?.title,
                        score: response.marksObtained.toString(),
                        totalMarks: response.totalScore.toString(),
                        timeTaken: formatDuration(response.duration!),
                      );
                    }).toList(),
              );
            },
          ),
          //heading
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 8,
              bottom: 8,
            ),
            child: DxText(text: 'My Streams', type: DxTextType.h7),
          ),
          //my stream container
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
          //heading
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 8,
              bottom: 8,
            ),
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
          //all stream cntnrs
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
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
