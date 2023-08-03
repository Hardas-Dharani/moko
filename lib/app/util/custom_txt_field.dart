import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? initialValue;
  final double? width;
  final double height;
  final String? hintText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool autocorrect;
  final bool enableSuggestions;
  final bool autovalidate;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final int? maxEnforcedLines;
  final int? minEnforcedLines;
  final bool enabled;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final TextCapitalization textCapitalization;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final bool? expands;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final List<TextInputFormatter>? onInputFormattersChanged;
  final VoidCallback? onEditingCompleteAndSubmitted;

  CustomTextField({
    required this.controller,
    this.initialValue,
    this.hintText,
    this.prefixIconData,
    this.suffixIconData,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.autovalidate = false,
    this.maxLines = 1,
    this.minLines,
    this.width = 343,
    this.height = 59.0,
    this.maxLength,
    this.maxEnforcedLines,
    this.minEnforcedLines,
    this.enabled = true,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.textCapitalization = TextCapitalization.none,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.expands,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.onInputFormattersChanged,
    this.onEditingCompleteAndSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      // padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(33),
        color: Colors.transparent,
      ),
      child: TextField(
        controller: controller,
        // initialValue: initialValue,
        obscureText: obscureText,
        autocorrect: autocorrect,
        enableSuggestions: enableSuggestions,
        // autovalidate: autovalidate,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        // maxEnforcedLines: maxEnforcedLines,
        // minEnforcedLines: minEnforcedLines,
        enabled: enabled,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        style: style,
        textCapitalization: textCapitalization,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textAlignVertical: textAlignVertical,
        textDirection: textDirection,
        readOnly: readOnly,
        toolbarOptions: toolbarOptions,
        showCursor: showCursor,
        buildCounter: buildCounter,
        scrollPhysics: scrollPhysics,
        autofillHints: autofillHints,
        expands: expands ?? false,
        onEditingComplete: onEditingComplete,
        onSubmitted: onSubmitted,
        onAppPrivateCommand: onAppPrivateCommand,
        inputFormatters: onInputFormattersChanged,
        // onInputFormattersChanged: onInputFormattersChanged,
        onChanged: (value) {
          // You can add your custom onChanged logic here if needed.
        },
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(10),
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
          border: InputBorder.none,
          prefixIcon: prefixIconData != null
              ? Icon(
                  prefixIconData,
                  color: Colors.white,
                  size: 20,
                )
              : prefixIcon,
          suffixIcon: suffixIconData != null
              ? Icon(suffixIconData, color: Colors.white)
              : suffixIcon,
        ),
      ),
    );
  }
}
