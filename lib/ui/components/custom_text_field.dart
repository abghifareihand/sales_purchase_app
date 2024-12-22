import 'package:flutter/material.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';
import '../shared/app_color.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;
  final void Function(String value)? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final bool showLabel;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final double borderRadius;
  final TextCapitalization textCapitalization;
  final String? helperText;
  final int maxLines;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    this.showLabel = true,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.textInputAction,
    this.borderRadius = 14.0,
    this.textCapitalization = TextCapitalization.none,
    this.helperText,
    this.maxLines = 1,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showLabel) ...[
          Text(
            widget.label,
            style: AppFont.bold.copyWith(
              color: AppColor.black,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12.0),
        ],
        TextFormField(
          cursorColor: AppColor.primary,
          style: AppFont.medium.copyWith(
            color: AppColor.black,
            fontSize: 14,
          ),
          textCapitalization: widget.textCapitalization,
          controller: widget.controller,
          onChanged: widget.onChanged,
          obscureText: _obscureText,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          readOnly: widget.readOnly,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            hintStyle: AppFont.regular.copyWith(
              color: AppColor.gray,
              fontSize: 14,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: AppColor.gray,
                    ),
                    onPressed: _toggleObscureText,
                  )
                : widget.suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(
                color: AppColor.stroke,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(
                color: AppColor.stroke,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(
                color: AppColor.primary,
                width: 2,
              ),
            ),
            hintText: widget.hintText ?? widget.label,
            helperText: widget.helperText,
          ),
        ),
      ],
    );
  }
}
