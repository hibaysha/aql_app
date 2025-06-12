import 'package:aql_app/constants/app_images.dart';
import 'package:aql_app/constants/dx_icons.dart';
import 'package:aql_app/core_components/constants/dx_colors.dart';
import 'package:aql_app/core_components/dx_text.dart';
import 'package:aql_app/screens/appbar.dart';
import 'package:aql_app/screens/onboarding_streams/widget/search.dart';
import 'package:aql_app/screens/stream/widgets/stream_containers.dart';
import 'package:flutter/material.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            TheAppBr(text: 'Streams'),

            SearchCustom(),

            const SizedBox(height: 20),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: DxColors.greyborder.withOpacity(0.9),
                  ),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: DxColors.skip,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  onTap: (index) {
                    setState(() {
                      _selectedTabIndex = index;
                    });
                  },
                  tabs: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Tab(
                        child: DxText(
                          'All Streams',
                          type: DxTextType.p2,
                          color:
                              _selectedTabIndex == 0
                                  ? Colors.white
                                  : Colors.black,
                          text: '',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Tab(
                        child: DxText(
                          'My Streams',
                          type: DxTextType.p2,
                          color:
                              _selectedTabIndex == 1
                                  ? Colors.white
                                  : Colors.black,
                          text: '',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: TabBarView(
                children: [_buildAllStreamsTab(), _buildMyStreamsTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllStreamsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          StreamContainer(
            title: 'UPSC CSE',
            subtitle: '6 Subjects | 84 Chapters',
            image: AppImages.india,
            color: DxColors.greencontainer,
            svgicon: DxIcons.tick,
            circleclr: DxColors.circlgreen.withOpacity(.2),
          ),
          const SizedBox(height: 15),
          StreamContainer(
            title: 'NEET',
            subtitle: '6 Subjects | 84 Chapters',
            image: AppImages.india,
            color: DxColors.ylwcontainer,
            svgicon: DxIcons.crown,
            circleclr: DxColors.circleicon.withOpacity(.2),
          ),
          const SizedBox(height: 15),
          StreamContainer(
            title: 'NEET',
            subtitle: '6 Subjects | 84 Chapters',
            image: AppImages.india,
            color: DxColors.ylwcontainer,
            svgicon: DxIcons.crown,
            circleclr: DxColors.circleicon.withOpacity(.2),
          ),
          const SizedBox(height: 15),
          StreamContainer(
            title: 'UPSC CSE',
            subtitle: '6 Subjects | 84 Chapters',
            image: AppImages.neet,
            color: DxColors.ylwcontainer,
            svgicon: DxIcons.crown,
            circleclr: DxColors.circleicon.withOpacity(.2),
          ),
          const SizedBox(height: 15),
          StreamContainer(
            title: 'NEET',
            subtitle: '6 Subjects | 84 Chapters',
            image: AppImages.india,
            color: DxColors.ylwcontainer,
            svgicon: DxIcons.crown,
            circleclr: DxColors.circleicon.withOpacity(.2),
          ),
          const SizedBox(height: 15),
          StreamContainer(
            title: 'NEET',
            subtitle: '6 Subjects | 84 Chapters',
            image: AppImages.india,
            color: DxColors.ylwcontainer,
            svgicon: DxIcons.crown,
            circleclr: DxColors.circleicon.withOpacity(.2),
          ),
        ],
      ),
    );
  }

  Widget _buildMyStreamsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Example user's stream containers
          StreamContainer(
            title: 'UPSC CSE',
            subtitle: '6 Subjects | 84 Chapters',
            image: AppImages.india,
            color: DxColors.greencontainer,
            svgicon: DxIcons.tick,
            circleclr: DxColors.circlgreen.withOpacity(.2),
          ),
          const SizedBox(height: 15),
          StreamContainer(
            title: 'UPSC CSE',
            subtitle: '6 Subjects | 84 Chapters',
            image: AppImages.india,
            color: DxColors.greencontainer,
            svgicon: DxIcons.tick,
            circleclr: DxColors.circlgreen.withOpacity(.2),
          ),
        ],
      ),
    );
  }
}
