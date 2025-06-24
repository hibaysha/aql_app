import 'package:aql_app/constants/app_images.dart';
import 'package:aql_app/core_components/constants/dx_colors.dart';
import 'package:aql_app/core_components/dx_text.dart';
import 'package:aql_app/nav.dart';
import 'package:aql_app/providers/streams_provider.dart';
import 'package:aql_app/screens/onboarding_streams/widget/search.dart';
import 'package:aql_app/screens/onboarding_streams/widget/streamcard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class SelectStream extends StatefulWidget {
  const SelectStream({super.key});

  @override
  State<SelectStream> createState() => _SelectStreamState();
}

class _SelectStreamState extends State<SelectStream> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<StreamsProvider>(
        context,
        listen: false,
      ).fetchStreamData(context);
    });
  }

  String getStreamImageUrl(String? logo) {
    if (logo == null || logo.isEmpty) {
      return '';
    }
    return 'https://event-manager.syd1.cdn.digitaloceanspaces.com/$logo';
  }

  String getFallbackImage(String title) {
    switch (title.toLowerCase()) {
      case 'upsc cse':
      case 'internalpurpose':
        return AppImages.india;
      default:
        return AppImages.india;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DxColors.white,
      appBar: AppBar(
        backgroundColor: DxColors.white,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DxText(
              text: 'Streams',
              type: DxTextType.h2,
              fontWeight: FontWeight.w700,
            ),
            DxText(
              text: 'Please select streams to enroll',
              type: DxTextType.p2,
              color: DxColors.grey,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 67,
              height: 34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: DxColors.skip),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BottomNav()),
                    );
                  },
                  child: Center(
                    child: DxText(
                      text: 'Skip',
                      type: DxTextType.p2,
                      color: DxColors.skip,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Consumer<StreamsProvider>(
        builder: (context, provider, _) {
          if (provider.isStreamLoading) {
            return Column(
              children: [
                SearchCustom(),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.3,
                    padding: const EdgeInsets.all(13.0),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: List.generate(6, (index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                height: 14,
                                width: 80,
                                color: Colors.grey[300],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            );
          }

          if (provider.streamResponse == null ||
              provider.streamResponse?.response == null) {
            return const Center(child: Text('No streams available'));
          }

          final streams = provider.streamResponse?.response;
          if (streams == null || streams.isEmpty) {
            return const Center(child: Text('No streams available'));
          }

          return Column(
            children: [
              SearchCustom(),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  padding: const EdgeInsets.all(13.0),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children:
                      streams.map((stream) {
                        final networkImageUrl = getStreamImageUrl(stream.logo);
                        final fallbackImageUrl = getFallbackImage(stream.title);
                        return StreamCard(
                          title: stream.title,
                          imageurl:
                              networkImageUrl.isNotEmpty
                                  ? networkImageUrl
                                  : fallbackImageUrl,
                          colorstream:
                              stream.isPaid
                                  ? DxColors.pastelgreen
                                  : DxColors.pastelpink,
                        );
                      }).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
