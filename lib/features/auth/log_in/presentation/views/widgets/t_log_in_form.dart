import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/features/auth/log_in/presentation/views_model/log_in_controller.dart';
import 'package:t_store/features/auth/password_configuration/presentation/views/forget_password_view.dart';
import 'package:t_store/features/auth/sign_up/presentation/views/sign_up_view.dart';

class TLogInForm extends StatelessWidget {
  const TLogInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogInController>(
      init: LogInController(),
      builder: (controller) =>Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Form(
              key: controller.loginFormKey,
              autovalidateMode: controller.autoValidateMode,
              child: Column(
                children: [
                  TextFormField(
                    decoration:InputDecoration(
                      prefixIcon: const Icon(Iconsax.direct_right_copy),
                      label: Text("E-Mail".tr,style:Theme.of(context).textTheme.bodyMedium ,),
                    ),
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
                    obscureText: controller.hidePassword,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check_copy),
                        label: Text("Password".tr,style: Theme.of(context).textTheme.bodyMedium,),
                        suffixIcon:controller.hidePassword?
                        IconButton(onPressed: (){controller.hideShowPassword();}, icon: const Icon(Iconsax.eye_slash_copy)):
                        IconButton(onPressed: (){controller.hideShowPassword();}, icon: const Icon(Iconsax.eye_copy))
                    ),
                    controller: controller.password,
                    validator: (value) {
                      if(value == null || value.isEmpty || value.trim() == "")
                      {
                        return "Password is required.".tr;
                      }
                      else
                      {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: controller.localStorage.read("REMEMBER_ME_VALUE")??false, onChanged: (_){controller.rememberMeSignChange();}),
                          Text("Remember Me".tr)
                        ],
                      ),
                      TextButton(onPressed: (){
                        Get.to(()=>const ForgetPasswordView());
                      },
                          child: Text("Forget Password?".tr),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width:MediaQuery.sizeOf(context).width,
            child: ElevatedButton(
              onPressed: (){
                controller.loginWithEmailAndPassword();
              },
              child:  Text("Sign In".tr),
            ),
          ),
          const SizedBox(height: 16,),
          SizedBox(
            width:MediaQuery.sizeOf(context).width,
            child: OutlinedButton(
              onPressed: (){
                Get.to(()=>const SignUpView());
              },
              child:  Text("Create Account".tr),
            ),
          ),
          const SizedBox(height: 32,),
        ],
      ) ,
    );
  }
}
