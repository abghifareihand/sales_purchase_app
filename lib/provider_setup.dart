import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sales_purchase_app/core/api/base_api.dart';
import 'package:sales_purchase_app/core/api/url_api.dart';

List<SingleChildWidget> providers = <SingleChildWidget>[
  ...apiServices,
];

List<SingleChildWidget> apiServices = <SingleChildWidget>[
  Provider.value(
    value: BaseApi(
      Dio(
        BaseOptions(
          contentType: "application/json",
          baseUrl: UrlApi.baseUrl,
        ),
      ),
    ),
  ),
];
