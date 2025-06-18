import 'package:aql_app/core_components/constants/dx_colors.dart';
import 'package:flutter/material.dart';
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

  bool _isNetworkUrl(String path) =>
      path.startsWith('http://') || path.startsWith('https://');

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
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: _buildImage(),
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

  Widget _buildImage() {
    if (_isNetworkUrl(imageurl)) {
      // Network image
      return Image.network(
        imageurl,
        height: 60,
        width: 60,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: CircularProgressIndicator(
                value:
                    loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                strokeWidth: 2,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.broken_image, color: Colors.grey),
          );
        },
      );
    } else {
      // Local asset image
      return Image.asset(imageurl, height: 60, width: 60, fit: BoxFit.contain);
    }
  }
}
