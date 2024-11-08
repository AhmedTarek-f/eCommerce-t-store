import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/profile/presentation/views_model/change_gender_controller.dart';

class ChangeGenderForm extends StatelessWidget {
  const ChangeGenderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangeGenderController>(
      init: ChangeGenderController(),
      builder: (controller) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Gender:".tr , style: Theme.of(context).textTheme.bodyLarge,),
              const SizedBox(width: 8,),
              DropdownMenu(
                menuHeight: MediaQuery.sizeOf(context).height*0.2,
                controller: controller.gender,
                  onSelected: (value) {
                    if(value != null){
                      controller.gender.text = value.tr;
                    }
                  },
                  dropdownMenuEntries: <DropdownMenuEntry<String>> [
                    DropdownMenuEntry(value: "Male", label: "Male".tr),
                    DropdownMenuEntry(value: "Female", label: "Female".tr),
                  ]
              ),
            ],
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height*0.15,),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: ElevatedButton(onPressed: ()async {await controller.updateGender();}, child: Text("Save".tr)),
          ),
        ],
      ),
    );
  }
}
