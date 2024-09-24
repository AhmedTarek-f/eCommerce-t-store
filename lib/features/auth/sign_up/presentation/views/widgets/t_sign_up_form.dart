import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/core/app_router.dart';
import 'package:t_store/features/auth/sign_up/presentation/views/widgets/t_terms_and_conditions_check_box.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.user),
                      label: Text("First Name", style: Theme.of(context).textTheme.bodyMedium,)
                  ),
                ),
              ),
              const SizedBox(width: 16,),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.user),
                      label: Text("Last Name", style: Theme.of(context).textTheme.bodyMedium,)
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16,),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.user_edit),
                label: Text("Username", style: Theme.of(context).textTheme.bodyMedium,)
            ),
          ),
          const SizedBox(height: 16,),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.direct),
                label: Text("E-Mail", style: Theme.of(context).textTheme.bodyMedium,)
            ),
          ),
          const SizedBox(height: 16,),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.call),
                label: Text("Phone Number", style: Theme.of(context).textTheme.bodyMedium,)
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
          const SizedBox(height: 32,),

          const TTermsAndConditionsCheckBox(),
          const SizedBox(height: 32,),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: ElevatedButton(
                onPressed: (){
                  GoRouter.of(context).pushReplacement(AppRouter.kVerifyEmailView);
                },
                child: const Text("Create Account",)
            ),
          ),
        ],
      ),
    );
  }
}
