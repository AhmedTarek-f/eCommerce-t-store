import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/features/personalization/controller/user_controller.dart';

class ReAuthUserLoginForm extends StatelessWidget {
  const ReAuthUserLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (controller) => Form(
          key: controller.reAuthFormKey,
          autovalidateMode: controller.autoValidateMode,
          child: Column(
            children: [
              TextFormField(
                decoration:InputDecoration(
                  prefixIcon: const Icon(Iconsax.direct_right_copy),
                  label: Text("E-Mail",style:Theme.of(context).textTheme.bodyMedium ,),
                ),
                controller: controller.verifyEmail,
                validator: (value) {
                  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if(value == null || value.isEmpty || value.trim() == ""){
                    return "Email is required.";
                  }
                  else if(!emailRegExp.hasMatch(value))
                  {
                    return "Invalid email address.";
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
                    label: Text("Password",style: Theme.of(context).textTheme.bodyMedium,),
                    suffixIcon:controller.hidePassword?
                    IconButton(onPressed: (){controller.hideShowPassword();}, icon: const Icon(Iconsax.eye_slash_copy)):
                    IconButton(onPressed: (){controller.hideShowPassword();}, icon: const Icon(Iconsax.eye_copy))
                ),
                controller: controller.verifyPassword,
                validator: (value) {
                  if(value == null || value.isEmpty || value.trim() == "")
                  {
                    return "Password is required.";
                  }
                  else
                  {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 32,),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(
                  onPressed: ()=> controller.reAuthenticateEmailAndPassword(),
                  child: const Text("verify"),
                ),
              ),
            ],
          )
      ),
    );
  }
}
