
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttery_stuff/app.dart';
import 'package:fluttery_stuff/button.dart';
import 'package:fluttery_stuff/dialogs/column_numbers_dialog.dart';
import 'package:fluttery_stuff/dialogs/listview_numbers_dialog.dart';
import 'package:fluttery_stuff/platform_utils.dart';
import 'package:fluttery_stuff/platform_widget.dart';
import 'package:fluttery_stuff/view_frame.dart';
import 'package:optional/optional.dart';

void main() => runApp(App(title: "Lists Inside Dialog", home: ListInsideDialog()));

class ListInsideDialog extends StatefulWidget {

  @override
  _ListInsideDialogState createState() => _ListInsideDialogState();
}

class _ListInsideDialogState extends State<ListInsideDialog> with PlatformUtils{

  List<int> numbers = [0];

  Widget buildIos(BuildContext context) =>
    CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [_trailing()]
        )
      ),
      child: buildBody(context)
    );

  Widget buildAndroid(BuildContext context) =>
      Scaffold(
          appBar: AppBar(
            actions: [_trailing()],
          ),
          body: buildBody(context)
      );

  Widget _trailing() =>
    Container(
      child: GestureDetector(
        onTap: togglePlatform,
        child: Row(
          children:[
            Text("Tap here for:", style: TextStyle(fontSize: 15)),
            Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
            Icon(isIos ? Icons.android_rounded : Icons.phone_iphone_rounded, size: 25),
            Padding(padding: EdgeInsets.only(left: 5)),
          ]
        )
      )
    );



  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: buildAndroid,
      iosBuilder: buildIos);
  }

  Widget buildBody(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Container(
            child: ViewFrame(
                top: Container(
                    width: size.width,
                    child: Center(
                        child: Text(
                            "The dialog will contain ${numbers.length} generated ${numbers.length == 1 ? "element" : "elements" }",
                            style: TextStyle(fontSize: 40))
                    )
                ),
                // top: _buildScrollList(size, paragraphs),
                bottom: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  /// Increase the height below if you're getting the overflow warnings
                  height: 300,
                  child: Column(
                      children: [
                        Wrap(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Button(
                                    onPressed: () {
                                      setState(() {
                                        numbers = [0];
                                      });
                                    },
                                    label: 'Gen 1',
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Button(
                                    onPressed: () {
                                      setState(() {
                                        numbers = [for(var i = 0; i < 2; i++) i];
                                      });
                                    },
                                    label: 'Gen 2',
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Button(
                                    onPressed: () {
                                      setState(() {
                                        numbers = [for(var i = 0; i < 3; i++) i];
                                      });
                                    },
                                    label: 'Gen 3',
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Button(
                                    onPressed: () {
                                      setState(() {
                                        numbers = [for(var i = 0; i < 5; i++) i];
                                      });
                                    },
                                    label: 'Gen 5',
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Button(
                                    onPressed: () {
                                      setState(() {
                                        numbers = [for(var i = 0; i < 10; i++) i];
                                      });
                                    },
                                    label: 'Gen 10',
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Button(
                                    onPressed: () {
                                      setState(() {
                                        numbers = [for(var i = 0; i < 20; i++) i];
                                      });
                                    },
                                    label: 'Gen 20',
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Button(
                                    onPressed: () {
                                      setState(() {
                                        numbers = [for(var i = 0; i < 200; i++) i];
                                      });
                                    },
                                    label: 'Gen 200',
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Button(
                                    onPressed: () {
                                      setState(() {
                                        numbers = [for(var i = 0; i < 500; i++) i];
                                      });
                                    },
                                    label: 'Gen 500',
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Button(
                                    onPressed: () {
                                      setState(() {
                                        numbers = [for(var i = 0; i < 1000; i++) i];
                                      });
                                    },
                                    label: 'Gen 1000',
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Button(
                                    onPressed: () {
                                      setState(() {
                                        numbers = [for(var i = 0; i < 2000; i++) i];
                                      });
                                    },
                                    label: 'Gen 2000',
                                  )
                              ),

                            ]
                        ),
                        Wrap(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Button(
                                  color: Optional.of(isIos ? CupertinoColors.activeGreen: Colors.green),
                                  onPressed: () {
                                    showDialog<String>(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) =>
                                          ListViewNumbersDialog(
                                            generatedNumbers: numbers,
                                          )
                                    );
                                  },
                                  label: 'ListView Dialog',
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Button(
                                  color: Optional.of(isIos ? CupertinoColors.activeGreen: Colors.green),
                                  onPressed: () {
                                    showDialog<String>(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) =>
                                            ColumnNumbersDialog(
                                              generatedNumbers: numbers,
                                            )
                                    );
                                  },
                                  label: 'Column Dialog',
                                )
                            )

                          ]
                        )
                      ]
                  ),
                )
            )
        )
    );
  }
}
