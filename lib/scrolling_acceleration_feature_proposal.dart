import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'file:///Users/khycnar/IdeaProjects/fluttery_stuff/lib/view_frame.dart';


void main() => runApp(ScrollAccelerationInBurstsApp());


class ScrollAccelerationInBurstsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrolling Acceleration In Bursts',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScrollingTab(),
    );
  }
}


class ScrollingTab extends StatefulWidget {

  @override
  _ScrollingTabState createState() => _ScrollingTabState();
}

class _ScrollingTabState extends State<ScrollingTab>{

  final ScrollController _scrollController = ScrollController();
  bool scrolling = false;
  int speedFactor = 5;

  @override
  Widget build(context) => _buildAndroid(context);

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _buildAndroid(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    List<String> paragraphs = [
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam accumsan volutpat ligula ac interdum. Ut pellentesque sit amet odio nec venenatis. Integer malesuada elit non lorem ullamcorper, sit amet viverra nulla lobortis. Fusce eu elit at libero maximus laoreet ac ut odio. Sed ut diam non libero bibendum rutrum vel at lacus. Nullam ultrices tempus nulla, sit amet vehicula arcu iaculis quis. In efficitur erat ac velit tempus pretium.",
      "Aliquam ut libero mi. In ligula magna, vulputate eu luctus ut, tristique nec sapien. Mauris consequat cursus nisl. Etiam orci nibh, porta a gravida eget, pellentesque et tortor. Cras volutpat nisi condimentum tellus dapibus fermentum. Pellentesque placerat arcu quis massa viverra, eu sagittis ipsum fringilla. Aliquam erat volutpat. Fusce ante sem, rutrum ac tempor nec, lacinia at nulla.",
      "Aliquam erat volutpat. Nunc id ipsum arcu. Nullam ut pulvinar metus. Vivamus et libero urna. Ut ultrices nulla a arcu iaculis, sed posuere lectus malesuada. Maecenas sit amet ultricies libero. Ut at erat libero. Mauris faucibus, eros non volutpat dictum, nulla lectus pellentesque mauris, eleifend efficitur eros sapien vitae urna. Phasellus posuere, velit in scelerisque consectetur, justo elit sodales lorem, ac tristique quam lacus in tellus. Etiam ligula purus, placerat non lacus ac, pharetra maximus elit.",
      "Nunc pharetra metus sed velit suscipit molestie. Nulla eu diam eget elit elementum aliquam mattis non enim. Sed at dictum nisi. Donec tempus neque non mi rhoncus, porttitor congue leo volutpat. Mauris eros eros, suscipit ac nulla eget, porttitor convallis ligula. Sed tempus, tellus a sollicitudin congue, est libero tincidunt ex, sit amet accumsan felis sapien in neque. Morbi varius sem lectus, non pellentesque dui accumsan vitae. Integer orci felis, pharetra a fermentum sed, tincidunt id elit.",
      "Donec pharetra gravida ullamcorper. Donec in sapien id arcu egestas volutpat. In sed odio orci. Curabitur eget pellentesque elit. Cras at efficitur nisi. In tempor id odio vitae convallis. Mauris eu commodo lectus, eu molestie felis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In faucibus dolor velit, quis mattis velit tempus in. Morbi nisi mi, consequat sed congue vitae, vestibulum nec nibh. Morbi tristique, nisi vitae faucibus efficitur, lectus massa sollicitudin nisl, non imperdiet diam risus a tortor. Fusce cursus volutpat odio, venenatis porta ante feugiat non. Phasellus sodales sed erat in rhoncus. Sed commodo mauris ac nunc posuere consectetur. Ut consequat tempus sapien, et malesuada turpis elementum at.",
      "Vivamus ornare finibus sapien at scelerisque. Curabitur sollicitudin, purus sit amet semper molestie, odio elit imperdiet ligula, id malesuada est felis ut libero. Nam pellentesque nisi eros, quis pellentesque velit posuere quis. Cras non lectus quis dolor molestie elementum. Nunc tristique dignissim condimentum. Nunc congue in risus rutrum bibendum. Fusce posuere est nisi, id tristique odio faucibus ac.",
      "Mauris maximus vulputate porttitor. Ut non facilisis augue, et convallis ipsum. Aenean elementum sapien sapien, nec rutrum metus vulputate vitae. Quisque posuere elementum tellus, ac porttitor eros vestibulum ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed sit amet suscipit nulla, at rutrum odio. Phasellus viverra justo sit amet ullamcorper vestibulum. Ut finibus, risus nec interdum convallis, est purus pellentesque nunc, at suscipit nisl velit et libero. In pretium vel ipsum sit amet porta. Fusce porta egestas interdum. Nulla nec nisl sit amet justo consectetur tempus. Fusce auctor lorem purus, nec sodales risus sodales ac. Quisque nisi mauris, lacinia a porttitor at, vulputate eu sapien. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam laoreet eu lacus id ultricies. Donec in tortor vitae nisl consectetur pharetra.",
      "Praesent nec semper felis, eget condimentum ante. Morbi feugiat elementum tortor eget iaculis. Quisque bibendum, turpis eget consequat commodo, nisl ipsum condimentum ex, et laoreet justo libero a lectus. Vivamus convallis bibendum vulputate. Praesent gravida maximus libero eget tempus. Mauris in commodo ante, vitae blandit ligula. Phasellus ut nisi sed ante sodales scelerisque. Cras iaculis fringilla aliquet. Praesent massa libero, malesuada id odio vitae, volutpat sollicitudin ex. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nam pretium, nibh vel imperdiet sodales, quam nulla rhoncus erat, eget porttitor nisl nunc vel libero. Vestibulum id lacus vel ante convallis pulvinar. Sed finibus, massa quis eleifend porta, dui odio placerat elit, eget euismod nisi lectus eu ex. Praesent rhoncus mi vitae quam eleifend, sit amet consequat risus suscipit.",
      "Vestibulum dignissim justo in nisi malesuada, non tempor justo scelerisque. Suspendisse potenti. Curabitur pellentesque nulla a vulputate tincidunt. Morbi eu libero bibendum, volutpat felis quis, rutrum libero. Maecenas pharetra pellentesque nisl, ac tempus ex tincidunt sit amet. Duis purus odio, placerat ut erat sed, bibendum porta neque. Mauris aliquam ex at metus bibendum condimentum. Etiam et dictum erat. Nulla facilisi. Donec in pellentesque velit, eget molestie felis. Aenean sed augue pellentesque massa eleifend malesuada. Vivamus molestie nec est id placerat. Maecenas pulvinar nibh quis rutrum malesuada. Aenean maximus tortor at elit lobortis, at varius erat pellentesque. Fusce magna libero, tristique vitae finibus a, aliquet ac lorem. Proin consequat pellentesque nulla vitae tristique.",
      "Aliquam sagittis libero a metus blandit egestas. Morbi viverra varius venenatis. Sed rhoncus malesuada eleifend. Etiam vitae erat a massa gravida sagittis. Sed at ornare nunc, vitae interdum nibh. Aenean sed vehicula mi. Cras vestibulum, lectus vel suscipit auctor, ex ligula luctus purus, ut bibendum quam justo quis nisl.",
      "Suspendisse mollis arcu non est eleifend maximus. Praesent auctor risus erat, sit amet pharetra diam dictum eget. Nam auctor purus ac orci sodales porta id quis risus. Nam ut molestie enim, a mollis sem. In consectetur volutpat euismod. In hac habitasse platea dictumst. In ut sollicitudin libero, non elementum nibh. Morbi aliquam scelerisque neque, in tempor erat mollis eu. Curabitur ut iaculis mi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris lacinia dui a egestas vehicula. Morbi et urna a nibh cursus accumsan. Fusce at est eget sem semper lobortis. Praesent neque felis, dapibus sagittis varius vitae, euismod non est.",
      "In malesuada auctor eleifend. Pellentesque molestie urna in libero interdum tincidunt. Cras fermentum et enim ac semper. Cras maximus turpis eget porta commodo. Nulla condimentum risus odio, vitae euismod ante ullamcorper et. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam condimentum ipsum volutpat justo tincidunt, at egestas velit malesuada. Vivamus scelerisque orci lacinia faucibus malesuada. Duis vestibulum maximus diam, vel aliquam mi aliquet vitae. Etiam malesuada lorem augue, quis porttitor nulla congue at. Pellentesque vitae malesuada felis, cursus sodales velit. Pellentesque faucibus facilisis turpis at fringilla. In commodo at mauris eu ornare. Praesent mi nunc, rutrum eget lobortis non, congue quis nisi.",
      "Nullam euismod augue condimentum, scelerisque libero vitae, suscipit ipsum. Mauris diam libero, porta at lacinia a, porttitor vel magna. Nunc vehicula tempus nibh, sit amet ornare ex posuere nec. Fusce ullamcorper imperdiet dolor non euismod. Duis rhoncus, felis ac placerat posuere, eros tortor volutpat ante, quis dapibus diam sem id risus. Praesent vel dignissim mauris. Duis vestibulum blandit nisi eu bibendum. Sed vitae justo ut felis eleifend efficitur sit amet eget ante. Mauris imperdiet magna mauris, sit amet porttitor lacus cursus vitae.",
      "Praesent sodales ligula orci, non congue orci ultricies sed. Etiam egestas efficitur ipsum pellentesque tincidunt. Mauris blandit odio quis ipsum tempus, id accumsan lorem egestas. Etiam suscipit venenatis sapien, eu laoreet enim. Sed elementum, ligula eu semper sodales, quam est facilisis urna, pellentesque auctor nunc risus quis lectus. Phasellus felis lectus, venenatis ut iaculis ut, dapibus finibus felis. Nullam quam tellus, sodales sed metus et, varius ullamcorper ante. Sed maximus eros sed mauris ultrices porttitor. Nunc ac velit eu lacus pharetra egestas et in dolor. Ut elementum euismod odio, a pellentesque augue viverra ac.",
      "Ut venenatis purus non malesuada consectetur. Mauris quis viverra lorem. Vestibulum congue quis nisl mollis dapibus. Quisque vitae sapien convallis, tristique nulla sit amet, rutrum odio. Curabitur ex lectus, rutrum nec tincidunt rhoncus, scelerisque consectetur enim. Mauris cursus nibh volutpat sodales fringilla. Donec dictum vulputate turpis, ac ultricies libero venenatis nec. Donec eleifend mauris tristique lectus porttitor tincidunt. Vestibulum id ornare ex. Praesent sit amet arcu quam. Morbi a leo ut ipsum rutrum luctus.",
      "Aliquam scelerisque lectus vel quam rutrum ultrices. Vivamus nec sagittis velit, at cursus enim. Sed tempor ac eros ut placerat. Donec porta justo vitae feugiat sodales. Ut consequat ipsum augue, rutrum porttitor felis iaculis id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed finibus enim nec faucibus tristique. Morbi sodales suscipit iaculis. Morbi sit amet nisl finibus, ultrices justo sed, rhoncus ex.",
      "Aenean sodales scelerisque ligula consequat semper. Sed consectetur tincidunt est, non pulvinar felis pretium vel. Cras consectetur, nulla a maximus consequat, massa dolor dignissim lacus, in facilisis turpis augue et eros. Pellentesque et ex vitae neque commodo suscipit. Suspendisse et ligula a ex sagittis tincidunt. Duis tempus suscipit ex, ac fermentum dui aliquam eget. Etiam ut magna metus. Aliquam erat volutpat. Sed sit amet ligula sed odio varius laoreet. Duis cursus massa in pellentesque lobortis. Pellentesque ut quam et dolor imperdiet bibendum. Morbi mauris metus, feugiat id leo ut, gravida laoreet nunc. Fusce ex leo, dapibus at dictum ut, aliquam nec odio. Mauris laoreet venenatis sollicitudin. Cras in dapibus nisi.",
      "In hac habitasse platea dictumst. Proin sed consequat lacus, in pretium augue. Phasellus maximus fringilla ipsum, eu viverra elit dapibus at. Vivamus odio sapien, varius ut facilisis nec, cursus non nisi. Praesent massa ligula, efficitur in tristique nec, finibus eu arcu. Etiam ut rutrum leo. Praesent et quam sed est faucibus vestibulum. Suspendisse eu libero non tellus tristique tincidunt ut nec elit. Fusce volutpat vel tortor ac ultricies. Praesent vitae ante purus. Nam commodo est orci, vel facilisis justo egestas at. Donec aliquam pharetra laoreet. Pellentesque elit nunc, laoreet sagittis mi ut, dapibus tempor odio. Duis eu laoreet nunc.",
      "Nullam consequat est vitae diam luctus lacinia. Quisque eget est luctus, pulvinar purus vitae, viverra arcu. Cras vel lobortis nisi, sit amet rutrum erat. Donec in lectus orci. Suspendisse accumsan ligula nibh, et interdum nisi aliquam id. Nunc posuere ut leo quis rutrum. Pellentesque ultrices massa quis libero faucibus, id pellentesque urna viverra. Nam sed egestas est, ac ultrices nunc. Vivamus urna mauris, iaculis a neque eu, facilisis pellentesque magna. Suspendisse fringilla eros id rhoncus finibus. Aenean non rutrum quam. Mauris porttitor, quam at faucibus facilisis, nisi arcu mollis dui, et ornare eros nisl id nunc. Maecenas feugiat tempor lorem a ullamcorper. Etiam at sapien nec lorem elementum molestie. Duis sed nisi viverra, commodo justo eget, commodo urna.",
      "Suspendisse sollicitudin ultrices dolor luctus tristique. Integer eget accumsan leo. Curabitur ac pretium eros. Etiam enim arcu, faucibus et aliquet in, congue sed magna. Nunc mi mi, vulputate ut consequat ut, commodo non nibh. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In ut leo vel ipsum commodo sollicitudin. Fusce quis lacus eget ante tincidunt gravida. Suspendisse feugiat efficitur venenatis."
    ];

    return  Scaffold(
        body: SafeArea(
            child: Container(
                child: ViewFrame(
                  top: Container(
                      width: size.width,
                      child: _buildScrollList(size, paragraphs)
                  ),
                  // top: _buildScrollList(size, paragraphs),
                  bottom: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    height: 120,
                    child: Column(
                      children:[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: RaisedButton(
                                color: Colors.blue,
                                onPressed: () => speedReset(),
                                child: Text('Reset Speed'),
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: RaisedButton(
                                color: Colors.blue,
                                onPressed: () => scroll(),
                                child: Text('Scroll/Stop'),
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: RaisedButton(
                                color: Colors.blue,
                                onPressed: () => speedUp(),
                                child: Text('Accelerate'),
                              )
                            )
                          ]
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Slider.adaptive(
                           divisions: 4,
                           value: (-0.25 * speedFactor + 1.25),
                           onChanged: (val) {
                              setState(() {
                                speedFactor = (-4 * val + 5).round();
                                scrolling = false;
                                scroll();
                              });
                          }),
                        )
                      ]
                  ),
                )
            )
        )
      )
    );
  }

  Widget _buildScrollList(Size size, List<String> paragraphs) {
    var children = <Widget>[
      Column(children: [
        Container(
            width: size.width,
            height: size.height/2
        ),
        ...paragraphs
            .map((paragraph) => Container(
            width: size.width,
            padding: EdgeInsets.all(5),
            child: Text(paragraph, style: TextStyle(fontSize: 30, color: Colors.black))))
            .toList(),
      ])
    ];

    return Container(
        child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollEndNotification) {
                _handleLooping();
              }
              return true;
            },
            child: ListView(controller: _scrollController, children: children)
        )
    );
  }


  void speedReset() {
    setState(() {
      speedFactor = 5;
      if (scrolling) {
        scrolling = false;
        scroll();
      }
    });
  }

  void speedUp() {

    if (scrolling) {
      setState(() {
        /// allow speed changes only if scrolling
        if ((speedFactor - 1) > 0) {
          speedFactor--;
        } else {
          speedFactor = 1;
        }
        scrolling = false;
        scroll();
      });
    }
  }

  void scroll() {

    if(!scrolling) {
      double maxScrollExtent = _scrollController.position.maxScrollExtent;

      int millisecondsLeft = (speedFactor *
          maxScrollExtent / maxScrollExtent *
          maxScrollExtent *
          (maxScrollExtent - _scrollController.offset) ~/
          maxScrollExtent)
          .toInt();

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        curve: Curves.linear,
        duration: Duration(milliseconds: millisecondsLeft),
      );
    } else {
      /// stop scrolling
      _scrollController.jumpTo(_scrollController.offset);
    }
    scrolling = !scrolling;
  }

  void _handleLooping() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent) {
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      if( _scrollController.position.activity is DrivenScrollActivity) {
        Timer(Duration(seconds: 1), () {
          _scrollController.animateTo(0, duration: Duration(seconds: 1),
              curve: Curves.decelerate).then((_) {
            scrolling = false;
            scroll();
          });
        });
      }
    }
  }
}
