import 'package:flutter/material.dart';
import 'package:sales_purchase_app/features/auth/login/login_view.dart';
import 'package:sales_purchase_app/features/auth/splash/splash_view.dart';
import 'package:sales_purchase_app/features/purchasing/home/detail-product/detail_product_view.dart';
import 'package:sales_purchase_app/features/purchasing/main/purchasing_main_view.dart';
import 'package:sales_purchase_app/features/purchasing/profile/update-profile/update_profile_view.dart' as purchasing;
import 'package:sales_purchase_app/features/sales/home/add-product/add_product_view.dart';
import 'package:sales_purchase_app/features/sales/home/edit-product/edit_product_view.dart';
import 'package:sales_purchase_app/features/sales/home/edit-product/update-product/update_product_view.dart';
import 'package:sales_purchase_app/features/sales/main/sales_main_view.dart';
import 'package:sales_purchase_app/features/sales/profile/update-profile/update_profile_view.dart' as sales;
import 'app_routes.dart';

class AppPages {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // AUTH
      case AppRoutes.authSplash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case AppRoutes.authLogin:
        return MaterialPageRoute(builder: (_) => const LoginView());

      // PURCHASING
      case AppRoutes.purchasingMain:
        return MaterialPageRoute(builder: (_) => const PurchasingMainView());
      case AppRoutes.purchasingDetailProduct:
        final productId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => DetailProductView(
            productId: productId,
          ),
        );
      case AppRoutes.purchasingUpdateProfile:
        final args = settings.arguments! as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => purchasing.UpdateProfileView(
            username: args['username'],
            name: args['name'],
          ),
        );

      // SALES
      case AppRoutes.salesMain:
        return MaterialPageRoute(builder: (_) => const SalesMainView());
      case AppRoutes.salesAddProduct:
        return MaterialPageRoute(builder: (_) => const AddProductView());
      case AppRoutes.salesEditProduct:
        return MaterialPageRoute(builder: (_) => const EditProductView());
      case AppRoutes.salesUpdateProduct:
        final productId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => UpdateProductView(
            productId: productId,
          ),
        );
      case AppRoutes.salesUpdateProfile:
        final args = settings.arguments! as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => sales.UpdateProfileView(
            username: args['username'],
            name: args['name'],
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
