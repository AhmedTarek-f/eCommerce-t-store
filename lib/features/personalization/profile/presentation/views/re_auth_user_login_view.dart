import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/features/personalization/profile/presentation/views/widgets/re_auth_user_login_view_body.dart';

class ReAuthUserLoginView extends StatelessWidget {
  const ReAuthUserLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title:  Text("Re-Authenticate User"),
        showBackArrow: true,
      ),
      body: ReAuthUserLoginViewBody(),
    );
  }
}
