import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/colors.dart';
import 'input_decoration.dart';

class TextFieldText extends StatefulWidget {
  final String? description;
  final Color? colorDescription;
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final bool? readOnly;
  final bool? isDense;
  final EdgeInsets? contentPadding;
  final VoidCallback? onTap;
  final void Function(String?)? onSaved;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final FocusNode focusNode;
  final FocusNode? focusNext;
  final AutovalidateMode? validateMode;
  final TextInputType? inputType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? inputAction;
  final List<TextInputFormatter>? formatter;
  final String? helperText;
  final String? icon;
  final String? iconSuffix;
  final Color? iconColor;
  final Color? fillColor;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? prefix;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  const TextFieldText({
    Key? key,
    required this.focusNode,
    this.description,
    this.colorDescription,
    this.focusNext,
    this.onSaved,
    this.validator,
    this.inputAction,
    this.textCapitalization,
    this.inputType,
    this.validateMode,
    this.readOnly,
    this.onTap,
    this.controller,
    this.initialValue,
    this.formatter,
    this.onFieldSubmitted,
    this.icon,
    this.iconSuffix,
    this.iconColor,
    this.obscureText,
    this.fillColor,
    this.onChanged,
    this.hintText,
    this.suffixIcon,
    this.suffix,
    this.prefixIcon,
    this.prefix,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.isDense,
    this.contentPadding,
    this.helperText,
  }) : super(key: key);
  @override
  State<TextFieldText> createState() => _TextFieldTextState();
}

class _TextFieldTextState extends State<TextFieldText> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        readOnly: widget.readOnly ?? false,
        initialValue: widget.initialValue,
        onChanged: widget.onChanged,
        onTap: widget.onTap ??
            () {
              setState(() {
                FocusScope.of(context).unfocus();
                FocusScope.of(context).requestFocus(widget.focusNode);
              });
            },
        textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
        obscureText: widget.obscureText ?? false,
        keyboardType: widget.inputType ?? TextInputType.text,
        maxLength: widget.maxLength,
        minLines: widget.minLines != null
            ? widget.minLines!
            : widget.inputType == TextInputType.multiline
                ? 1
                : 1,
        maxLines: widget.maxLines != null
            ? widget.maxLines!
            : widget.inputType == TextInputType.multiline
                ? 100
                : 1,
        textInputAction: widget.inputAction ?? TextInputAction.done,
        onFieldSubmitted: widget.onFieldSubmitted ??
            (value) {
              setState(() {
                if (widget.focusNext != null) {
                  FocusScope.of(context).requestFocus(widget.focusNext);
                } else {
                  FocusScope.of(context).unfocus();
                }
              });
            },
        style: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
              color: widget.colorDescription != null
                  ? widget.colorDescription ?? AppColors.hintColor
                  : AppColors.textColor,
              fontWeight: FontWeight.w400,
            ),
        decoration: InputDecoration(
          fillColor: widget.fillColor ?? AppColors.transparent,
          labelText: widget.description,
          hintText: widget.hintText,
          errorMaxLines: 3,
          hoverColor: AppColors.primaryLightColor.withOpacity(0.2),
          hintStyle: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                color: AppColors.hintColor,
                fontWeight: FontWeight.w400,
              ),
          helperText: widget.helperText,
          helperStyle: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                color: AppColors.hintColor,
                fontWeight: FontWeight.w400,
              ),
          contentPadding: widget.contentPadding,
          isDense: widget.isDense ?? false,
          suffixIcon: widget.suffixIcon,
          suffix: widget.suffix,
          prefixIcon:
              widget.prefixIcon != null ? icon(IconPosition.left, widget.prefixIcon!) : null,
          prefix: widget.prefix,
          border: DecorationInput().outline(color: AppColors.textColor),
          focusedBorder: DecorationInput().outline(color: AppColors.primaryColor),
          focusedErrorBorder: DecorationInput().outline(
            color: AppColors.red,
          ),
          disabledBorder: DecorationInput().outline(color: AppColors.textColor),
          enabledBorder: DecorationInput().outline(color: AppColors.textColor),
        ),
        inputFormatters: widget.formatter ?? <TextInputFormatter>[],
        autovalidateMode: widget.validateMode ?? AutovalidateMode.disabled,
        validator: widget.validator,
        onSaved: widget.onSaved,
      );

  Widget icon(IconPosition position, Widget child) {
    return Padding(
      padding: EdgeInsets.only(
          left: position == IconPosition.left ? 8 : 5,
          right: position == IconPosition.right ? 5 : 8),
      child: child,
    );
  }
}

enum IconPosition { left, right }
