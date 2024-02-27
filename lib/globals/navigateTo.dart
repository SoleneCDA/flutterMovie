import 'package:flutter/material.dart';

navigateTo(Widget view, BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => view,
    ),
  );
}
