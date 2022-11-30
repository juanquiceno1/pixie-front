import 'package:flutter/material.dart';

import '../theme/colors.dart';

enum Active { active, inactive }

enum Option { yes, no }

const defaultPadding = 16.0;
const defaultElevation = 8.0;
const defaultBorderRadius = 8.0;
const defaultBorderRadiusCheck = 4.0;

const imageTest =
    'https://i.picsum.photos/id/1005/5760/3840.jpg?hmac=2acSJCOwz9q_dKtDZdSB-OIK1HUcwBeXco_RMMTUgfY';
const errorServer = 'Upss, hubo un porblema con el servidor';
const errorData = 'Upps, tenemos problemas con unos datos';

class Utils {
  static BoxShadow customBoxShadow = BoxShadow(
    color: AppColors.grey.withOpacity(0.5),
    spreadRadius: 1,
    blurRadius: 7,
    offset: Offset(0, 3), // changes position of shadow
  );
}
