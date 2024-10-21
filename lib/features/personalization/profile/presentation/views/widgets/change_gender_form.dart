import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/features/personalization/profile/presentation/views_model/change_gender_controller.dart';
import 'package:t_store/features/personalization/profile/presentation/views_model/change_phone_number_controller.dart';

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
                      controller.gender.text = value;
                    }
                  },
                  dropdownMenuEntries: const <DropdownMenuEntry<String>> [
                    DropdownMenuEntry(value: "Male", label: "Male"),
                    DropdownMenuEntry(value: "Female", label: "Female"),
                  ]
              ),
            ],
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height*0.15,),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: ElevatedButton(onPressed: ()async {await controller.updateGender();}, child: const Text("Save")),
          ),
        ],
      ),
    );
  }
}
