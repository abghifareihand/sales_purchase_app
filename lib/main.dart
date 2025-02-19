import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_purchase_app/core/services/fcm_service.dart';
import 'package:sales_purchase_app/core/services/remote_service.dart';
import 'package:sales_purchase_app/provider_setup.dart';
import 'package:sales_purchase_app/ui/routes/app_routes.dart';
import 'package:sales_purchase_app/ui/routes/app_pages.dart' as route;
import 'ui/shared/app_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FcmService().initialize();
  await RemoteConfigService().initialize();
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
          scaffoldBackgroundColor: AppColor.white,
          dialogBackgroundColor: AppColor.white,
          useMaterial3: false,
        ),
        initialRoute: AppRoutes.authSplash,
        onGenerateRoute: route.AppPages.generateRoute,
      ),
    );
  }
}
