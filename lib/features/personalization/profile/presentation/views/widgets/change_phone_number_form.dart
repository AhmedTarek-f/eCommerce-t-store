import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/features/personalization/profile/presentation/views_model/change_phone_number_controller.dart';

class ChangePhoneNumberForm extends StatelessWidget {
  const ChangePhoneNumberForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePhoneNumberController>(
      init: ChangePhoneNumberController(),
      builder: (controller) => Form(
          key: controller.phoneNumberFormKey,
          autovalidateMode: controller.autoValidateMode,
          child: Column(
            children: [
              TextFormField(
                decoration:   InputDecoration(
                  labelText: "Phone Number".tr,
                  prefixIcon: const Icon(Iconsax.call_copy),
                ),
                controller: controller.phoneNumber,
                validator: (value) {
                  if(value == null || value.isEmpty || value.trim() == ""){
                    return "Phone number is required.".tr;
                  }
                  else if(value.length<11){
                    return "Phone number can't be less than 11 digits.".tr;
                  }
                  else
                  {
                    return null;
                  }
                },
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 32,),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(onPressed: ()async {await controller.updatePhoneNumber();}, child: Text("Save".tr)),
              ),
            ],
          )
      ),
    );
  }
}
