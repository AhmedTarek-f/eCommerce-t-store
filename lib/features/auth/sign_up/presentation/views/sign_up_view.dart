import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/auth/sign_up/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Get.back();
              },
            icon: const Icon(Icons.arrow_back)
        ),
        ),
      body: const SignUpViewBody(),
    );
  }
}
