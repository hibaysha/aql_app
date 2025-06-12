import 'package:aql_app/core_components/constants/dx_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aql_app/core_components/constants/dx_text_styles.dart';

class StreamCard extends StatelessWidget {
  final String title;
  final String imageurl;
  final Color colorstream;

  const StreamCard({
    super.key,
    required this.title,
    required this.imageurl,
    required this.colorstream,
  });

  bool _isSvg(String path) => path.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180, // Increased height for more room
      decoration: BoxDecoration(
        color: colorstream,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: DxColors.greyctnrbrdr),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
            ), // More top & bottom space
            child:
                _isSvg(imageurl)
                    ? SvgPicture.asset(
                      imageurl,
                      height: 60,
                      width: 60,
                      fit: BoxFit.contain,
                    )
                    : Image.asset(
                      imageurl,
                      height: 60,
                      width: 60,
                      fit: BoxFit.contain,
                    ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: DxTextStyles.primaryFont500(
                12,
                Colors.black,
              ), // Compact text
            ),
          ),
        ],
      ),
    );
  }
}
