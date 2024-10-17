import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_primary_header_container.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/my_address/presentation/views/my_address_view.dart';
import 'package:t_store/features/personalization/my_orders/presentation/views/my_orders_view.dart';
import 'package:t_store/features/personalization/profile/presentation/views/profile_view.dart';
import 'package:t_store/features/personalization/settings/presentation/views/widgets/t_settings_menu_title.dart';
import 'package:t_store/features/personalization/settings/presentation/views/widgets/t_user_profile_title.dart';
import 'package:t_store/features/shop/cart/presentation/views/cart_view.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text("Your account".tr,style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),),
                  ),
                  TUserProfileTitle(onPressed: (){
                    Get.to(()=> const ProfileView());
                    },
                  ),
                  const SizedBox(height: 32,),
                ],
              ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.sizeOf(context).width*0.0611,
              left: MediaQuery.sizeOf(context).width*0.0611,
              top: MediaQuery.sizeOf(context).height*0.0280,
              bottom: MediaQuery.sizeOf(context).height*0.0280,
            ),
            child: Column(
              children: [
                TSectionHeading(title: "Account Settings".tr,padding:EdgeInsets.zero ,showActionButton: false,),
                const SizedBox(height: 16,),
                TSettingsMenuTile(icon: Iconsax.safe_home_copy , title:"My Address".tr ,subTitle: "Set shopping delivery address".tr, onTap: (){ Get.to(()=>const MyAddressView());},),
                TSettingsMenuTile(icon: Iconsax.shopping_cart_copy , title:"My Cart".tr ,subTitle: "Add, remove products and move to checkout".tr, onTap: (){Get.to(()=> const CartView());},),
                TSettingsMenuTile(icon: Iconsax.bag_tick_copy , title:"My Orders".tr ,subTitle: "In-progress and Completed Orders".tr, onTap: (){Get.to(()=>const MyOrdersView());},),
                TSettingsMenuTile(icon: Iconsax.discount_shape_copy , title:"My Coupons".tr ,subTitle: "List of all the discounted coupons".tr, onTap: (){},),
                const SizedBox(height: 32,),

                TSectionHeading(title: "App Settings".tr,padding:EdgeInsets.zero ,showActionButton: false,),
                const SizedBox(height: 16,),
                TSettingsMenuTile(
                  icon: Iconsax.translate_copy ,
                  title:"Language".tr,
                  subTitle: "Set the app language to Arabic or English.".tr,
                  trailing: Switch(value: true, onChanged: (value){},),
                  onTap: (){},
                ),
                TSettingsMenuTile(
                  icon: Icons.dark_mode_outlined ,
                  title:"Theme".tr,
                  subTitle: "Set the app Theme to Dark or Light Mode.".tr,
                  trailing: Switch(value: false, onChanged: (value){},),
                  onTap: (){},
                ),

                const SizedBox(height: 32,),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: OutlinedButton(onPressed: ()async{await AuthenticationRepository.instance.logout();}, child: Text("Logout".tr)),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}



