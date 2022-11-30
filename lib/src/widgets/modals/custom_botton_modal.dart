import 'package:flutter/material.dart';
import 'app_bar_modal.dart';

class CustomButtonModal extends StatelessWidget {
  final String? title;
  final Widget? widget;
  const CustomButtonModal({
    Key? key,
    this.title,
    this.widget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          minHeight: MediaQuery.of(context).size.height * 0.3,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AppBarModal(
              title: title,
            ),
            if (widget != null)
              Flexible(
                child: SingleChildScrollView(
                  child: widget,
                ),
              )
          ],
        ),
      );

  static RoundedRectangleBorder style(BuildContext context) {
    return RoundedRectangleBorder(
      side: BorderSide(
        color: Theme.of(context).cardColor,
        width: 1,
      ),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        topLeft: Radius.circular(25),
      ),
    );
  }
}
