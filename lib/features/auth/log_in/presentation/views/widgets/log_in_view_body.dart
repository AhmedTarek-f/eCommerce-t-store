import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/t_form_divider.dart';
import 'package:t_store/common_widgets/t_social_buttons.dart';
import 'package:t_store/features/auth/log_in/presentation/views/widgets/t_log_in_form.dart';
import 'package:t_store/features/auth/log_in/presentation/views/widgets/t_log_in_header.dart';


class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.sizeOf(context).height*0.0653,
            bottom: MediaQuery.sizeOf(context).height*0.0280,
          right: MediaQuery.sizeOf(context).width *0.0611,
          left: MediaQuery.sizeOf(context).width *0.0611,
        ),
        child: const Column(
          children: [
             TLogInHeader(),
             TLogInForm(),
             TFormDivider(dividerText:"Or Sign In With"),
             SizedBox(height: 32,),
             TSocialButtons()
          ],
        ),
      ),
    );
  }
}




