import 'package:aql_app/core_components/constants/dx_colors.dart';
import 'package:aql_app/core_components/dx_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StreamContainer extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? image;
  final Color? color;
  final Color? circleclr;
  final String? svgicon;
  final VoidCallback? onTap;

  const StreamContainer({
    super.key,
    this.title,
    this.subtitle,
    this.image,
    this.onTap,
    this.color,
    this.svgicon,
    this.circleclr,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: DxColors.greyborder),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(image!),
                ),
              ),
              const SizedBox(width: 12),
              // Stream info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DxText(title ?? '', text: title ?? '', type: DxTextType.h4),
                    const SizedBox(height: 4),
                    DxText(
                      subtitle ?? '',
                      text: subtitle ?? '',
                      type: DxTextType.p3,
                      color: DxColors.subtextclr,
                    ),
                  ],
                ),
              ),
              if (svgicon != null)
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: circleclr,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(svgicon!),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
