import 'package:flutter/material.dart';
import 'package:sales_purchase_app/ui/extensions/date_time_ext.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';

import '../shared/app_color.dart';

class CustomDatePicker extends StatefulWidget {
  final void Function(DateTime selectedDate)? onDateSelected;
  final DateTime? initialDate;
  final Widget? prefix;
  final String label;
  final bool showLabel;
  final String? hintText;
  final double borderRadius;

  const CustomDatePicker({
    super.key,
    required this.label,
    this.showLabel = true,
    this.initialDate,
    this.onDateSelected,
    this.prefix,
    this.hintText,
    this.borderRadius = 14.0,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late TextEditingController controller;
  late DateTime selectedDate;

  @override
  void initState() {
    controller = TextEditingController(
      text: widget.initialDate?.toFormattedDate(),
    );
    selectedDate = widget.initialDate ?? DateTime.now();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        controller.text = selectedDate.toFormattedDate();
      });
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(picked);
      }
    }
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
          controller: controller,
          onTap: () => _selectDate(context),
          readOnly: true,
          style: AppFont.medium.copyWith(
            color: AppColor.black,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(color: AppColor.stroke),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(color: AppColor.stroke),
            ),
            suffixIcon: const Icon(Icons.date_range),
            hintText: widget.initialDate != null ? selectedDate.toFormattedDate() : widget.hintText ?? widget.label,
          ),
        ),
      ],
    );
  }
}
