import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/features/personalization/profile/presentation/views_model/change_date_of_birth_controller.dart';
import 'package:t_store/features/personalization/profile/presentation/views_model/change_phone_number_controller.dart';

class ChangeDateOfBirthForm extends StatelessWidget {
  const ChangeDateOfBirthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangeDateOfBirthController>(
      init: ChangeDateOfBirthController(),
      builder: (controller) => Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width*0.65,
                child: TextField(
                  decoration:  InputDecoration(
                    hintText: controller.dateOfBirth.text.isEmpty? "Select your date of birth" : controller.dateOfBirth.text,
                    prefixIcon: const Icon(Icons.date_range_outlined),
                  ),
                  readOnly: true,
                  controller: controller.dateOfBirth,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16,),
              Flexible(
                child: ElevatedButton(
                    onPressed: (){
                      controller.selectDate(context);
                    },
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12)),
                    child: Center(child: Text("Pick".tr)),
                ),
              )
            ],
          ),
          const SizedBox(height: 32,),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: ElevatedButton(onPressed: ()async {await controller.updateDateOfBirth();}, child: const Text("Save")),
          ),
        ],
      ),
    );
  }
}
