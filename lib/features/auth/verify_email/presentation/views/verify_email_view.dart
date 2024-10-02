import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/auth/log_in/presentation/views/log_in_view.dart';
import 'package:t_store/features/auth/verify_email/presentation/views/widgets/verify_email_view_body.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key, required this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
        IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
          icon: const Icon(CupertinoIcons.clear),
        ),
      ],
      ),
      body:VerifyEmailViewBody(email: email,),
    );
  }
}
