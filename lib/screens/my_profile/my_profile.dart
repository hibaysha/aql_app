import 'dart:io';

import 'package:aql_app/constants/app_images.dart';
import 'package:aql_app/constants/dx_icons.dart';
import 'package:aql_app/constants/global_variables.dart';
import 'package:aql_app/core_components/constants/dx_colors.dart';
import 'package:aql_app/core_components/constants/dx_text_styles.dart';
import 'package:aql_app/core_components/dx_text.dart';
import 'package:aql_app/providers/signin_provider.dart';
import 'package:aql_app/splash.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final provider = Provider.of<SignInProvider>(context, listen: false);
      provider.loadFromPrefs();
    });
  }

  void _showSignOutDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Text(
                'Sign Out',
                style: DxTextStyles.primaryFont600(18, DxColors.neutral900),
              ),
            ],
          ),
          content: Text(
            'Do you want to sign out?',
            style: DxTextStyles.primaryFont400(16, DxColors.neutral700),
          ),
          actions: [
            // Stay button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Stay',
                style: DxTextStyles.primaryFont500(16, DxColors.neutral600),
              ),
            ),

            // Sign out button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Provider.of<SignInProvider>(context, listen: false).signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Sign Out',
                style: DxTextStyles.primaryFont500(16, Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignInProvider>(
      builder: (context, provider, _) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          color: DxColors.bgclr,
          child: Column(
            children: [
              Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  image: DecorationImage(
                    image: AssetImage(AppImages.laptop),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  children: [
                    // Container(
                    //   height: 52,
                    //   width: 52,
                    //   padding: const EdgeInsets.all(4),
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     border: Border.all(color: DxColors.white, width: 2),
                    //   ),
                    //   child: const CircleAvatar(
                    //     backgroundImage: AssetImage(AppImages.avatar),
                    //   ),
                    // ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DxText(
                                text: name,
                                type: DxTextType.h4,
                                color: DxColors.white,
                              ),
                              DxText(
                                text: email,
                                type: DxTextType.p2,
                                color: DxColors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: _showSignOutDialog, // Show confirmation dialog
                  child: Container(
                    height: 52,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: DxColors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 12),
                        SvgPicture.asset(DxIcons.signout),
                        const SizedBox(width: 12),
                        Text(
                          'Sign Out',
                          style: DxTextStyles.primaryFont500(
                            16,
                            DxColors.neutral900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
