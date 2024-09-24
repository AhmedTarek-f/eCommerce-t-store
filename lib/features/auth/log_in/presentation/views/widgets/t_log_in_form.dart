import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/core/app_router.dart';

class TLogInForm extends StatelessWidget {
  const TLogInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration:InputDecoration(
                    prefixIcon: const Icon(Iconsax.direct_right),
                    label: Text("E-Mail",style:Theme.of(context).textTheme.bodyMedium ,),
                  ),
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      label: Text("Password",style: Theme.of(context).textTheme.bodyMedium,),
                      suffixIcon: const Icon(Iconsax.eye_slash)
                  ),
                ),
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value){}),
                        const Text("Remember Me")
                      ],
                    ),
                    TextButton(onPressed: (){GoRouter.of(context).push(AppRouter.kForgetPasswordView);}, child: const Text("Forget Password?")),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width:MediaQuery.sizeOf(context).width,
          child: ElevatedButton(
            onPressed: (){GoRouter.of(context).push(AppRouter.kNavigationMenuView);},
            child: const Text("Sign In"),
          ),
        ),
        const SizedBox(height: 16,),
        SizedBox(
          width:MediaQuery.sizeOf(context).width,
          child: OutlinedButton(
            onPressed: (){
              GoRouter.of(context).pushReplacement(AppRouter.kSignUpView);
            },
            child: const Text("Create Account"),
          ),
        ),
        const SizedBox(height: 32,),
      ],
    );
  }
}
