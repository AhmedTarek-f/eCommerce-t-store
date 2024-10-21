import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/features/personalization/my_coupons/presentation/views/widgets/my_coupons_view_body.dart';

class MyCouponsView extends StatelessWidget {
  const MyCouponsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title:  Text("My Coupons".tr ,style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: const MyCouponsViewBody(),
    );
  }
}
