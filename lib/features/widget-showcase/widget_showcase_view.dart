import 'package:flutter/material.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/features/base_view.dart';
import 'package:sales_purchase_app/features/widget-showcase/widget_showcase_view_model.dart';

class WidgetShowcaseView extends StatelessWidget {
  const WidgetShowcaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<WidgetShowcaseViewModel>(
      model: WidgetShowcaseViewModel(),
      onModelReady: (WidgetShowcaseViewModel model) => model.initModel(),
      onModelDispose: (WidgetShowcaseViewModel model) => model.disposeModel(),
      builder: (BuildContext context, WidgetShowcaseViewModel model, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Title'),
          ),
          backgroundColor: AppColor.background,
          body: model.isBusy
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primary,
                  ),
                )
              : const WidgetShowcaseContent(),
        );
      },
    );
  }
}

class WidgetShowcaseContent extends StatelessWidget {
  const WidgetShowcaseContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(),
    );
  }
}
