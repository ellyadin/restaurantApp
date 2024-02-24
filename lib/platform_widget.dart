import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PlatformWidget extends StatelessWidget {
  const PlatformWidget({
    super.key,
    required this.androidBuilder,
    required this.iosBuilder,
  });

  final WidgetBuilder androidBuilder;
  final WidgetBuilder iosBuilder;

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      // case TargetPlatform.android:
      //   return androidBuilder(context);
      // case TargetPlatform.iOS:
      //   return iosBuilder(context);
      default:
        return androidBuilder(context);
    }
  }
}
