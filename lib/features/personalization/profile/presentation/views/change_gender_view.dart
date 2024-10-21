import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/features/personalization/profile/presentation/views/widgets/change_gender_view_body.dart';
import 'package:t_store/features/personalization/profile/presentation/views/widgets/change_phone_number_view_body.dart';

class ChangeGenderView extends StatelessWidget {
  const ChangeGenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text("Change Gender"),showBackArrow: true,),
      body: ChangeGenderViewBody(),
    );
  }
}
