library shammo;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shammo/utils.dart';

class Badge extends StatelessWidget {
  Badge({Key? key, this.child, this.badge, this.badgeColor}) : super(key: key);
  final Widget? child;
  final Widget? badge;
  final Color? badgeColor;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          child!,
          Positioned(
            child: Container(
              child: Center(child: badge),
              width: 20,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: badgeColor != null ? badgeColor : Colors.transparent),
            ),
            right: 4,
            top: 10,
          )
        ],
      ),
    );
  }
}

class ContainerButton extends StatelessWidget {
  ContainerButton({Key? key, this.body, this.action, this.bodyColor, this.margin, this.padding})
      : super(key: key);
  final Widget? body;
  final Widget? action;
  final Color? bodyColor;
  final EdgeInsets? margin, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            margin: margin != null ? margin : null,
            width: width(context) - 58,
            padding: padding != null ? padding : EdgeInsets.all(10),
            color: bodyColor != null ? bodyColor : Theme.of(context).cardColor,
            child: body,
          ),
          Container(child: action)
        ],
      ),
    );
  }
}

Widget dropDropButtonUnderline(BuildContext context) {
  return Container(
    height: 40,
    padding: EdgeInsets.all(10),
    width: width(context),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey)),
  );
}

class PostCard extends StatelessWidget {
  PostCard(
      {Key? key,
      this.title,
      this.actions,
      this.action,
      this.subheader,
      this.avatar,
      this.content,
      this.decoration,
      this.constraints,
      this.margin,
      this.avatarDecoration,
      this.padding})
      : super(key: key);
  final Widget? title;
  final List<Widget>? actions;
  final Widget? action;
  final Widget? subheader;
  final Widget? avatar;
  final Widget? content;
  final BoxDecoration? decoration;
  final BoxConstraints? constraints;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final avatarDecoration;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: decoration,
      constraints: constraints,
      padding: padding,
      margin: margin,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            width: width(context),
            child: Row(
              children: [
                if (this.avatar != null)
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          decoration: avatarDecoration,
                          child: this.avatar),
                if (this.title != null) Expanded(flex: 9, child: this.title!),
                if (this.action != null) Container(child: this.action),
              ],
            ),
          ),
          if (this.subheader != null)
            Container(margin: EdgeInsets.all(10), width: width(context), child: this.subheader),
          if (this.content != null)
            Container(
              margin: EdgeInsets.all(5),
              width: width(context),
              child: Column(
                children: [this.content!],
              ),
            ),
          if (this.actions != null)
            Container(
              margin: EdgeInsets.all(5),
              width: width(context),
              child: Row(
                children: this.actions!,
              ),
            ),
        ],
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  Carousel(
      {Key? key,
      required this.items,
      required this.aspectRatio,
      this.indicator,
      this.indicatorColor,
      this.activeIndicatorWidth,
      this.indicatorWidth,
      this.indicatorHeight,
      this.activeIndicatorHeight,
      this.indicatorRadius,
      this.onTap,
      this.onPageChange})
      : super(key: key);
  final List<Widget> items;
  final double aspectRatio;
  final Widget? indicator;
  final Color? indicatorColor;
  final double? activeIndicatorWidth, indicatorWidth, activeIndicatorHeight, indicatorHeight, indicatorRadius;
  final GestureTapCallback? onTap;
  final ValueChanged<int>? onPageChange;
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final PageController controller = PageController();
  int page = 0;

  double? setIndicatorWidth(int index) {
    if (index == page) {
      if (widget.activeIndicatorWidth != null) {
        return widget.activeIndicatorWidth;
      } else {
        return 10;
      }
    } else {
      if (widget.indicatorWidth != null) {
        return widget.indicatorWidth;
      } else {
        return 5;
      }
    }
  }

  double? setIndicatorHeight() {
    if (widget.indicatorHeight != null) {
      return widget.indicatorHeight;
    } else {
      return 5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: widget.aspectRatio,
            child: PageView(
              controller: controller,
              children: widget.items,
              onPageChanged: (pageIndex) {
                if (widget.onPageChange != null) widget.onPageChange!(pageIndex);
                setState(() {
                  page = pageIndex;
                });
              },
            ),
          ),
          Container(
              margin: EdgeInsets.all(10),
              width: width(context),
              alignment: Alignment.center,
              height: setIndicatorHeight(),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                for (int index = 0; index < widget.items.length; index++)
                  Container(
                    width: setIndicatorWidth(index),
                    height: setIndicatorHeight(),
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          widget.indicatorRadius != null ? widget.indicatorRadius! : 10),
                      color: widget.indicatorColor == null ? Colors.blueAccent : widget.indicatorColor,
                    ),
                  )
              ]))
        ],
      ),
    );
  }
}


