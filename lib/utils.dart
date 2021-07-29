import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Dio dio = Dio()
;
double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

Color canvasColor(BuildContext context) {
  return Theme.of(context).canvasColor;
}

Color cardColor(BuildContext context) {
  return Theme.of(context).cardColor;
}

void push(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void pushReplacement(BuildContext context, Widget widget) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget));
}

void pop(BuildContext context){
    Navigator.of(context).pop();
}

void showSnackBar(BuildContext context, dynamic widget, {Duration duration, double containerHeight}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: canvasColor(context),
    duration: duration != null ? Duration(days: 1) : Duration(minutes: 1),
    content: widget.runtimeType == String
        ? Text(widget.toString(),
            style: TextStyle( fontWeight: FontWeight.bold))
        : duration == null
            ? Container(
                constraints: containerHeight != null
                    ? null
                    : BoxConstraints(
                        maxWidth: width(context),
                        maxHeight: (height(context) / 4),
                      ),
                height: containerHeight != null ? containerHeight : double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: width(context),
                      child: Icon(Icons.drag_handle_rounded),
                    ),
                    widget
                  ],
                ),
              )
            : widget,
  ));
}

void openDialog(BuildContext context, Widget title, Widget content, List<Widget> actions) {
  
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

Future postRequest(BuildContext context, String url, dynamic data,
    {bool showProgressIndicator = true, Map headers}) {
  Map customHeaders = headers != null ? headers : {};
  return dio
      .post(url,
          data: data,
          options: Options(headers: {
            ...customHeaders
          }))
      .catchError((err) {
    showSnackBar(context, "Sorry an error occurred");
  }).catchError((err) {
    if (showProgressIndicator) showSnackBar(context, "Sorry an error occurred");
    print(err);
  });
}

Future getRequest(BuildContext context, String url, {bool futureBuilder, Map headers}) {

  Map customHeaders = headers != null ? headers : {};

  return dio
      .get(url,
          options: Options(headers: {
            ...customHeaders
          }))
      .catchError((err) {
    if (!futureBuilder) showSnackBar(context, "Sorry an error occurred");
    print(err);
  });
}

void removeSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
}


Color generateColor(String type, String text) {
  Color color;
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
      List<String> values = color.substring(color.indexOf("(") + 1, color.indexOf(")")).split(",").toList();
      String hex = "${values[0]}${values[1]}${values[2]}";
      return Color(int.parse("${values[3].padLeft(2, "0")}" + hex, radix: 16));
    } else if (color.contains("#")) {
      return Color(int.tryParse(color.substring(1), radix: 16) + 0xFF000000);
    } else {
      return Colors.blueAccent;
    }
  }

  List<String> splitGradient() {
    List parsed = gradient.split(", ")
      ..where((element) => element.contains("rgba") || element.contains("#")).toList();
    List<String> colors = [];
    for (String color in parsed) {
      if (color.contains("rgba")) {
        // print(color.substring(color.indexOf(RegExp("\\d+(?:\\.\\d+)?%")),color.indexOf("%")));
        colors.add(color.substring(color.indexOf("rgba"), color.indexOf(")") + 1));
      } else if (color.contains("#")) {
        colors.add(color.substring(color.indexOf("#") + 1, color.lastIndexOf(" ")));
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
