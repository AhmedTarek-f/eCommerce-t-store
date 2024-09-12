import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:t_store/core/app_router.dart';
import 'package:t_store/featrues/verify_email/presentation/views/widgets/verify_email_view_body.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
        IconButton(onPressed: (){GoRouter.of(context).pushReplacement(AppRouter.kLogInView);}, icon: const Icon(CupertinoIcons.clear))
      ],
      ),
      body:const VerifyEmailViewBody(),
    );
  }
}
