import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shammo/shammo.dart';

void showSnackBar(BuildContext context, dynamic widget,
    {Duration? duration,
    double? containerHeight,
    SnackBarBehavior? behavior,
    String? label,
    TextStyle? textStyle,
    SnackBarAction? action}) {
  void Function()? close;
  ScaffoldMessenger.maybeOf(context)?.clearSnackBars();
  final snackbar = ScaffoldMessenger.maybeOf(context)?.showSnackBar(
    SnackBar(
      behavior: behavior != null
          ? behavior
          : Scaffold.maybeOf(context) == null
              ? SnackBarBehavior.fixed
              : Scaffold.of(context).hasFloatingActionButton
                  ? SnackBarBehavior.fixed
                  : SnackBarBehavior.floating,
      action: action == null
          ? action
          : label == null
              ? null
              : SnackBarAction(
                  label: "Dismiss",
                  onPressed: () {
                    if (close != null) {
                      close();
                    }
                  },
                ),
      duration: duration != null
          ? duration
          : const Duration(
              seconds: 30,
            ),
      content: widget.runtimeType == String
          ? Text(
              widget.toString(),
              style: textStyle,
            )
          : Column(
              children: [
                SizedBox(
                  width: width(context),
                  child: const Icon(Icons.drag_handle_rounded),
                ),
                widget as Widget,
              ],
            ),
    ),
  );

  close = () {
    snackbar!.close();
  };
}

void openDialog(
    BuildContext context, Widget title, Widget content, List<Widget> actions) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: actions,
          title: title,
          content: content,
        );
      });
}

void closeDialog(BuildContext context) {
  Navigator.of(context).pop();
}

void removeSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
}

Color? generateColor(String type, String text) {
  Color? color;
  if (type == "text") {
    if (text.contains("#")) {
      try {
        color = Color(int.parse(text.substring(1).padLeft(8, "FF"), radix: 16));
      } catch (err) {
        color = Colors.white;
        print(err);
      }
    }
  } else {
    if (text.contains("#")) {
      try {
        color = Color(int.parse(text.substring(1).padLeft(8, "FF"), radix: 16));
      } catch (err) {
        color = Colors.blueAccent;
        print(err);
      }
    } else {
      color = Colors.blueAccent;
    }
  }
  return color;
}

LinearGradient convertGradient(String gradient) {
  Color parseRGB(String color) {
    if (color.contains("rgba")) {
      List<String> values = color
          .substring(color.indexOf("(") + 1, color.indexOf(")"))
          .split(",")
          .toList();
      String hex = "${values[0]}${values[1]}${values[2]}";
      return Color(int.parse("${values[3].padLeft(2, "0")}" + hex, radix: 16));
    } else if (color.contains("#")) {
      return Color(int.tryParse(color.substring(1), radix: 16)! + 0xFF000000);
    } else {
      return Colors.blueAccent;
    }
  }

  List<String> splitGradient() {
    List parsed = gradient.split(", ")
      ..where((element) => element.contains("rgba") || element.contains("#"))
          .toList();
    List<String> colors = [];
    for (String color in parsed as Iterable<String>) {
      if (color.contains("rgba")) {
        // print(color.substring(color.indexOf(RegExp("\\d+(?:\\.\\d+)?%")),color.indexOf("%")));
        colors.add(
            color.substring(color.indexOf("rgba"), color.indexOf(")") + 1));
      } else if (color.contains("#")) {
        colors.add(
            color.substring(color.indexOf("#") + 1, color.lastIndexOf(" ")));
      }
    }
    return colors;
  }

  if (gradient.contains("linear-gradient")) {
    return LinearGradient(
      colors: [for (var color in splitGradient()) parseRGB(color)],
    );
  } else {
    print("Invalid Gradient Data");
    return LinearGradient(colors: []);
  }
}

String commaSeperatedNumber(int n) {
  final rawnumber = n.toString().split(RegExp(""));
  int f = 4;
  final List number = [];
  for (int index = rawnumber.length - 1; index >= 0; index--) {
    if (f == 1) {
      number.add("${rawnumber[index]},");
      f = 4;
    } else {
      number.add(rawnumber[index]);
    }
    f--;
  }

  return number.reversed.join("");
}

double? toDouble(number) {
  return double.tryParse(number.toString());
}

int? toInt(number) {
  return int.tryParse(number.toString());
}

