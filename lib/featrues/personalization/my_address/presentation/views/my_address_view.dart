import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/core/app_router.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/featrues/personalization/my_address/presentation/views/widgets/my_address_view_body.dart';

class MyAddressView extends StatelessWidget {
  const MyAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  TAppBar(
        title: Text("My Address",style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){GoRouter.of(context).push(AppRouter.kAddNewAddressView);},
        backgroundColor: TColors.primary,
        child: const Icon(Iconsax.add_copy,color: TColors.white,),
      ),
      body: const MyAddressViewBody(),
    );
  }
}
