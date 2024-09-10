import 'package:flutter/material.dart';
import 'package:t_store/featrues/sign_up/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SignUpViewBody(),
    );
  }
}