Future<void> copy(BuildContext context, String text) async {
  return await Clipboard.setData(ClipboardData(text: text))
      .then((value) {})
      .catchError((err) {
    debugPrint(err.toString());
  });
}

String shortenNumber(int number) {
  final String numb = number.toString();
  if (number < 99) {
    return numb;
  } else if (number > 999 && number < 9999) {
    return "${numb.substring(0, 1)}k";
  } else if (number > 9999 && number < 99999) {
    return "${numb.substring(0, 2)}k";
  } else if (number > 99999 && number < 999999) {
    return "${numb.substring(0, 3)}k";
  } else {
    return "${numb.substring(0, 4)}m";
  }
}

Color convertToColor(String color) {
  if (color.runtimeType == String) {
    return Color(getColorCode(color.toString()));
  }

  final colorInt = toInt(color);
  if (colorInt == null) {
    return Colors.black;
  }

  return Color(colorInt);
}

int getColorCode(String color, {int? fallback}) {
  if (color.length == 10) {
    return int.tryParse(color) ?? fallback ?? Colors.white.value;
  }

  if (color.startsWith("#")) {
    return int.tryParse(color.substring(1).padLeft(8, "FF"), radix: 16) ??
        fallback ??
        Colors.white.value;
  } else {
    return int.tryParse(color.padLeft(8, "FF"), radix: 16) ??
        fallback ??
        Colors.white.value;
  }
}

void confirmAction(
  BuildContext context, {
  Function()? onConfirm,
  String? message,
  String? confirm,
  ElevatedButton? actionButtonStyle,
  ButtonStyle? confirmButtonStyle,
  ButtonStyle? closeButtonStyle,
  Function()? onClose,
  String? close,
  Key? confirmKey,
  bool? useRedColor,
  String? title,
  Widget? closeWidget,
  Widget? confirmWidget,
  Widget? messageWidget,
  Widget? titleWidget,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: titleWidget != null
          ? titleWidget
          : Text(title ?? "Are you sure you can to continue"),
      content: messageWidget != null
          ? messageWidget
          : message == null
              ? null
              : Text(message),
      actions: [
        if (confirmWidget != null)
          confirmWidget
        else
          Container(
            width: width(context),
            padding: const EdgeInsets.all(10),
            child: actionButtonStyle ??
                ElevatedButton(
                  key: confirmKey ?? const Key("yes"),
                  style: confirmButtonStyle ??
                      ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    pop(context);
                    onConfirm!();
                  },
                  child: Text(confirm ?? "Yes"),
                ),
          ),
        if (closeWidget != null)
          closeWidget
        else
          Container(
            width: width(context),
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              key: const Key("no"),
              style: closeButtonStyle,
              onPressed: () {
                if (onClose != null) {
                  onClose();
                }
                pop(context);
              },
              child: Text(close ?? "No"),
            ),
          ),
      ],
    ),
  );
}

void openBottomSheet(
  BuildContext context,
  List<Widget> children, {
  double? initHeight,
  double? maxHeight,
  bool? hasInputField,
  Color? backgroundColor,
  Color? handleColor,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    isDismissible: true,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        snap: true,
        expand: false,
        minChildSize: initHeight ?? .20,
        snapSizes: [
          if (initHeight == null) .20,
          initHeight ?? .30,
          maxHeight ?? .60
        ],
        initialChildSize: initHeight ?? .40,
        maxChildSize: maxHeight ?? .60,
        builder: (context, controller) {
          if (hasInputField == true &&
              MediaQuery.of(context).viewInsets == EdgeInsets.zero) {
            if (controller.hasClients) {
              controller.jumpTo(0);
            }
          }

          return Container(
            height: height(context) / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: backgroundColor ?? canvasColor(context),
            ),
            margin: const EdgeInsets.all(10).add(
              EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets == EdgeInsets.zero
                    ? 0
                    : MediaQuery.of(context).viewInsets.bottom,
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: ListView(
              controller: controller,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: width(context),
                  alignment: Alignment.center,
                  child: Container(
                    width: 60,
                    height: 4,
                    decoration: BoxDecoration(
                      color: handleColor ?? Theme.of(context).iconTheme.color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ...children
              ],
            ),
          );
        },
      );
    },
  );
}

double percentageCalculator(dynamic number, dynamic percentage) {
  final parsedNumber = int.tryParse(number.toString()) ?? 0;
  final parsedPercentage = int.tryParse(percentage.toString()) ?? 0;
  return (parsedNumber / (parsedNumber + parsedPercentage)) * 100;
}
