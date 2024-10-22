import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/profile/presentation/views/widgets/change_name_form.dart';

class ChangeNameViewBody extends StatelessWidget {
  const ChangeNameViewBody({super.key});

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
                  "Use real name for easy verification. This name will appear on several pages.".tr,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 32,),
              const ChangeNameForm(),
            ],
              ),
        ),
    );
  }
}

