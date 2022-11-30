import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../images/custom_image.dart';

class CustomAlert extends StatelessWidget {
  final String image;
  final String title;
  final String? subtitle;

  const CustomAlert({
    Key? key,
    required this.image,
    required this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(defaultBorderRadius)),
      contentPadding: EdgeInsets.all(0),
      iconPadding: EdgeInsets.zero,
      icon: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: CustomImage(image: image, height: 60),
          ),
          Transform.translate(
            offset: const Offset(5, -15),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                icon: Icon(
                  Icons.close_rounded,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                ),
              ),
            ),
          ),
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 10),
            child: Text(
              title,
              style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          if (subtitle != null)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                subtitle!,
                style: Theme.of(context).primaryTextTheme.caption,
                textAlign: TextAlign.center,
              ),
            ),
          SizedBox(height: 17),
        ],
      ),
    );
  }
}
