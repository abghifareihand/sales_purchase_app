import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sales_purchase_app/features/sales/profile/sales_profile_view_model.dart';
import 'package:sales_purchase_app/ui/components/custom_logout_dialog.dart';
import 'package:sales_purchase_app/ui/routes/app_routes.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/features/base_view.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';
import 'package:sales_purchase_app/ui/shared/app_image.dart';
import 'package:sales_purchase_app/ui/shared/app_utils.dart';
import 'package:sales_purchase_app/ui/widgets/profile_tile.dart';

class SalesProfileView extends StatelessWidget {
  const SalesProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SalesProfileViewModel>(
      model: SalesProfileViewModel(
        baseApi: Provider.of(context),
      ),
      onModelReady: (SalesProfileViewModel model) => model.initModel(),
      onModelDispose: (SalesProfileViewModel model) => model.disposeModel(),
      builder: (BuildContext context, SalesProfileViewModel model, _) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: model.isBusy
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primary,
                  ),
                )
              : const ProfileContent(),
        );
      },
    );
  }
}

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    final SalesProfileViewModel model = Provider.of<SalesProfileViewModel>(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(
            height: 80.0,
          ),
          SvgPicture.asset(
            AppImage.icPersonActive,
            width: 120,
            height: 120,
            colorFilter: const ColorFilter.mode(
              AppColor.primary,
              BlendMode.srcIn,
            ),
          ),
          Text(
            model.user!.name,
            style: AppFont.semiBold.copyWith(
              color: AppColor.black,
              fontSize: 24,
            ),
          ),
          Text(
            AppUtils.getRoleString(model.user!.role),
            style: AppFont.semiBold.copyWith(
              color: AppColor.primary,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColor.gray.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                ProfileTile(
                  icon: AppImage.icAccount,
                  title: 'My Account',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.salesUpdateProfile,
                      arguments: {
                        'username': model.user!.username,
                        'name': model.user!.name,
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 24.0,
                ),
                ProfileTile(
                  icon: AppImage.icHelp,
                  title: 'Help & Support',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 24.0,
                ),
                ProfileTile(
                  icon: AppImage.icAbout,
                  title: 'About App',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 24.0,
                ),
                ProfileTile(
                  icon: AppImage.icLogout,
                  title: 'Logout',
                  onTap: () async {
                    await showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return CustomLogoutDialog(
                          onPressed: () => model.logout(context),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
