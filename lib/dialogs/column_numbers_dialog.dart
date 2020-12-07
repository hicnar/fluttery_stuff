
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttery_stuff/platform_widget.dart';

import 'keyboard_avoiding.dart';

class ColumnNumbersDialog extends StatefulWidget {

  final List<int> generatedNumbers;

  ColumnNumbersDialog({
    @required this.generatedNumbers,
    Key key}) : super(key: key);

  @override
  _ColumnNumbersDialogState createState() =>
    _ColumnNumbersDialogState();
}

class _ColumnNumbersDialogState extends State<ColumnNumbersDialog>{

  @override
  Widget build(BuildContext context) {

    final title = "Generated Numbers (Column)";

    void _ok(BuildContext context) {
      Navigator.of(context).pop();
    }

    List<Widget> _buildContent() =>
      widget.generatedNumbers.map((num) =>
         Card(
           elevation: 1.0,
           child: GestureDetector(
             onTap: () {
               setState(() {
               });
             },
             child: _Tile(generatedNumber: num,)
           )
         )
     ).toList();

    Widget _buildAndroid(BuildContext context) =>
      AlertDialog(
        scrollable: true,
        backgroundColor: Theme.of(context).canvasColor,
        title: Center(
          child: Text(title, textAlign: TextAlign.center)
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: _buildContent(),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("Cancel"),
            onPressed: () => Navigator.of(context).pop()
          ),
          FlatButton(
            child: Text("Ok"),
            onPressed: () => _ok(context)
          ),
        ],
      );

    Widget _buildIos(BuildContext context) =>
      KeyboardAvoiding(
        kFactor: 0.125,
        child: CupertinoAlertDialog(
          scrollController: null,
          title: Padding(
              padding: EdgeInsets.only(bottom: 15), child: Text(title)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: _buildContent(),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text("Cancel"),
              onPressed: () => Navigator.of(context).pop()
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("Ok"),
              onPressed: () => _ok(context)
            ),
          ],
        ));

    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}

class _Tile extends StatelessWidget {

  final int generatedNumber;
  _Tile({
    @required this.generatedNumber,
    Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
    ListTile(
      title: Text("Element #${generatedNumber + 1}"),
      subtitle: Text("Carefully generated element #${generatedNumber + 1}"),
    );
}