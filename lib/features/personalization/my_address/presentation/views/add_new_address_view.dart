import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/features/personalization/my_address/presentation/views/widgets/add_new_address_view_body.dart';

class AddNewAddressView extends StatelessWidget {
  const AddNewAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(
        title: Text("Add new Address".tr),
        showBackArrow: true,
      ),
      body: const AddNewAddressViewBody(),
    );
  }
}
