import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:t_store/features/auth/password_configuration/presentation/views/widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){GoRouter.of(context).pop();}, icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: const ResetPasswordViewBody(),
    );
  }
}
