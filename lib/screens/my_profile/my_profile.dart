import 'package:aql_app/constants/app_images.dart';
import 'package:aql_app/constants/dx_icons.dart';
import 'package:aql_app/constants/global_variables.dart';
import 'package:aql_app/core_components/constants/dx_colors.dart';
import 'package:aql_app/core_components/constants/dx_text_styles.dart';
import 'package:aql_app/core_components/dx_text.dart';
import 'package:aql_app/providers/signin_provider.dart';
import 'package:aql_app/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final provider = Provider.of<SignInProvider>(context, listen: false);
      provider.loadFromPrefs();
    });
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
                child: Column(
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
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<SignInProvider>(
                      context,
                      listen: false,
                    ).signOut();
                  },
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
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Signin()),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Sign Out',
                            style: DxTextStyles.primaryFont500(
                              16,
                              DxColors.neutral900,
                            ),
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
//  onPressed: () {
//                             Provider.of<SignInProvider>(
//                               context,
//                               listen: false,
//                             ).signOut();
//                           },