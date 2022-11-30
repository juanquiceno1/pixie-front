import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../utils/responsive.dart';

class LoadingLogo extends StatelessWidget {
  const LoadingLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor.withOpacity(0.9),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/Logo-iexpert-2.png',
              height: size.height * 0.1,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              width: Responsive.isMobile(context)
                  ? size.width * 0.60
                  : size.width * 0.30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: LinearProgressIndicator(
                  minHeight: 5,
                  backgroundColor: AppColors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            Text(
              'Cargando...',
              style: Theme.of(context).primaryTextTheme.subtitle2,
            ),
          ],
        ),
      ],
    );
  }
}
