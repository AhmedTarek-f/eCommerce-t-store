import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/profile/presentation/views/widgets/change_gender_form.dart';

class ChangeGenderViewBody extends StatelessWidget {
  const ChangeGenderViewBody({super.key});

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
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Select your gender.".tr,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 16,),
              const ChangeGenderForm(),
            ],
              ),
        ),
    );
  }
}

