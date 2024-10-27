import 'package:flutter/material.dart';

const double _kAppBarElevation = 16.0;

AppBar belfaAppBar({
  required String appBarTitle,
  Widget? leading,
  List<Widget>? actions,
}) =>
    AppBar(
      title: Text(appBarTitle),
      elevation: _kAppBarElevation,
      leading: leading,
      actions: [
        if (actions != null) ...actions,
      ],
    );
