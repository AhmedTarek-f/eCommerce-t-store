import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/core/app_router.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height*0.0280,
          bottom: MediaQuery.sizeOf(context).height*0.0280,
          right: MediaQuery.sizeOf(context).width*0.05,
          left: MediaQuery.sizeOf(context).width*0.05,
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Forget Password", style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: 16,),
            Text("Don't worry sometimes people can forget too, enter your email and we will send you a password reset link.",style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: 64,),

            Form(
                child: Column(
              children: [
                TextFormField(
                  decoration:  InputDecoration(
                    label: Text("E-Mail",style: Theme.of(context).textTheme.bodyMedium,),
                    prefixIcon: const Icon(Iconsax.direct_right)
                  ),
                ),
                const SizedBox(height: 32,),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(onPressed: (){GoRouter.of(context).pushReplacement(AppRouter.kResetPasswordView);}, child: const Text("Submit")),
                ),

              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}
