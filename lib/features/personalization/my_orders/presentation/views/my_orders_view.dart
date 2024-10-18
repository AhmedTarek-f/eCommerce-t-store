import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/features/personalization/my_orders/presentation/views/widgets/my_orders_view_body.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(
        title: Text("My Orders".tr, style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: const MyOrdersViewBody(),
    );
  }
}
