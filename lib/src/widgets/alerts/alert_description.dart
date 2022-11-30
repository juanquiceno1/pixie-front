import 'package:flutter/material.dart';

class AlertDescription extends StatelessWidget {
  final String title;
  final String descriptionSucces;
  final VoidCallback succes;
  final String? content;
  final String? descriptionCancel;
  final VoidCallback? cancel;
  const AlertDescription(
      {Key? key,
      required this.title,
      required this.descriptionSucces,
      required this.succes,
      this.descriptionCancel,
      this.cancel,
      this.content})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      titleTextStyle: Theme.of(context).primaryTextTheme.headline6,
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (content != null)
            Text(
              content!,
              style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(),
            ),
        ],
      ),
      actions: <Widget>[
        if (descriptionCancel != null)
          TextButton(
            onPressed: cancel ?? () => Navigator.pop(context, false),
            child: Text(descriptionCancel!),
          ),
        TextButton(
          onPressed: succes,
          child: Text(descriptionSucces),
        ),
      ],
    );
  }
}
