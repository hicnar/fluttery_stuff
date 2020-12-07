import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttery_stuff/platform_widget.dart';
import 'package:optional/optional.dart';

class Button extends StatelessWidget {

  final String label;
  final VoidCallback onPressed;
  final Optional<Color> color;

  const Button({
    @required this.label,
    @required this.onPressed,
    this.color = const Optional.empty(),
    Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
    PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos
    );

  Widget _buildIos(BuildContext context){
    final cupertinoNavActionStyle = CupertinoTheme.of(context).textTheme.navActionTextStyle;
    return OutlineButton(
      textColor: color.orElse(cupertinoNavActionStyle.color),
      highlightedBorderColor: color.orElse(cupertinoNavActionStyle.color),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7.0))),
      borderSide: BorderSide(color: color.orElse(cupertinoNavActionStyle.color)),
      child: Text(label, style: color.map((c) => TextStyle(color: c)).orElse(cupertinoNavActionStyle)),
      onPressed: onPressed
    );
  }

  Widget _buildAndroid(BuildContext context){
    return RaisedButton(
      color: color.orElse(Colors.blue),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
