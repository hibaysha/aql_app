import 'package:aql_app/core_components/constants/dx_colors.dart';
import 'package:aql_app/providers/examresults_provider.dart';
import 'package:aql_app/screens/appbar.dart';
import 'package:aql_app/screens/homepage/widgets/test_cntr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentTests extends StatefulWidget {
  RecentTests({super.key});

  @override
  State<RecentTests> createState() => _RecentTestsState();
}

class _RecentTestsState extends State<RecentTests> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ExamResultProvider>(context, listen: false).fetchExamResult();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DxColors.bgclr1,
      body: Column(
        children: [
          TheAppBr(text: 'Recent Tests'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<ExamResultProvider>(
                builder: (context, provider, _) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (provider.error != null) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            style: TextStyle(
                              fontSize: 14,
                              color: DxColors.grey,
                            ),
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
                    );
                  } else if (provider.examResult == null ||
                      provider.examResult!.response.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'No test results available',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: DxColors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Take your first test to see results here',
                            style: TextStyle(
                              fontSize: 14,
                              color: DxColors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  final responses = provider.examResult!.response;

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount:
                        responses.length, // Show all results, not just first 5
                    itemBuilder: (context, index) {
                      final response = responses[index];

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
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
