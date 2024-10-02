import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/t_form_divider.dart';
import 'package:t_store/common_widgets/t_social_buttons.dart';
import 'package:t_store/features/auth/sign_up/presentation/views/widgets/t_sign_up_form.dart';
import 'package:t_store/features/auth/sign_up/presentation/views_model/sign_up_controller.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody ({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.put(SignUpController());
    return  SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height*0.0280 ,
          bottom: MediaQuery.sizeOf(context).height*0.0280,
          right: MediaQuery.sizeOf(context).width *0.0611,
          left: MediaQuery.sizeOf(context).width *0.0611,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Let's create your account",style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: 32,),
            const TSignUpForm(),
            const SizedBox(height: 32,),
            const TFormDivider(dividerText: "Or Sign Up With"),
            const SizedBox(height: 32,),
            TSocialButtons(googleOnPressed: () {
              signUpController.signUpWithGoogle();
            },),
          ],
        ),
      ),
    );
  }
}


