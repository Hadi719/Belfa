import 'package:flutter/material.dart';

const double _kAppBarElevation = 16.0;

AppBar bfAppBar({required String appBarTitle}) => AppBar(
      title: Text(appBarTitle),
      elevation: _kAppBarElevation,
    );
