import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData theme(BuildContext context) {
  return Theme.of(context);
}

Color canvasColor(BuildContext context) {
  return theme(context).canvasColor;
}

Color cardColor(BuildContext context) {
  return theme(context).cardColor;
}

AppBarTheme appBarTheme(BuildContext context) {
  return theme(context).appBarTheme;
}

IconThemeData? actionsIconTheme(BuildContext context) {
  return appBarTheme(context).actionsIconTheme;
}

BottomAppBarTheme bottomAppBarTheme(BuildContext context) {
  return theme(context).bottomAppBarTheme;
}

BottomNavigationBarThemeData bottomNavigationBarTheme(BuildContext context) {
  return theme(context).bottomNavigationBarTheme;
}

BottomSheetThemeData bottomSheetTheme(BuildContext context) {
  return theme(context).bottomSheetTheme;
}

ButtonBarThemeData buttonBarTheme(BuildContext context) {
  return theme(context).buttonBarTheme;
}

CardTheme cardTheme(BuildContext context) {
  return theme(context).cardTheme;
}

CheckboxThemeData checkboxTheme(BuildContext context) {
  return theme(context).checkboxTheme;
}

ChipThemeData chipTheme(BuildContext context) {
  return theme(context).chipTheme;
}

ColorScheme colorScheme(BuildContext context) {
  return theme(context).colorScheme;
}

NoDefaultCupertinoThemeData? cupertinoOverrideTheme(BuildContext context) {
  return theme(context).cupertinoOverrideTheme;
}

DataTableThemeData dataTableTheme(BuildContext context) {
  return theme(context).dataTableTheme;
}

DialogTheme dialogTheme(BuildContext context) {
  return theme(context).dialogTheme;
}

DividerThemeData dividerTheme(BuildContext context) {
  return theme(context).dividerTheme;
}

DrawerThemeData drawerTheme(BuildContext context) {
  return theme(context).drawerTheme;
}

ElevatedButtonThemeData elevatedButtonTheme(BuildContext context) {
  return theme(context).elevatedButtonTheme;
}

ExpansionTileThemeData expansionTileTheme(BuildContext context) {
  return theme(context).expansionTileTheme;
}

Map<Object, ThemeExtension<dynamic>> extensions(BuildContext context) {
  return theme(context).extensions;
}

FloatingActionButtonThemeData floatingActionButtonTheme(BuildContext context) {
  return theme(context).floatingActionButtonTheme;
}

IconThemeData iconTheme(BuildContext context) {
  return theme(context).iconTheme;
}

InputDecorationTheme inputDecorationTheme(BuildContext context) {
  return theme(context).inputDecorationTheme;
}

ListTileThemeData listTileTheme(BuildContext context) {
  return theme(context).listTileTheme;
}

NavigationBarThemeData navigationBarTheme(BuildContext context) {
  return theme(context).navigationBarTheme;
}

NavigationRailThemeData navigationRailTheme(BuildContext context) {
  return theme(context).navigationRailTheme;
}

OutlinedButtonThemeData outlinedButtonTheme(BuildContext context) {
  return theme(context).outlinedButtonTheme;
}

PageTransitionsTheme pageTransitionsTheme(BuildContext context) {
  return theme(context).pageTransitionsTheme;
}

PopupMenuThemeData popupMenuTheme(BuildContext context) {
  return theme(context).popupMenuTheme;
}

IconThemeData primaryIconTheme(BuildContext context) {
  return theme(context).primaryIconTheme;
}

TextTheme primaryTextTheme(BuildContext context) {
  return theme(context).primaryTextTheme;
}

ProgressIndicatorThemeData progressIndicatorTheme(BuildContext context) {
  return theme(context).progressIndicatorTheme;
}

RadioThemeData radioTheme(BuildContext context) {
  return theme(context).radioTheme;
}

ScrollbarThemeData scrollbarTheme(BuildContext context) {
  return theme(context).scrollbarTheme;
}

SliderThemeData sliderTheme(BuildContext context) {
  return theme(context).sliderTheme;
}

SnackBarThemeData snackBarTheme(BuildContext context) {
  return theme(context).snackBarTheme;
}

SwitchThemeData switchTheme(BuildContext context) {
  return theme(context).switchTheme;
}

TabBarTheme tabBarTheme(BuildContext context) {
  return theme(context).tabBarTheme;
}

TextButtonThemeData textButtonTheme(BuildContext context) {
  return theme(context).textButtonTheme;
}

TextSelectionThemeData textSelectionTheme(BuildContext context) {
  return theme(context).textSelectionTheme;
}

TextTheme textTheme(BuildContext context) {
  return theme(context).textTheme;
}

TimePickerThemeData timePickerTheme(BuildContext context) {
  return theme(context).timePickerTheme;
}

ToggleButtonsThemeData toggleButtonsTheme(BuildContext context) {
  return theme(context).toggleButtonsTheme;
}

TooltipThemeData tooltipTheme(BuildContext context) {
  return theme(context).tooltipTheme;
}

TextStyle? bodyText1(BuildContext context) {
  return textTheme(context).bodyText1;
}

TextStyle? bodyText2(BuildContext context) {
  return textTheme(context).bodyText2;
}

TextStyle? bodyMedium(BuildContext context) {
  return textTheme(context).bodyMedium;
}

TextStyle? bodyLarge(BuildContext context) {
  return textTheme(context).bodyLarge;
}

TextStyle? bodySmall(BuildContext context) {
  return textTheme(context).bodySmall;
}

TextStyle? buttonTextStyle(BuildContext context) {
  return textTheme(context).button;
}

TextStyle? caption(BuildContext context) {
  return textTheme(context).caption;
}

TextStyle? displayLarge(BuildContext context) {
  return textTheme(context).displayLarge;
}

TextStyle? displayMedium(BuildContext context) {
  return textTheme(context).displayMedium;
}

TextStyle? displaySmall(BuildContext context) {
  return textTheme(context).displaySmall;
}

TextStyle? headline1(BuildContext context) {
  return textTheme(context).headline1;
}

TextStyle? headline2(BuildContext context) {
  return textTheme(context).headline2;
}

TextStyle? headline3(BuildContext context) {
  return textTheme(context).headline3;
}

TextStyle? headline4(BuildContext context) {
  return textTheme(context).headline4;
}

TextStyle? headline5(BuildContext context) {
  return textTheme(context).headline5;
}

TextStyle? headline6(BuildContext context) {
  return textTheme(context).headline6;
}

TextStyle? headlineLarge(BuildContext context) {
  return textTheme(context).headlineLarge;
}

TextStyle? headlineMedium(BuildContext context) {
  return textTheme(context).headlineMedium;
}

TextStyle? headlineSmall(BuildContext context) {
  return textTheme(context).headlineSmall;
}

TextStyle? labelLarge(BuildContext context) {
  return textTheme(context).labelLarge;
}

TextStyle? labelMedium(BuildContext context) {
  return textTheme(context).labelMedium;
}

TextStyle? labelSmall(BuildContext context) {
  return textTheme(context).labelSmall;
}

TextStyle? overline(BuildContext context) {
  return textTheme(context).overline;
}

TextStyle? subtitle1(BuildContext context) {
  return textTheme(context).subtitle1;
}

TextStyle? subtitle2(BuildContext context) {
  return textTheme(context).subtitle2;
}

TextStyle? titleLarge(BuildContext context) {
  return textTheme(context).titleLarge;
}

TextStyle? titleMedium(BuildContext context) {
  return textTheme(context).titleMedium;
}

TextStyle? titleSmall(BuildContext context) {
  return textTheme(context).titleSmall;
}
