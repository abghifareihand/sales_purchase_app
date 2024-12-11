import 'package:flutter/material.dart';
import 'package:sales_purchase_app/ui/components/custom_date_picker.dart';
import 'package:sales_purchase_app/ui/components/custom_text_field.dart';

import '../ui/components/custom_dropdown.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  DateTime? selectStartDate;
  DateTime? selectEndDate;
  String? selectedCategory;

  final List<String> productCategories = [
    'Electronics',
    'Clothing',
    'Food',
    'Beauty & Health',
    'Toys',
    'Furniture',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          CustomTextField(
            controller: titleController,
            label: 'Title',
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomDatePicker(
            initialDate: selectEndDate,
            label: 'Date',
            onDateSelected: (selectedDate) {
              selectEndDate = selectedDate;
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomDropdown(
            value: selectedCategory,
            items: const [
              'Electronics',
              'Clothing',
              'Food',
              'Beauty & Health',
              'Toys',
              'Furniture',
            ],
            label: 'Category',
            onChanged: (newCategory) {
              setState(() {
                selectedCategory = newCategory;
              });
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextField(
            controller: notesController,
            label: 'Notes',
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
