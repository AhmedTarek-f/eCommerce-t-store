import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/features/personalization/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Profile".tr),
        showBackArrow: true,
      ),
      body: const ProfileViewBody(),
    );
  }
}
