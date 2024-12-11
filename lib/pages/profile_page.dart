import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 16.0,
          ),
          ListTile(
            leading: ClipOval(
              child: CachedNetworkImage(
                imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Outdoors-man-portrait_%28cropped%29.jpg/800px-Outdoors-man-portrait_%28cropped%29.jpg',
                height: 50.0,
                width: 50.0,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            title: const Text(
              'Lorem Ipsum',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            subtitle: const Text('Engineer'),
          ),
          const SizedBox(
            height: 8.0,
          ),
          ListTile(
            onTap: () {},
            title: const Text(
              'Informasi Akun',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text('Informasi akun milikmu'),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () {},
            title: const Text(
              'Keluar Akun',
              style: TextStyle(
                color: AppColor.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text('Keluar dari akun kamu'),
            trailing: const Icon(
              Icons.chevron_right,
              color: AppColor.red,
            ),
          ),
        ],
      ),
    );
  }
}
