import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final void Function()? onPressed;
  final Widget? suffix;
  const CustomAppBar({Key? key, this.title, this.onPressed, this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            if (GoRouter.of(context).canPop())
              IconButton(
                onPressed: onPressed ??
                    () {
                      context.pop();
                    },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                  size: Theme.of(context).appBarTheme.iconTheme!.size,
                ),
              ),
            Expanded(
              child: Text(
                title ?? 'Volver',
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ),
            if (suffix != null) suffix!
          ],
        ),
      ),
    );
  }
}