class MaterialRadio extends StatefulWidget {
  const MaterialRadio(
      {Key? key,
      this.color,
      this.selectColor,
      this.radius,
      required this.onChange,
      this.size,
      this.disenabled})
      : super(key: key);
  final Color? color;
  final Color? selectColor;
  final double? size, radius;
  final bool? disenabled;
  final void Function(bool) onChange;
  @override
  _MaterialRadioState createState() => _MaterialRadioState();
}

class _MaterialRadioState extends State<MaterialRadio> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    if (widget.disenabled != null) {
      selected = true;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.disenabled == null || (widget.disenabled == false)) {
            selected ? selected = false : selected = true;
          }
          if (widget.onChange != null) widget.onChange(selected);
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: widget.size ?? 25,
            height: widget.size ?? 25,
            decoration: BoxDecoration(
                color: widget.color ?? Colors.blueAccent,
                borderRadius: BorderRadius.circular(
                  widget.radius ?? 20,
                )),
          ),
          if (selected)
            Container(
              width: widget.size != null ? widget.size! / 2 : 12.5,
              height: widget.size != null ? widget.size! / 2 : 12.5,
              decoration: BoxDecoration(
                  color: widget.selectColor ?? Colors.white,
                  borderRadius: BorderRadius.circular(
                    widget.radius ?? 30,
                  )),
            ),
        ],
      ),
    );
  }
}

class CountDown extends StatefulWidget {
  const CountDown({Key? key, this.style, required this.duration})
      : super(key: key);
  final TextStyle? style;
  final int duration;
  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  late int interval;
  String time = "";
  late Timer timer;

  @override
  void initState() {
    interval = widget.duration;
    timer = Timer.periodic(const Duration(seconds: 1), (Timer ti) {
      interval -= 1;
      final double minutes = interval / 60;
      int seconds = interval % 60;
      seconds > 0 ? seconds -= 1 : seconds = 0;
      if (interval > 0) {
        setState(() {
          time = "${minutes.toInt()}:$seconds";
        });
      } else {
        timer.cancel();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      time,
      style: widget.style,
    );
  }
}


class MenuButton extends StatelessWidget {
  const MenuButton(
      {required this.header,
      required this.icon,
      this.description,
      this.color,
      required this.route});
  final String header;
  final String? description;
  final IconData icon;
  final Widget route;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: color??Colors.blueAccent,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 30)
            .add(const EdgeInsets.only(top: 10)),
        child: TextButton(
          onPressed: () => push(context, route),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: color??Colors.blueAccent,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: width(context) / 2,
                child: Column(
                  children: [
                    Container(
                        width: (width(context) / 2) - 5,
                        child: Text(
                          header,
                          style: const TextStyle(fontSize: 22),
                        )),
                    if (description != null)
                      Container(
                          width: (width(context) / 2) - 5,
                          child: Text(
                            description!,
                            style: const TextStyle(fontSize: 11),
                          ))
                  ],
                ),
              ),
              RotatedBox(
                  quarterTurns: 2, child: Icon(Icons.arrow_back_ios,color: color??Colors.blueAccent))
            ],
          ),
        ));
  }
}


class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {required this.label,
      required this.controller,
      this.prefix,
      this.suffix,
      this.hint,this.color, this.border});
  final String label;
  final TextEditingController controller;
  final Widget? suffix;
  final Widget? prefix;
  final String? hint;
  final Color? color;
  final InputBorder? border;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width(context),
          child: Text(label),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: border,
                hintText: hint,
                hintStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                suffixStyle: TextStyle(color:color),
                prefixStyle: TextStyle(color: color),
                prefixIcon: prefix,
                suffixIcon: suffix),
          ),
        )
      ],
    );
  }
}
