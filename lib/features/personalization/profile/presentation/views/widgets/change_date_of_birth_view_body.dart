import 'package:flutter/material.dart';
import 'package:t_store/features/personalization/profile/presentation/views/widgets/change_date_of_birth_form.dart';

class ChangeDateOfBirthViewBody extends StatelessWidget {
  const ChangeDateOfBirthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.sizeOf(context).width*0.0611,
            left: MediaQuery.sizeOf(context).width*0.0611,
            top: MediaQuery.sizeOf(context).height*0.0280,
            bottom: MediaQuery.sizeOf(context).height*0.0280,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height*0.2,),
              const ChangeDateOfBirthForm(),
            ],
              ),
        ),
    );
  }
}

