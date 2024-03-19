import 'package:flutter/material.dart';

void openDrawer(BuildContext context) {
  Scaffold.of(context).openDrawer();
}

void closeDrawer(BuildContext context) {
  Scaffold.of(context).closeDrawer();
}

void closeEndDrawer(BuildContext context) {
  Scaffold.of(context).closeEndDrawer();
}

void openEndDrawer(BuildContext context) {
  Scaffold.of(context).openEndDrawer();
}

void showBodyScrim(BuildContext context, bool value, double opacity) {
  Scaffold.of(context).showBodyScrim(value, opacity);
}

void showBottomSheet(
  BuildContext context,
  Widget widget, {
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  BoxConstraints? constraints,
  bool? enableDrag,
  AnimationController? transitionAnimationController,
}) {
  Scaffold.of(context).showBottomSheet((context) => widget,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      constraints: constraints,
      enableDrag: enableDrag,
      transitionAnimationController: transitionAnimationController);
}

double? appBarMaxHeight(BuildContext context, bool value, double opacity) {
  return Scaffold.of(context).appBarMaxHeight;
}

bool? hasAppBar(BuildContext context, bool value, double opacity) {
  return Scaffold.of(context).hasAppBar;
}

bool? hasEndDrawer(BuildContext context, bool value, double opacity) {
  return Scaffold.of(context).hasEndDrawer;
}

bool? hasFloatingActionButton(BuildContext context, bool value, double opacity) {
  return Scaffold.of(context).hasFloatingActionButton;
}

bool? isDrawerOpen(BuildContext context, bool value, double opacity) {
  return Scaffold.of(context).isDrawerOpen;
}

bool? isEndDrawerOpen(BuildContext context, bool value, double opacity) {
  return Scaffold.of(context).isEndDrawerOpen;
}

bool? restorePending(BuildContext context, bool value, double opacity) {
  return Scaffold.of(context).restorePending;
}
