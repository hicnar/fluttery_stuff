
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

mixin PlatformUtils {

  void togglePlatform() {
    debugDefaultTargetPlatformOverride =
    isIos ? TargetPlatform.android : TargetPlatform.iOS;
    WidgetsBinding.instance.reassembleApplication();
  }

  bool get isIos => defaultTargetPlatform == TargetPlatform.iOS;
}
