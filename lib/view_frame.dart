import 'package:flutter/widgets.dart';

class ViewFrame extends StatelessWidget {

  final Widget top;
  final Widget bottom;
  const ViewFrame({Key key, this.top, this.bottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Expanded(
                child: top
            ),
            bottom
          ],
        )
    );
  }
}
