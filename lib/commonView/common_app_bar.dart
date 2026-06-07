import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/sizing.dart';
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
  final double? leadingWidth;
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
    this.leadingWidth,
    this.systemUiOverlayStyle,
  });

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;

    Widget? leadingWidget = leading;
    if (leadingWidget == null && automaticallyImplyLeading && canPop) {
      leadingWidget = GlassedIconContainer(
        margin: EdgeInsetsDirectional.only(start: context.sizing.hSpacing),
        iconData: Icons.chevron_left_rounded,
      );
    }

    final Widget? appBarLeading = leadingWidget == null
        ? null
        : Align(
            alignment: AlignmentDirectional.centerStart,
            child: leadingWidget,
          );

    return AppBar(
      toolbarHeight: toolbarHeight,
      backgroundColor: backgroundColor,
      elevation: elevation,
      scrolledUnderElevation: scrolledUnderElevation,
      surfaceTintColor: surfaceTintColor,
      automaticallyImplyLeading: false,
      leadingWidth: leadingWidget == null ? null : leadingWidth ?? (context.sizing.hSpacing + kToolbarHeight),
      leading: appBarLeading,
      title: customTitle ?? ((titleText.isNotEmpty) ? Text(titleText, style: commonTextStyle(fontSize: context.sizing.avg * 0.0225)) : SizedBox.shrink()),
      centerTitle: centerTitle,
      actions: actions,
      systemOverlayStyle: systemUiOverlayStyle,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);
}
