import 'package:aql_app/core_components/constants/dx_colors.dart';
import 'package:aql_app/screens/appbar.dart';
import 'package:aql_app/screens/homepage/widgets/test_cntr.dart';
import 'package:flutter/material.dart';

class RecentTests extends StatefulWidget {
  RecentTests({super.key});
  final List<Map<String, dynamic>> testData = [
    {'colr': DxColors.circlgreen, 'txt': '80', 'percent': '0.8'},
    {'colr': DxColors.red, 'txt': '40', 'percent': '0.4'},
  ];

  @override
  State<RecentTests> createState() => _RecentTestsState();
}

class _RecentTestsState extends State<RecentTests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DxColors.bgclr,
      body: Column(
        children: [
          TheAppBr(text: 'Recent Tests'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: widget.testData.length,
                itemBuilder: (context, index) {
                  final item = widget.testData[index];
                  return TestCntr(
                    colr: item['colr'],
                    txt: item['txt'],
                    percent: item['percent'],
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
