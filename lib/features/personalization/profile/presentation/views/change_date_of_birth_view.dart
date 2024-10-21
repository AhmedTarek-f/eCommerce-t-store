import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/features/personalization/profile/presentation/views/widgets/change_date_of_birth_view_body.dart';
import 'package:t_store/features/personalization/profile/presentation/views/widgets/change_phone_number_view_body.dart';

class ChangeDateOfBirthView extends StatelessWidget {
  const ChangeDateOfBirthView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text("Change Date Of Birth"),showBackArrow: true,),
      body: ChangeDateOfBirthViewBody(),
    );
  }
}
