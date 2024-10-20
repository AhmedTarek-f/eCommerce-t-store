
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/shimmer/t_shimmer_effect.dart';
import 'package:t_store/common_widgets/images/t_circular_image.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/features/personalization/controller/user_controller.dart';
import 'package:t_store/features/personalization/profile/presentation/views/change_name_view.dart';
import 'package:t_store/features/personalization/profile/presentation/views/widgets/t_profile_menu.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController controller = UserController.instance;
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
                  Obx(
                    () {
                      final String networkImage = controller.user.value.profilePicture;
                      final String image = networkImage.isNotEmpty? networkImage : TImages.user;
                      return controller.imageUploading.value?
                      const TShimmerEffect(width: 100, height: 100 ,radius: 100,) :
                      TCircularImage(image: image,width: 100,height: 100,isOverLayColor: false, isNetworkImage:networkImage.isNotEmpty ,);
                    },
                  ),
                  TextButton(onPressed: ()async{await controller.uploadUserProfilePicture();}, child: Text("Change Profile Picture".tr))
                ],
              ),
            ),
            const SizedBox(height: 8,),
            const Divider(),
            const SizedBox(height: 16,),
            TSectionHeading(title: "Profile Information".tr , showActionButton: false,padding: EdgeInsets.zero,),
            const SizedBox(height: 16,),

            Obx(()=> controller.nameChangeLoading.value?TProfileMenu( title: "Name".tr, value: "Updating...".tr, onPressed: () {},) :TProfileMenu( title: "Name".tr, value: controller.user.value.fullName,onPressed: (){Get.to(()=> const ChangeNameView());},)),
            TProfileMenu( title: "UserName".tr, value: controller.user.value.username,onPressed: (){},),

            const SizedBox(height: 16,),
            const Divider(),
            const SizedBox(height: 16,),

            TSectionHeading(title: "Personal Information".tr , showActionButton: false,padding: EdgeInsets.zero,),
            const SizedBox(height: 16,),

            TProfileMenu( title: "User ID".tr, value: controller.user.value.id,onPressed: (){},icon: Iconsax.copy_copy,),
            TProfileMenu( title: "E-Mail".tr, value: controller.user.value.email,onPressed: (){},),
            TProfileMenu( title: "Phone Number".tr, value: controller.user.value.phoneNumber,onPressed: (){},),
            TProfileMenu( title: "Gender".tr, value: "Male".tr,onPressed: (){},),
            TProfileMenu( title: "Date of Birth".tr, value: "7 Jun, 2001",onPressed: (){},),

            const Divider(),
            const SizedBox(height: 16,),

            Center(
                child: TextButton(
                    onPressed: ()async{
                      controller.deleteAccountWarningPopup();
                    },
                    child: Text("Close Account".tr, style: const TextStyle(color: Colors.red),),
                ),
            ),
          ],
        ),
      ),
    );
  }
}