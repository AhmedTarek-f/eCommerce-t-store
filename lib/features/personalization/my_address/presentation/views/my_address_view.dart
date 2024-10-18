import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/personalization/my_address/presentation/views/add_new_address_view.dart';
import 'package:t_store/features/personalization/my_address/presentation/views/widgets/my_address_view_body.dart';

class MyAddressView extends StatelessWidget {
  const MyAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  TAppBar(
        title: Text("My Address".tr,style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.to(()=> const AddNewAddressView());
            },
        backgroundColor: TColors.primary,
        child: const Icon(Iconsax.add_copy,color: TColors.white,),
      ),
      body: const MyAddressViewBody(),
    );
  }
}
