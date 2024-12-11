import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_purchase_app/ui/shared/app_image.dart';
import 'package:sales_purchase_app/pages/history_page.dart';
import 'package:sales_purchase_app/pages/home_page.dart';
import 'package:sales_purchase_app/pages/profile_page.dart';

import '../ui/shared/app_color.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const HistoryPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getSvgIcon(String iconActive, String iconDefault, bool isActive) {
    return SvgPicture.asset(
      isActive ? iconActive : iconDefault,
      colorFilter: isActive
          ? const ColorFilter.mode(
              AppColor.primary,
              BlendMode.srcIn,
            )
          : const ColorFilter.mode(
              AppColor.gray,
              BlendMode.srcIn,
            ),
      width: 24.0, // Icon size
      height: 24.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColor.gray.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            backgroundColor: AppColor.white,
            selectedItemColor: AppColor.primary,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: _getSvgIcon(
                  AppImage.icHomeActive,
                  AppImage.icHome,
                  _selectedIndex == 0,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _getSvgIcon(
                  AppImage.icTransactionActive,
                  AppImage.icTransaction,
                  _selectedIndex == 1,
                ),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: _getSvgIcon(
                  AppImage.icProfileActive,
                  AppImage.icProfile,
                  _selectedIndex == 2,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
