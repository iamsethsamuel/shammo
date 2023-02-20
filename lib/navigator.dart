import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

NavigatorState navigator(BuildContext context) {
  return Navigator.of(context);
}

Future<dynamic> push(BuildContext context, Widget widget,
    {Route? route, bool? adaptive}) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }

  return Navigator.of(context)
      .push(route ?? router(context, widget, adaptive: adaptive));
}

void pushReplacement(BuildContext context, Widget widget,
    {Route? route, bool? adaptive}) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  Navigator.pushReplacement(
      context, route ?? router(context, widget, adaptive: adaptive));
}

void pop(BuildContext context) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  if (!canPop(context)) {
    throw "Route cannot be pop";
  }
  return Navigator.of(context).pop();
}

List<Route<dynamic>> defaultGenerateInitialRoutes(
    NavigatorState navigator, String initialRouteName) {
  return Navigator.defaultGenerateInitialRoutes(navigator, initialRouteName);
}

NavigatorState? navMaybeOf(BuildContext context) {
  return Navigator.maybeOf(context);
}

Future<Object?> popAndPushNamed(BuildContext context, String routeName) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  return Navigator.popAndPushNamed(context, routeName);
}

void popUntil(BuildContext context, bool Function(Route<dynamic>) predicate) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  return Navigator.popUntil(context, predicate);
}

Future<dynamic> pushAndRemoveUntil(BuildContext context, Route newRoute,
    bool Function(Route<dynamic>) predicate) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  return Navigator.pushAndRemoveUntil(context, newRoute, predicate);
}

Future<Object?> pushNamed(BuildContext context, String routeName) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  return Navigator.pushNamed(context, routeName);
}

Future<dynamic> pushNamedAndRemoveUntil(BuildContext context,
    String newRouteName, bool Function(Route<dynamic>) predicate) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  return Navigator.pushNamedAndRemoveUntil(context, newRouteName, predicate);
}

Future<dynamic> pushReplacementNamed(BuildContext context, String routeName) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  return Navigator.of(context).pushReplacementNamed(routeName);
}

void removeRoute(BuildContext context, Route route) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  return Navigator.of(context).removeRoute(route);
}

void removeRouteBelow(BuildContext context,
    {Route? anchorRoute, bool? adaptive}) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  return Navigator.of(context).removeRouteBelow(
      anchorRoute ?? router(context, context.widget, adaptive: adaptive));
}

void navReplace(BuildContext context, Route oldRoute, Route newRoute) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  return Navigator.of(context).replace(oldRoute: oldRoute, newRoute: newRoute);
}

void replaceRouteBelow(BuildContext context, Route newRoute,
    {Route? anchorRoute, bool? adaptive}) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  return Navigator.of(context).replaceRouteBelow(
    anchorRoute:
        anchorRoute ?? router(context, context.widget, adaptive: adaptive),
    newRoute: newRoute,
  );
}

Route router(BuildContext context, Widget widget, {bool? adaptive}) {
  if (adaptive == false) {
    return MaterialPageRoute(builder: (context) => widget);
  }

  if (Platform.isIOS || Platform.isMacOS) {
    return CupertinoPageRoute(builder: (context) => widget);
  }

  return MaterialPageRoute(builder: (context) => widget);
}

String restorablePopAndPushNamed(BuildContext context, String routeName) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  return Navigator.restorablePopAndPushNamed(context, routeName);
}

String restorablePush(
    BuildContext context, Route Function(BuildContext, Object?) routeBuilder) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  return Navigator.restorablePush(context, routeBuilder);
}

String restorablePushAndRemoveUntil(
    BuildContext context,
    Route Function(BuildContext, Object?) newRouteBuilder,
    bool Function(Route<dynamic>) predicate) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  return Navigator.restorablePushAndRemoveUntil(
      context, newRouteBuilder, predicate);
}

String restorablePushNamed(BuildContext context, String routeName) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  return Navigator.restorablePushNamed(context, routeName);
}

String restorablePushNamedAndRemoveUntil(
    BuildContext context, String newRouteName, Route route) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  return Navigator.restorablePushNamedAndRemoveUntil(
      context, newRouteName, (route) => false);
}

String restorablePushReplacement(
  BuildContext context,
  Route Function(BuildContext, Object?) routeBuilder,
) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  return Navigator.restorablePushReplacement(context, routeBuilder);
}

String restorablePushReplacementNamed(BuildContext context, String routeName) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  return Navigator.restorablePushReplacementNamed(context, routeName);
}

String restorableReplace(BuildContext context, Route<dynamic> oldRoute,
    Route Function(BuildContext, Object?) newRouteBuilder) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  return Navigator.restorableReplace(context,
      oldRoute: oldRoute, newRouteBuilder: newRouteBuilder);
}

String restorableReplaceRouteBelow(
    BuildContext context, Route Function(BuildContext, Object?) newRouteBuilder,
    {Route<dynamic>? anchorRoute, bool? adaptive}) {
  if (!isNavMounted(context)) {
    throw "Navigator is unmounted";
  }
  return Navigator.restorableReplaceRouteBelow(context,
      anchorRoute:
          anchorRoute ?? router(context, context.widget, adaptive: adaptive),
      newRouteBuilder: newRouteBuilder);
}

bool isNavMounted(BuildContext context) {
  if (Navigator.maybeOf(context) == null) {
    return false;
  }
  return Navigator.of(context).mounted;
}

bool canPop(BuildContext context) {
  if (isNavMounted(context)) {
    return Navigator.of(context).canPop();
  }
  return false;
}
