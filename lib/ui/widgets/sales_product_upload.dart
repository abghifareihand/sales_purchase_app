import 'package:flutter/material.dart';

class SalesProductUpload extends StatelessWidget {
  final VoidCallback onGallerySelected;
  final VoidCallback onCameraSelected;

  const SalesProductUpload({
    super.key,
    required this.onGallerySelected,
    required this.onCameraSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text('Select from gallery'),
            onTap: () {
              Navigator.pop(context);
              onGallerySelected();
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take photo with camera'),
            onTap: () {
              Navigator.pop(context);
              onCameraSelected();
            },
          ),
        ],
      ),
    );
  }
}
