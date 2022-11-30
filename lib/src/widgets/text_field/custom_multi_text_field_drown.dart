import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import 'input_decoration.dart';

class CustomMultiTextFieldDrown extends StatefulWidget {
  final String? description;
  final String? hintText;
  final Color? fillColor;
  final IconData? icon;
  final String? Function(String?)? validator;
  final SingleValueDropDownController? controller;
  final List<DropDownValueModel> items;
  final void Function(Object?)? onChanged;
  final void Function(Object?)? onSaved;

  const CustomMultiTextFieldDrown({
    Key? key,
    this.description,
    required this.items,
    this.onSaved,
    this.onChanged,
    this.hintText,
    this.fillColor,
    this.icon,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomMultiTextFieldDrown> createState() => _CustomMultiTextFieldDrownState();
}

class _CustomMultiTextFieldDrownState extends State<CustomMultiTextFieldDrown> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => DropDownTextField.multiSelection(
        dropDownList: widget.items,
        controller: widget.controller,
        clearOption: true,
        // enableSearch: widget.items.length > 6 ? true : false,
        clearIconProperty: IconProperty(color: AppColors.textColor),
        // searchDecoration: InputDecoration(
        //   hintText: 'Busqueda',
        //   hintStyle: Theme.of(context).primaryTextTheme.bodyText1,
        // ),
        dropDownIconProperty: IconProperty(
          icon: Icons.keyboard_arrow_down_rounded,
          color: AppColors.textColor,
        ),
        validator: widget.validator,
        dropDownItemCount: 6,
        onChanged: widget.onChanged,
        textFieldDecoration: InputDecoration(
          fillColor: widget.fillColor ?? AppColors.transparent,
          labelText: widget.description,
          hintText: widget.hintText,
          hintStyle: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                color: AppColors.hintColor,
                fontWeight: FontWeight.w400,
              ),
          hoverColor: AppColors.primaryLightColor.withOpacity(0.2),
          labelStyle: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                color: AppColors.hintColor,
                fontWeight: FontWeight.w400,
              ),
          alignLabelWithHint: true,
          isDense: false,
          border: DecorationInput().outline(color: AppColors.textColor),
          focusedBorder: DecorationInput().outline(color: AppColors.primaryColor),
          focusedErrorBorder: DecorationInput().outline(
            color: AppColors.red,
          ),
          disabledBorder: DecorationInput().outline(color: AppColors.textColor),
          enabledBorder: DecorationInput().outline(color: AppColors.textColor),
        ),
      );
}
