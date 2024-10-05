import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/features/auth/log_in/presentation/views/log_in_view.dart';
import 'package:t_store/features/auth/password_configuration/presentation/views_model/reset_password_controller.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    final ResetPasswordController controller = Get.put(ResetPasswordController());
    return  SingleChildScrollView(
        child:  Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.sizeOf(context).height*0.0280,
            bottom: MediaQuery.sizeOf(context).height*0.0280,
            right: MediaQuery.sizeOf(context).width*0.05,
            left: MediaQuery.sizeOf(context).width*0.05,
          ),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                TImages.deliveredEmailIllustration,
                width: MediaQuery.sizeOf(context).width*0.6,
              ),
              const SizedBox(height: 32,),
              Text("Password Reset Email Sent",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: 16,),
              Text("Your Account Security is Our Priority! We've Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.",style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: 32,),

              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(
                  onPressed: (){
                    Get.offAll(()=>const LogInView());
                    },
                  child: const Text("Done"),
                ),
              ),
              const SizedBox(height: 16,),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: TextButton(
                  onPressed: ()async{
                    await controller.resendPasswordResetEmail(email:email);
                  },
                  child: const Text("Resend Email"),
                ),
              ),
            ],
          ),
        )
    );
  }
}
