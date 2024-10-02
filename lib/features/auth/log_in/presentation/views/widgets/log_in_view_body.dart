import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/t_form_divider.dart';
import 'package:t_store/common_widgets/t_social_buttons.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/auth/log_in/presentation/views/widgets/t_log_in_form.dart';
import 'package:t_store/features/auth/log_in/presentation/views/widgets/t_log_in_header.dart';
import 'package:t_store/features/auth/log_in/presentation/views_model/log_in_controller.dart';


class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final LogInController logInController = Get.put(LogInController());
    return  SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.sizeOf(context).height*0.0653,
            bottom: MediaQuery.sizeOf(context).height*0.0280,
          right: MediaQuery.sizeOf(context).width *0.0611,
          left: MediaQuery.sizeOf(context).width *0.0611,
        ),
        child:  Column(
          children: [
            const TLogInHeader(),
            const TLogInForm(),
            const TFormDivider(dividerText:"Or Sign In With"),
            const SizedBox(height: 32,),
             TSocialButtons(
               googleOnPressed: ()async{
                 await logInController.googleSignIn();
               },
             )
          ],
        ),
      ),
    );
  }
}




