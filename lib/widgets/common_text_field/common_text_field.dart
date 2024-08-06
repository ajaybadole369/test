import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/app_utils.dart';
import '../../utils/color_picker.dart';
import '../../utils/constants/number_constants.dart';
import '../../utils/constants/string_constants.dart';

class CommonTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final List<String>? autofillHints;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final Color? labelColor;
  final Color? hintColor;
  final Color? underLineColor;
  final double? contentPadding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final bool autoFocus;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final FocusNode? focusNode;
  final double? height;
  final bool expands;
  final TextAlignVertical textAlignVertical;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final double? letterSpacing;

  const CommonTextField(
      {super.key,
      this.onChanged,
      this.onTap,
      this.onEditingComplete,
      this.focusNode,
      this.textEditingController,
      this.textInputType,
      this.textInputAction,
      this.autofillHints,
      this.labelText,
      this.hintText,
      this.errorText,
      this.labelColor,
      this.hintColor,
      this.underLineColor,
      this.contentPadding,
      this.suffixIcon,
      this.prefixIcon,
      this.obscureText = isFalse,
      this.autoFocus = isFalse,
      this.readOnly = isFalse,
      this.minLines,
      this.maxLines = NumberConstants.i1,
      this.height,
      this.expands = isFalse,
      this.textAlignVertical = TextAlignVertical.top,
      this.maxLength,
      this.inputFormatters,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        textAlignVertical: textAlignVertical,
        expands: expands,
        onEditingComplete: onEditingComplete,
        onTap: onTap,
        readOnly: readOnly,
        autofocus: autoFocus,
        maxLines: maxLines,
        minLines: minLines,
        focusNode: focusNode,
        controller: textEditingController,
        onChanged: (value) {
          if (onChanged != null) {
            onChanged!(value) ?? (value);
          }
        },
        obscureText: obscureText,
        autofillHints: autofillHints,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        onTapOutside: (value) => hideKeyboard(),
        decoration: InputDecoration(
          filled: isTrue,
          fillColor: Colors.grey.withOpacity(.2),
          alignLabelWithHint: isTrue,
          contentPadding: const EdgeInsets.fromLTRB(NumberConstants.d16,
              NumberConstants.d8, NumberConstants.d16, NumberConstants.d8),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: kTransparent)),
          disabledBorder: InputBorder.none,
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kTransparent)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kTransparent)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kTransparent)),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          labelText: labelText,
          errorText: errorText,
          errorStyle: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w500,
              fontSize: NumberConstants.d16,
              fontFamily: StringConstants.fontFamily),
          labelStyle: TextStyle(
            color: labelColor ?? primaryLabelColor,
            fontWeight: FontWeight.w500,
            fontSize: NumberConstants.d16,
            fontFamily: StringConstants.fontFamily,
          ),
          hintStyle: TextStyle(
            color: hintColor ?? secondaryLabelColor,
            fontWeight: FontWeight.w400,
            fontSize: NumberConstants.d16,
            fontFamily: StringConstants.fontFamily,
          ),
        ),
        style: TextStyle(
          letterSpacing: letterSpacing,
          fontSize: NumberConstants.d16,
          color: kBlack,
          fontWeight: FontWeight.w400,
          fontFamily: StringConstants.fontFamily,
        ),
      ),
    );
  }
}
