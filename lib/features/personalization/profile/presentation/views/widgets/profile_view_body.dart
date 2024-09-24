import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/images/t_circular_image.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/features/personalization/profile/presentation/views/widgets/t_profile_menu.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          right: MediaQuery.sizeOf(context).width*0.0611,
          left: MediaQuery.sizeOf(context).width*0.0611,
          top: MediaQuery.sizeOf(context).height*0.0280,
          bottom: MediaQuery.sizeOf(context).height*0.0280,
        ),
        child:  Column(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                children: [
                  const TCircularImage(image: TImages.user,width: 80,height: 80,isOverLayColor: false,),
                  TextButton(onPressed: (){}, child: const Text("Change Profile Picture"))
                ],
              ),
            ),
            const SizedBox(height: 8,),
            const Divider(),
            const SizedBox(height: 16,),
            const TSectionHeading(title: "Profile Information" , showActionButton: false,padding: EdgeInsets.zero,),
            const SizedBox(height: 16,),

            TProfileMenu( title: "Name", value: "Ahmed Tarek",onPressed: (){},),
            TProfileMenu( title: "UserName", value: "ahmedTarek1",onPressed: (){},),

            const SizedBox(height: 16,),
            const Divider(),
            const SizedBox(height: 16,),

            const TSectionHeading(title: "Personal Information" , showActionButton: false,padding: EdgeInsets.zero,),
            const SizedBox(height: 16,),

            TProfileMenu( title: "User ID", value: "16874",onPressed: (){},icon: Iconsax.copy_copy,),
            TProfileMenu( title: "E-mail", value: "o0ahmedtarek0o@gmail.com",onPressed: (){},),
            TProfileMenu( title: "Phone Number", value: "01116811765",onPressed: (){},),
            TProfileMenu( title: "Gender", value: "Male",onPressed: (){},),
            TProfileMenu( title: "Date of Birth", value: "7 Jun, 2001",onPressed: (){},),

            const Divider(),
            const SizedBox(height: 16,),

            Center(
                child: TextButton(
                    onPressed: (){},
                    child: const Text("Close Account", style: TextStyle(color: Colors.red),),
                ),
            ),
          ],
        ),
      ),
    );
  }
}