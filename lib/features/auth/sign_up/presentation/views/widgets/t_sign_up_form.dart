import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/features/auth/sign_up/presentation/views/widgets/t_terms_and_conditions_check_box.dart';
import 'package:t_store/features/auth/sign_up/presentation/views_model/sign_up_controller.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: SignUpController(),
      builder: (controller) => Form(
        key: controller.signUpFormKey,
        autovalidateMode: controller.autoValidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.user_copy),
                        labelText: "First Name".tr,
                    ),
                    keyboardType: TextInputType.text,
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
                  ),
                ),
                const SizedBox(width: 16,),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.user_copy),
                        labelText: "Last Name".tr,
                    ),
                    keyboardType: TextInputType.text,
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
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16,),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.user_edit_copy),
                labelText: "Username".tr,
              ),
              keyboardType: TextInputType.text,
              controller: controller.userName,
              validator: (value) {
                if(value == null || value.isEmpty || value.trim() == ""){
                  return "User Name is required.".tr;
                }
                else
                {
                  return null;
                }
              },
            ),
            const SizedBox(height: 16,),
            TextFormField(
              decoration:  InputDecoration(
                prefixIcon: const Icon(Iconsax.direct_copy),
                labelText: "E-Mail".tr,
              ),
              keyboardType: TextInputType.emailAddress,
              controller: controller.email,
              validator: (value) {
                final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if(value == null || value.isEmpty || value.trim() == ""){
                  return "Email is required.".tr;
                }
               else if(!emailRegExp.hasMatch(value))
                  {
                    return "Invalid email address.".tr;
                  }
               else
                 {
                   return null;
                 }
              },
            ),
            const SizedBox(height: 16,),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.call_copy),
                  labelText: "Phone Number".tr,
              ),
              keyboardType: TextInputType.phone,
              controller: controller.phoneNumber,
              validator: (value) {
                if(value == null || value.isEmpty || value.trim() == ""){
                  return "Phone Number is required.".tr;
                }
                else
                {
                  return null;
                }
              },
            ),
            const SizedBox(height: 16,),
            TextFormField(
              obscureText: controller.hidePassword,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check_copy),
                  labelText: "Password".tr,
                  suffixIcon: IconButton(
                    onPressed: () {
                     controller.hideShowPassword();
                    },
                    icon:controller.hidePassword? const Icon(Iconsax.eye_slash_copy):const Icon(Iconsax.eye_copy),
                  )
              ),
              keyboardType: TextInputType.visiblePassword,
              controller: controller.password,
              validator: (value) {
                if(value == null || value.isEmpty || value.trim() == "")
                  {
                    return "Password is required.".tr;
                  }
                else if(value.length < 6)
                  {
                    return "Password must be at least 6 characters long.".tr;
                  }
                else
                {
                  return null;
                }
              },
            ),
            const SizedBox(height: 32,),

            const TTermsAndConditionsCheckBox(),
            const SizedBox(height: 32,),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: ElevatedButton(
                  onPressed: (){
                    controller.signUp();
                  },
                  child:  Text("Create Account".tr,)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
