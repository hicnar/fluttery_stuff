import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class App extends StatelessWidget {

  final String title;
  final Widget home;

  const App({
    this.title = "Example App",
    @required this.home,
    Key key}) : super(key: key);

  @override
  Widget build(context) {
    return MaterialApp(
      onGenerateTitle: (context) => "",
      darkTheme: ThemeData(
          brightness: Brightness.dark
      ),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          buttonColor: Colors.blue
      ),
      builder: (context, child) =>
          CupertinoTheme(
            data: CupertinoThemeData(),
            child: Material(child: child),
          ),
      home: home,
    );
  }
}
