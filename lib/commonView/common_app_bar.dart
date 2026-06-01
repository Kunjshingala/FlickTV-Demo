import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/dimensions.dart';
import '../utils/styles.dart';
import 'common_view.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final String titleText;
  final Widget? customTitle;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? surfaceTintColor;
  final bool centerTitle;
  final double? elevation;
  final double? scrolledUnderElevation;
  final double? toolbarHeight;
  final SystemUiOverlayStyle? systemUiOverlayStyle;

  const CommonAppBar({
    super.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.titleText = '',
    this.customTitle,
    this.actions,
    this.backgroundColor,
    this.surfaceTintColor,
    this.centerTitle = true,
    this.elevation = 0,
    this.scrolledUnderElevation = 0,
    this.toolbarHeight,
    this.systemUiOverlayStyle,
  });

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;

    Widget? leadingWidget = leading;
    if (leadingWidget == null && automaticallyImplyLeading && canPop) {
      leadingWidget = Padding(
        padding: EdgeInsetsDirectional.only(start: commonHorizontalSpacing),
        child: GlassedIconContainer(iconData: Icons.chevron_left_rounded),
      );
    }

    return AppBar(
      toolbarHeight: toolbarHeight,
      backgroundColor: backgroundColor,
      elevation: elevation,
      scrolledUnderElevation: scrolledUnderElevation,
      surfaceTintColor: surfaceTintColor,
      automaticallyImplyLeading: false,
      leading: leadingWidget,
      title: customTitle ?? ((titleText.isNotEmpty) ? Text(titleText, style: commonTextStyle()) : SizedBox.shrink()),
      centerTitle: centerTitle,
      actions: actions,
      systemOverlayStyle: systemUiOverlayStyle,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);
}
