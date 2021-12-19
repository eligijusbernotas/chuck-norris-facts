import 'package:flutter/cupertino.dart';

Widget topCenterAlignedLayoutBuilder(Widget? currentChild, List<Widget> previousChildren) => Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        ...previousChildren,
        if (currentChild != null) currentChild,
      ],
    );
