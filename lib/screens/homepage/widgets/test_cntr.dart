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
  final String? subject;
  final String? chapter;
  final String? topicName;
  final String? score;
  final String? totalMarks;
  final String? timeTaken;
  final VoidCallback? onRetakePressed;

  const TestCntr({
    super.key,
    this.colr,
    this.txt,
    this.percent,
    this.subject,
    this.chapter,
    this.topicName,
    this.score,
    this.totalMarks,
    this.timeTaken,
    this.onRetakePressed,
  });

  double _parsePercent(String? percent) {
    if (percent == null || percent.isEmpty) return 0.0;
    try {
      double value = double.parse(percent);
      return value > 1 ? value / 100 : value;
    } catch (e) {
      debugPrint('Error parsing percent: $percent, Error: $e');
      return 0.0;
    }
  }

  String _getDisplayScore() {
    if (score != null && totalMarks != null) {
      return '$score/$totalMarks';
    } else if (txt != null && txt!.isNotEmpty) {
      return txt!;
    }
    return '0/0';
  }

  String _getDisplayPercent() {
    final safePercent = _parsePercent(percent);
    final percentValue = (safePercent * 100).round();
    return '$percentValue%';
  }

  String _getSubjectDisplay() {
    if (subject == null) return 'Chemistry';

    if (subject!.contains('.')) {
      final parts = subject!.split('.');
      final enumValue = parts.last;
      // Convert enum to readable format
      return enumValue
          .toLowerCase()
          .split('_')
          .map(
            (word) => word[0].toUpperCase() + word.substring(1).toLowerCase(),
          )
          .join(' ');
    }

    return subject!;
  }

  String _formatTopicName() {
    if (topicName == null || topicName!.isEmpty) {
      return 'Aldehydes, Ketones and\ncarboxylic Acid';
    }

    if (topicName!.length > 30) {
      final words = topicName!.split(' ');
      if (words.length > 3) {
        final midPoint = words.length ~/ 2;
        final firstLine = words.sublist(0, midPoint).join(' ');
        final secondLine = words.sublist(midPoint).join(' ');
        return '$firstLine\n$secondLine';
      }
    }

    return topicName!;
  }

  @override
  Widget build(BuildContext context) {
    final safePercent = _parsePercent(percent);
    final displayScore = _getDisplayScore();
    final displayPercent = _getDisplayPercent();
    final subjectDisplay = _getSubjectDisplay();
    final formattedTopicName = _formatTopicName();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      child: Container(
        height: 146,
        decoration: BoxDecoration(
          border: Border.all(color: DxColors.iconDisplayContainerColor),
          borderRadius: BorderRadius.circular(13),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row: Subject and Retake
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                top: 14,
                right: 12,
                bottom: 14,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Text Block
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              subjectDisplay,
                              style: const TextStyle(
                                fontSize: 12,
                                color: DxColors.subhead,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.0),
                              child: Text(
                                '|',
                                style: TextStyle(
                                  color: DxColors.subhead,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Text(
                              chapter ?? 'Chapter 01',
                              style: const TextStyle(
                                fontSize: 12,
                                color: DxColors.subhead,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          formattedTopicName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: DxColors.black,
                            height: 1.3,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  // retake test Button
                  GestureDetector(
                    onTap: onRetakePressed,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: DxColors.skip),
                        color: DxColors.skipcontnr,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Text(
                          'Retake Test',
                          style: TextStyle(
                            color: DxColors.skip,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Row: Score, Time, and Circular Progress
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 12.0),
              child: Row(
                children: [
                  // Score Block
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: DxColors.greyiconbg,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: DxIcon(DxIcons.tick, size: 15),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DxText(
                        text: displayScore,
                        type: DxTextType.p2,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      DxText(
                        text: 'Mark Scored',
                        type: DxTextType.p2,
                        color: DxColors.grey,
                        fontSize: 12,
                      ),
                    ],
                  ),

                  const SizedBox(width: 20),

                  // Time Block
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: DxColors.greyiconbg,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: DxIcon(DxIcons.timer, size: 18),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DxText(
                        text: timeTaken ?? '12:30',
                        type: DxTextType.p2,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      DxText(
                        text: 'Time Taken',
                        type: DxTextType.p2,
                        color: DxColors.grey,
                        fontSize: 12,
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Circular Percent Indicator
                  CircularPercentIndicator(
                    radius: 28.0,
                    lineWidth: 5.0,
                    percent: safePercent.clamp(0.0, 1.0),
                    progressColor: colr ?? DxColors.circlgreen,
                    backgroundColor: DxColors.neutral200,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      displayPercent,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                        color: DxColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
