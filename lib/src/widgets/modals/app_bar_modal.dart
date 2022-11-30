import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../theme/colors.dart';

class AppBarModal extends StatelessWidget {
  final String? title;

  const AppBarModal({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            height: 5,
            width: MediaQuery.of(context).size.width * 0.3,
            margin: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title ?? 'Seleccione',
                    style: Theme.of(context).primaryTextTheme.subtitle1,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    color: Theme.of(context).iconTheme.color,
                  ),
                )
              ],
            ),
          )
        ],
      );
}
