import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sales_purchase_app/features/sales/main/sales_main_view_model.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/features/base_view.dart';
import 'package:sales_purchase_app/ui/shared/app_image.dart';

class SalesMainView extends StatelessWidget {
  const SalesMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SalesMainViewModel>(
      model: SalesMainViewModel(),
      onModelReady: (SalesMainViewModel model) => model.initModel(),
      onModelDispose: (SalesMainViewModel model) => model.disposeModel(),
      builder: (BuildContext context, SalesMainViewModel model, _) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: IndexedStack(
            index: model.selectedIndex,
            children: model.pages,
          ),
          bottomNavigationBar: const MainContent(),
        );
      },
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    final SalesMainViewModel model = Provider.of<SalesMainViewModel>(context);
    return Container(
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
          currentIndex: model.selectedIndex,
          backgroundColor: AppColor.white,
          selectedItemColor: AppColor.primary,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: model.onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: _getSvgIcon(
                AppImage.icHomeActive,
                AppImage.icHome,
                model.selectedIndex == 0,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _getSvgIcon(
                AppImage.icPersonActive,
                AppImage.icPerson,
                model.selectedIndex == 1,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
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
      width: 24.0,
      height: 24.0,
    );
  }
}