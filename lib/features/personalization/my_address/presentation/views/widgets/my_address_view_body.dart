import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/core/constants/colors.dart';

class MyAddressViewBody extends StatelessWidget {
  const MyAddressViewBody({super.key});

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
          child: const Column(
            children: [
              TSingleAddress(selectedAddress: true,),
              TSingleAddress(selectedAddress: false,),
            ],
          ),
        ),
    );
  }
}

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness==Brightness.dark;
    return TRoundedContainer(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.sizeOf(context).width,
      showBorder: true,
      backGroundColor: selectedAddress ? TColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor:selectedAddress? Colors.transparent: isDarkMode? TColors.darkerGrey : TColors.grey,
      margin: const EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
                selectedAddress?Iconsax.tick_circle:null,
              color: isDarkMode? TColors.light : TColors.dark,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ahmed Tarek",
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4,),
              const Text("01116811765",maxLines: 1,overflow: TextOverflow.ellipsis,),
              const SizedBox(height: 4,),
              const Text(
                "82356 Timmy Coves,South Liana,Maine,87665,USA",
                softWrap: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
