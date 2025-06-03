import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'constants/dx_colors.dart';
import '../constants/dx_images.dart';

class DxNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;
  final String? defaultAsset;
  final bool isCircle;
  final Duration? fadeInDuration;
  final Duration? placeholderFadeInDuration;
  final Border? border;

  const DxNetworkImage({
    super.key,
    this.imageUrl,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
    this.defaultAsset,
    this.isCircle = false,
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.placeholderFadeInDuration = const Duration(milliseconds: 500),
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      width: width,
      height: height,
      fit: fit,
      fadeInDuration: fadeInDuration!,
      placeholderFadeInDuration: placeholderFadeInDuration!,
      placeholder: (context, url) => placeholder ?? _buildLoadingWidget(),
      errorWidget: (context, url, error) => errorWidget ?? _buildErrorWidget(),
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          border: border,
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: DxColors.neutral100,
        borderRadius: borderRadius,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        border: border,
      ),
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(DxColors.primary),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        border: border,
        image: defaultAsset != null
            ? DecorationImage(
                image: AssetImage(defaultAsset!),
                fit: fit,
              )
            : null,
      ),
      child: defaultAsset == null
          ? Icon(
              Icons.error_outline,
              size: width * 0.3,
              color: DxColors.stateError,
            )
          : null,
    );
  }
} 