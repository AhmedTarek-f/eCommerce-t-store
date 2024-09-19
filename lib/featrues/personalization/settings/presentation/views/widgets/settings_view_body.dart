import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_primary_header_container.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/core/app_router.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/featrues/personalization/settings/presentation/views/widgets/t_user_profile_title.dart';

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
                    title: Text("Account",style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),),
                  ),
                  TUserProfileTitle(onPressed: (){GoRouter.of(context).push(AppRouter.kProfileView);},),
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
                const TSectionHeading(title: "Account Settings",padding:EdgeInsets.zero ,showActionButton: false,),
                const SizedBox(height: 16,),
                TSettingsMenuTile(icon: Iconsax.safe_home_copy , title:"My Address" ,subTitle: "Set shopping delivery address", onTap: (){},),
                TSettingsMenuTile(icon: Iconsax.shopping_cart_copy , title:"My Cart" ,subTitle: "Add, remove products and move to checkout ", onTap: (){},),
                TSettingsMenuTile(icon: Iconsax.bag_tick_copy , title:"My Orders" ,subTitle: "In-progress and Completed Orders", onTap: (){},),
                TSettingsMenuTile(icon: Iconsax.bank_copy , title:"Bank Account" ,subTitle: "Withdraw balance to registered bank account", onTap: (){},),
                TSettingsMenuTile(icon: Iconsax.discount_shape_copy , title:"My Coupons" ,subTitle: "List of all the discounted coupons", onTap: (){},),
                TSettingsMenuTile(icon: Iconsax.notification_copy , title:"Notifications" ,subTitle: "Set and kind of notification message", onTap: (){},),
                TSettingsMenuTile(icon: Iconsax.security_card_copy , title:"Account Privacy" ,subTitle: "Manage data usage and connected accounts", onTap: (){},),
                const SizedBox(height: 32,),

                const TSectionHeading(title: "App Settings",padding:EdgeInsets.zero ,showActionButton: false,),
                const SizedBox(height: 16,),
                TSettingsMenuTile(icon: Iconsax.document_upload_copy , title:"Load Data" ,subTitle: "Upload Data to your Cloud Firebase", onTap: (){},),
                TSettingsMenuTile(
                  icon: Iconsax.location_copy ,
                  title:"GeoLocation" ,
                  subTitle: "Set recommendation based on location",
                  trailing: Switch(value: true, onChanged: (value){},),
                  onTap: (){},
                ),
                TSettingsMenuTile(
                  icon: Iconsax.security_user_copy ,
                  title:"Safe Mode" ,
                  subTitle: "Search result in safe for all ages",
                  trailing: Switch(value: false, onChanged: (value){},),
                  onTap: (){},
                ),
                TSettingsMenuTile(
                  icon: Iconsax.image_copy ,
                  title:"HD Image Quality" ,
                  subTitle: "Set image quality to be seen",
                  trailing: Switch(value: false, onChanged: (value){},),
                  onTap: (){},
                ),

                const SizedBox(height: 32,),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: OutlinedButton(onPressed: (){}, child: const Text("Logout")),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}

class TSettingsMenuTile extends StatelessWidget {
  const TSettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
  });
  final IconData icon;
  final String title;
  final String subTitle;
  final Widget? trailing;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,size: 28,color: TColors.primary,),
      title: Text(title,style: Theme.of(context).textTheme.titleMedium,),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium,),
      trailing: trailing,
      onTap: onTap,
    );
  }
}


