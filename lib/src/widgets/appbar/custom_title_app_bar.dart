import 'package:flutter/material.dart';

class CustomTitleAppBar extends StatelessWidget {
  final String title;
  const CustomTitleAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-15, 0),
      child: Text(title),
    );
  }
}
