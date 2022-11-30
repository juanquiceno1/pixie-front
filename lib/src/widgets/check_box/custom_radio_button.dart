import 'package:flutter/material.dart';

import '../../theme/colors.dart';

// abstract class CustomRadioButton {
//   static const radio = CustomRadio;
//   static const radioDescription = CustomRadioDescription;
// }

class CustomRadio extends StatelessWidget {
  final dynamic value;
  final dynamic groupValue;
  final void Function(dynamic)? onChanged;
  const CustomRadio(
      {Key? key, this.onChanged, required this.value, required this.groupValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Radio(
      value: value,
      activeColor: AppColors.secondaryColor,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}

class CustomRadioDescription extends StatelessWidget {
  final dynamic value;
  final dynamic groupValue;
  final void Function(dynamic)? onChanged;
  final String description;
  const CustomRadioDescription(
      {Key? key,
      required this.value,
      required this.groupValue,
      this.onChanged,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomRadio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
