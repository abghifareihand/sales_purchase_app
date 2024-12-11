import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_purchase_app/provider_setup.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';
import 'package:sales_purchase_app/ui/routes/app_routes.dart';
import 'package:sales_purchase_app/ui/routes/app_pages.dart' as route;

import 'ui/shared/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sales Purchase App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
          scaffoldBackgroundColor: AppColor.white,
          dialogBackgroundColor: AppColor.white,
          appBarTheme: AppBarTheme(
            color: AppColor.white,
            elevation: 0,
            titleTextStyle: AppFont.semiBold.copyWith(
              color: AppColor.primary,
              fontSize: 18,
            ),
            iconTheme: const IconThemeData(
              color: AppColor.black,
            ),
            centerTitle: true,
          ),
        ),
        initialRoute: AppRoutes.authSplash,
        onGenerateRoute: route.AppPages.generateRoute,
      ),
    );
  }
}
