import 'package:flutter/material.dart';

import 'constants/dx_colors.dart';
import 'constants/dx_text_styles.dart';
import '../constants/dx_images.dart';
import '../constants/dx_icons.dart';
import 'dx_network_image.dart';
import 'dx_button.dart';

enum DxAppBarType {
  home, // For home screen with welcome message
  default_, // For other screens with back button
  titleOnly, // For screens with only title, no back button
}

class DxAppBar extends StatelessWidget implements PreferredSizeWidget {
  final DxAppBarType type;
  final String? title;
  final String? userName;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color? backgroundColor;
  final double elevation;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final String? profileImageUrl;
  final VoidCallback? onProfileTap;
  final double? height;

  const DxAppBar({
    super.key,
    this.type = DxAppBarType.default_,
    this.title,
    this.userName,
    this.onBackPressed,
    this.actions,
    this.centerTitle = true,
    this.backgroundColor,
    this.elevation = 0,
    this.leading,
    this.bottom,
    this.profileImageUrl,
    this.onProfileTap,
    this.height,
  });

  @override
  Size get preferredSize => Size.fromHeight(height ?? 56);

  Widget _buildHomeAppBar(BuildContext context) {
    return AppBar(
      surfaceTintColor: DxColors.transparent,
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevation,
      automaticallyImplyLeading: false,
      titleSpacing: 16,
      title: Row(
        children: [
          GestureDetector(
            onTap: onProfileTap,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: DxColors.neutral100,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  (userName != null && userName!.isNotEmpty)
                      ? userName!
                          .substring(0, userName!.length >= 2 ? 2 : 1)
                          .toUpperCase()
                      : 'GU',
                  style: DxTextStyles.primaryFont600(20, DxColors.primary),
                ),
              ),
            ),
            // DxNetworkImage(
            //   imageUrl: profileImageUrl,
            //   width: 48,
            //   height: 48,
            //   isCircle: true,
            //   defaultAsset: DxImages.onboarding1,
            // ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: DxTextStyles.primaryFont400(16, DxColors.white),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        userName ?? 'Guest',
                        maxLines: 1,
                        style: DxTextStyles.primaryFont600(20, DxColors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      ' ! 🤘',
                      style: DxTextStyles.primaryFont600(20, DxColors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        // DxButton(
        //   margin: const EdgeInsets.only(right: 16),
        //   icon: SvgPicture.asset(DxIcons.chat),
        //   variant: DxButtonVariant.iconOnly,
        //   backgroundColor: DxColors.secondary,
        //   onPressed: () {
        //    DxNavigator.push(context, ChatScreen(),style: DxNavigationStyle.cupertino);
        //   },
        // ),
        ...?actions,
      ],
      bottom: bottom,
    );
  }

  Widget _buildDefaultAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      surfaceTintColor: DxColors.transparent,
      elevation: elevation,
      centerTitle: centerTitle,
      leadingWidth: 45 + 16,
      leading: Center(
        child: DxButton(
          height: 45,
          width: 45,
          margin: const EdgeInsets.only(left: 16),
          backgroundColor: DxColors.neutral100,
          icon: const Icon(
            Icons.arrow_back,
            color: DxColors.neutral900,
            size: 22,
          ),
          variant: DxButtonVariant.iconOnly,
          onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
        ),
      ),
      title:
          title != null
              ? Text(
                title!,
                style: DxTextStyles.primaryFont500(20, DxColors.white),
              )
              : null,
      actions: actions,
      bottom: bottom,
    );
  }

  Widget _buildTitleOnlyAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      surfaceTintColor: DxColors.transparent,
      elevation: elevation,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      title:
          title != null
              ? Text(
                title!,
                style: DxTextStyles.primaryFont500(20, DxColors.white),
              )
              : null,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case DxAppBarType.home:
        return _buildHomeAppBar(context);
      case DxAppBarType.default_:
        return _buildDefaultAppBar(context);
      case DxAppBarType.titleOnly:
        return _buildTitleOnlyAppBar(context);
    }
  }
}
