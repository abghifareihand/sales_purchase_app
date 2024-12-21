import 'package:flutter/material.dart';

class CustomLoadingDialog extends StatelessWidget {
  final Color color;
  const CustomLoadingDialog({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: SizedBox(
              height: 32,
              width: 32,
              child: CircularProgressIndicator(
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
