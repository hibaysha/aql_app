import 'package:aql_app/constants/app_images.dart';
import 'package:aql_app/constants/dx_icons.dart';
import 'package:aql_app/core_components/constants/dx_colors.dart';
import 'package:aql_app/core_components/dx_icon.dart';
import 'package:aql_app/core_components/dx_text.dart';
import 'package:flutter/material.dart';

class StreamWidget extends StatelessWidget {
  final int index;
  const StreamWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      //to get padding after last container-- give condition on right.
      padding: EdgeInsets.only(
        left: 20,
        top: 8,
        bottom: 8,
        right: index == 4 ? 20 : 0,
      ),
      child: Container(
        height: 230,
        width: 195,
        decoration: BoxDecoration(
          color: DxColors.streamcntnr,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: 106.75,
                width: 166,
                decoration: BoxDecoration(
                  border: Border.all(color: DxColors.greyborder),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(AppImages.mystream),
                ),
              ),
            ),
            DxText(
              text: 'Plus two Science',
              type: DxTextType.p2,
              color: DxColors.black,
            ),
            DxText(text: '06 Subjects | 84 Chapters', type: DxTextType.p2),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 13.25),
              child: Container(
                height: 33,
                width: 135,
                decoration: BoxDecoration(
                  border: Border.all(color: DxColors.greyborder),
                  borderRadius: BorderRadius.circular(9),
                  color: DxColors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DxIcon(DxIcons.crown),
                    SizedBox(width: 6),
                    DxText(text: 'Subscribe', type: DxTextType.p2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
