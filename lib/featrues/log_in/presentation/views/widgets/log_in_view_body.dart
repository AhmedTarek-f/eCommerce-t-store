import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:t_store/featrues/log_in/presentation/views/widgets/t_form_divider.dart';
import 'package:t_store/featrues/log_in/presentation/views/widgets/t_log_in_form.dart';
import 'package:t_store/featrues/log_in/presentation/views/widgets/t_log_in_header.dart';
import 'package:t_store/featrues/log_in/presentation/views/widgets/t_social_buttons.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return  SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.sizeOf(context).height*0.0653,
            bottom: MediaQuery.sizeOf(context).height*0.0280,
          right: MediaQuery.sizeOf(context).width *0.0611,
          left: MediaQuery.sizeOf(context).width *0.0611,
        ),
        child: Column(
          children: [
            TLogInHeader(isDark: isDark),
            const TLogInForm(),
             TFormDivider(isDark: isDark),
            const SizedBox(height: 32,),
            const TSocialButtons()
          ],
        ),
      ),
    );
  }
}




