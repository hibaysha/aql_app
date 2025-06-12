import 'package:aql_app/constants/dx_icons.dart';
import 'package:aql_app/core_components/constants/dx_colors.dart';
import 'package:aql_app/core_components/dx_icon.dart';
import 'package:aql_app/core_components/dx_text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TestCntr extends StatelessWidget {
  final Color? colr;
  final String? txt;
  final String? percent;
  const TestCntr({super.key, this.colr, this.txt, this.percent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: DxColors.iconDisplayContainerColor),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Chemistry'),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8,
                              ),
                              child: Text('|'),
                            ),
                            Text('Chapter 01'),
                          ],
                        ),
                        Text(
                          'Aldehydes, Ketones and \ncarboxylic Acid',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(children: [Container(color: DxColors.neutral300)]),
                      ],
                    ),
                  ),
                  //retake container
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: DxColors.skip),
                        color: DxColors.skipcontnr,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 11,
                          right: 11,
                          top: 8,
                          bottom: 8,
                        ),
                        child: Text(
                          'Retake Test',
                          style: TextStyle(
                            color: DxColors.skip,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: DxColors.neutral200,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: DxIcon(DxIcons.tick, size: 15),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DxText(
                      '',
                      text: '18/32',
                      type: DxTextType.p2,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    DxText(
                      '',
                      text: 'Mark Scored',
                      type: DxTextType.p2,
                      color: DxColors.grey,
                      fontSize: 14,
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          color: DxColors.neutral200,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: DxIcon(DxIcons.timer, size: 20),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DxText(
                          '',
                          text: '12:30',
                          type: DxTextType.p2,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        DxText(
                          '',
                          text: 'Time Taken',
                          type: DxTextType.p2,
                          color: DxColors.grey,
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularPercentIndicator(
                    radius: 30.0,
                    lineWidth: 6.0,
                    percent: double.parse(percent ?? "0"),
                    progressColor: colr,
                    backgroundColor: DxColors.neutral200,
                    circularStrokeCap: CircularStrokeCap.round,

                    center: Text(
                      "$txt%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
