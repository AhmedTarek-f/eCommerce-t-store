import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/features/personalization/profile/presentation/views/widgets/change_name_view_body.dart';

class ChangeNameView extends StatelessWidget {
  const ChangeNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text("Change Name"),showBackArrow: true,),
      body: ChangeNameViewBody(),
    );
  }
}
