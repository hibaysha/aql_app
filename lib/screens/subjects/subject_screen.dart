import 'package:aql_app/constants/app_images.dart';
import 'package:aql_app/core_components/constants/dx_colors.dart';
import 'package:aql_app/screens/appbar.dart';
import 'package:aql_app/screens/onboarding_streams/widget/search.dart';
import 'package:aql_app/screens/subjects/widgets/subject_container.dart';
import 'package:flutter/material.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key});

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
      ],
    );
  }
}
