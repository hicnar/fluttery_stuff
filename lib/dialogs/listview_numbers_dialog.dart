import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttery_stuff/dialogs/height_calculating_state.dart';
import 'package:fluttery_stuff/platform_widget.dart';

import 'keyboard_avoiding.dart';

class ListViewNumbersDialog extends StatefulWidget {

  final List<int> elements;

  ListViewNumbersDialog({
    @required this.elements,
    Key key}) : super(key: key);

  @override
  _ListViewNumbersDialogState createState() =>
    _ListViewNumbersDialogState();
}

class _ListViewNumbersDialogState extends HeightCalculatingState<ListViewNumbersDialog>{

  @override
  Widget build(BuildContext context) {

    final title = "ListView based dialog with ${widget.elements.length} ${widget.elements.length == 1 ? "element" : "elements" }";
    final size = MediaQuery.of(context).size;

    void _ok(BuildContext context) {
      Navigator.of(context).pop();
    }

    Widget _buildContent() => ListView.builder(
      itemCount: widget.elements.length,
      itemBuilder: (context, index) {
        return Card(
          key: addKey(),
          elevation: 1.0,
          child: GestureDetector(
            onTap: () {
              setState(() {
              });
            },
            child: _Tile(generatedNumber: widget.elements[index],
            )
          )
        );
      }
    );

    Widget _buildAndroid(BuildContext context) =>
      AlertDialog(
        backgroundColor: Theme.of(context).canvasColor,
        title: Center(
          child: Text(title, textAlign: TextAlign.center)
        ),
        content: Container(
          /// I limit the max height to the screenHeightFactor of the device
          height: min(
            calculatedHeight.orElse(size.height),
            size.height * screenHeightFactor
          ),
          /// I limit the width to the .2 width of the device
          width: size.width * .2,
          child: _buildContent()
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
          content: Container(
            height: min(
              calculatedHeight.orElse(size.height),
              size.height * screenHeightFactor
            ),
            width: size.width,
            child: _buildContent()
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