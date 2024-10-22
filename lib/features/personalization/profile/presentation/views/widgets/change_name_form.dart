import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/features/personalization/profile/presentation/views_model/change_name_controller.dart';

class ChangeNameForm extends StatelessWidget {
  const ChangeNameForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangeNameController>(
      init: ChangeNameController(),
      builder: (controller) => Form(
          key: controller.nameFormKey,
          autovalidateMode: controller.autoValidateMode,
          child: Column(
            children: [
              TextFormField(
                decoration:   InputDecoration(
                  labelText: "First Name".tr,
                  prefixIcon: const Icon(Iconsax.user_copy),
                ),
                controller: controller.firstName,
                validator: (value) {
                  if(value == null || value.isEmpty || value.trim() == ""){
                    return "First Name is required.".tr;
                  }
                  else
                  {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
              ),

              const SizedBox(height: 16,),
              TextFormField(
                decoration:  InputDecoration(
                  labelText: "Last Name".tr,
                  prefixIcon: const Icon(Iconsax.user_copy),
                ),
                controller: controller.lastName,
                validator: (value) {
                  if(value == null || value.isEmpty || value.trim() == ""){
                    return "Last Name is required.".tr;
                  }
                  else
                  {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
              ),

              const SizedBox(height: 32,),

              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(onPressed: ()async {await controller.updateUserName();}, child:  Text("Save".tr)),
              ),
            ],
          )
      ),
    );
  }
}
