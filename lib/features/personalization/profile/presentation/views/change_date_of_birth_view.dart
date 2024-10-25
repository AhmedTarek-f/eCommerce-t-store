import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/features/personalization/profile/presentation/views/widgets/change_date_of_birth_view_body.dart';

class ChangeDateOfBirthView extends StatelessWidget {
  const ChangeDateOfBirthView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(title: Text("Change Date Of Birth".tr),showBackArrow: true,),
      body: const ChangeDateOfBirthViewBody(),
    );
  }
}
