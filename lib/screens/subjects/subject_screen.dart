import 'package:aql_app/constants/app_images.dart';
import 'package:aql_app/core_components/constants/dx_colors.dart';
import 'package:aql_app/core_components/dx_text.dart';
import 'package:aql_app/screens/appbar.dart';
import 'package:aql_app/screens/notifs/noti_service.dart';
import 'package:aql_app/screens/onboarding_streams/widget/search.dart';
import 'package:aql_app/screens/subjects/widgets/subject_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TheAppBr(text: 'Subjects'),
        const SearchCustom(),
        SubjectContainer(
          color: DxColors.pblu,
          text: 'Biology',
          image: AppImages.bdna,
        ),
        SubjectContainer(
          color: DxColors.pgreen,
          text: 'Chemistry',
          image: AppImages.gtube,
        ),
        SubjectContainer(
          color: DxColors.porange,
          text: 'Physics',
          image: AppImages.ydna,
        ),
        SubjectContainer(
          color: DxColors.pgreen,
          text: 'Chemistry',
          image: AppImages.btube,
        ),
        SubjectContainer(
          color: DxColors.ppink,
          text: 'English',
          image: AppImages.rdna,
        ),
        SubjectContainer(
          color: DxColors.pblu,
          text: 'Maths',
          image: AppImages.vtube,
        ),
        Container(
          decoration: BoxDecoration(
            color: DxColors.skip,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextButton(
            onPressed: () {
              NotiService().showNotification(title: "Title", body: 'hellooooo');
            },
            style: TextButton.styleFrom(padding: const EdgeInsets.all(8.0)),
            child: DxText(
              text: 'notifs',
              color: DxColors.black,
              type: DxTextType.h6,
            ),
          ),
        ),
      ],
    );
  }
}
