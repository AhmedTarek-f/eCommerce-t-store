import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/features/personalization/profile/presentation/views/widgets/change_phone_number_view_body.dart';

class ChangePhoneNumberView extends StatelessWidget {
  const ChangePhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(title: Text("Change Phone Number".tr),showBackArrow: true,),
      body: const ChangePhoneNumberViewBody(),
    );
  }
}
