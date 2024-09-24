import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:t_store/core/app_router.dart';
import 'package:t_store/features/auth/sign_up/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              GoRouter.of(context).pushReplacement(AppRouter.kLogInView);
              },
            icon: const Icon(Icons.arrow_back)
        ),
        ),
      body: const SignUpViewBody(),
    );
  }
}
