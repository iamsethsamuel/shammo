import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

MediaQueryData mediaQuery (BuildContext context){
  return MediaQuery.of(context);
}

double width(BuildContext context) {
  return mediaQuery(context).size.width;
}

double height(BuildContext context) {
  return mediaQuery(context).size.height;
}

bool alwaysUse24HourFormat(BuildContext context) {
  return mediaQuery(context).alwaysUse24HourFormat;
}

bool accessibleNavigation(BuildContext context) {
  return mediaQuery(context).accessibleNavigation;
}

bool boldText(BuildContext context) {
  return mediaQuery(context).boldText;
}

double devicePixelRatio(BuildContext context) {
  return mediaQuery(context).devicePixelRatio;
}

bool disableAnimations(BuildContext context) {
  return mediaQuery(context).disableAnimations;
}

DeviceGestureSettings gestureSettings(BuildContext context) {
  return mediaQuery(context).gestureSettings;
}

bool highContrast(BuildContext context) {
  return mediaQuery(context).highContrast;
}

bool invertColors(BuildContext context) {
  return mediaQuery(context).invertColors;
}

NavigationMode navigationMode(BuildContext context) {
  return mediaQuery(context).navigationMode;
}

Orientation orientation(BuildContext context) {
  return mediaQuery(context).orientation;
}

EdgeInsets padding(BuildContext context) {

  return mediaQuery(context).padding;
}

Brightness platformBrightness(BuildContext context) {
  return mediaQuery(context).platformBrightness;
}

double aspectRatio(BuildContext context) {
  return mediaQuery(context).size.aspectRatio;
}

Size mediaSize(BuildContext context) {
  return mediaQuery(context).size;
}

double longestSide(BuildContext context) {
  return mediaSize(context).longestSide;
}

Size flipped(BuildContext context) {
  return mediaSize(context).flipped;
}

double shortestSide(BuildContext context) {
  return mediaSize(context).shortestSide;
}

EdgeInsets systemGestureInsets(BuildContext context) {
  return mediaQuery(context).systemGestureInsets;
}

double textScaleFactor(BuildContext context) {
  return mediaQuery(context).textScaleFactor;
}

EdgeInsets viewInsets(BuildContext context) {
  return mediaQuery(context).viewInsets;
}

EdgeInsets viewPadding(BuildContext context) {
  return mediaQuery(context).viewPadding;
}

List<DisplayFeature> displayFeatures(BuildContext context) {
  return mediaQuery(context).displayFeatures;
}