import 'package:aql_app/constants/dx_icons.dart';
import 'package:aql_app/core_components/constants/dx_colors.dart';
import 'package:aql_app/core_components/dx_text.dart';
import 'package:aql_app/providers/streams_provider.dart';
import 'package:aql_app/screens/appbar.dart';
import 'package:aql_app/screens/onboarding_streams/widget/search.dart';
import 'package:aql_app/screens/stream/widgets/stream_containers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  int _selectedTabIndex = 0;

  @override
  void initState() {
    debugPrint("inital function worked");
    Provider.of<StreamsProvider>(
      context,
      listen: false,
    ).fetchStreamData(context);
    super.initState();
  }

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
            const SizedBox(height: 16),
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
                          text: 'All Streams',
                          type: DxTextType.p2,
                          color:
                              _selectedTabIndex == 0
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Tab(
                        child: DxText(
                          text: 'My Streams',
                          type: DxTextType.p2,
                          color:
                              _selectedTabIndex == 1
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
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
    return Consumer<StreamsProvider>(
      builder: (context, provider, _) {
        if (provider.isStreamLoading) {
          return _buildShimmerList();
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: provider.streamResponse!.response.length,
          itemBuilder: (context, index) {
            final stream = provider.streamResponse!.response[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: StreamContainer(
                title: stream.title,
                subtitle:
                    '${stream.subjectCount} Subjects | ${stream.topicCount} Chapters',
                image: getStreamImageUrl(stream.logo),
                color:
                    stream.isPaid == true
                        ? DxColors.greencontainer
                        : DxColors.ylwcontainer,
                svgicon: stream.isPaid == true ? DxIcons.tick : DxIcons.crown,
                circleclr:
                    stream.isPaid == true
                        ? DxColors.circlgreen.withOpacity(.2)
                        : DxColors.circleicon.withOpacity(.2),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildMyStreamsTab() {
    return Consumer<StreamsProvider>(
      builder: (context, provider, _) {
        if (provider.isStreamLoading) {
          return _buildShimmerList();
        }

        final myStreams =
            provider.streamResponse!.response
                .where((stream) => stream.isPaid)
                .toList();

        if (myStreams.isEmpty) {
          return const Center(child: Text('No enrolled streams'));
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: myStreams.length,
          itemBuilder: (context, index) {
            final stream = myStreams[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: StreamContainer(
                title: stream.title,
                subtitle:
                    '${stream.subjectCount} Subjects | ${stream.topicCount} Chapters',
                image: getStreamImageUrl(stream.logo),
                color: DxColors.greencontainer,
                svgicon: DxIcons.tick,
                circleclr: DxColors.circlgreen.withOpacity(.2),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildShimmerList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: DxColors.greyborder),
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 14,
                          width: 120,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 10,
                          width: 180,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String getStreamImageUrl(String? logo) {
    if (logo == null || logo.isEmpty) return '';
    return 'https://event-manager.syd1.cdn.digitaloceanspaces.com/$logo';
  }
}
