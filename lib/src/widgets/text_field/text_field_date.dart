import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import 'input_decoration.dart';

class TextFieldDate extends StatelessWidget {
  final String? description;
  final String? hintText;
  final Color? fillColor;
  final String? dateMask;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  const TextFieldDate(
      {Key? key,
      this.description,
      this.hintText,
      this.fillColor,
      this.dateMask,
      required this.initialDate,
      required this.firstDate,
      required this.lastDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      type: DateTimePickerType.date,
      locale: Locale('es', 'ES'),
      dateMask: 'dd/MM/yyyy',
      // dateMask: 'd - MMMM - yyyy - hh:mm a',
      use24HourFormat: true,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      // icon: ,

      decoration: InputDecoration(
        alignLabelWithHint: true,
        isDense: true,
        fillColor: fillColor ?? AppColors.transparent,
        hintText: hintText ?? '',
        hintStyle: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
              color: AppColors.hintColor,
              fontWeight: FontWeight.w400,
            ),
        border: DecorationInput().outline(color: AppColors.textColor),
        focusedBorder: DecorationInput().outline(color: AppColors.primaryColor),
        focusedErrorBorder: DecorationInput().outline(
          color: AppColors.red,
        ),
        disabledBorder: DecorationInput().outline(color: AppColors.textColor),
        enabledBorder: DecorationInput().outline(color: AppColors.textColor),
      ),
      timePickerEntryModeInput: false,
      // validator: widget.validator,
      // onChanged: widget.onChanged,
      // onSaved: widget.onSaved,
    );
  }
}
