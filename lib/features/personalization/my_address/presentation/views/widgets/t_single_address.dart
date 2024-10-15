import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/personalization/my_address/model/address_model.dart';
import 'package:t_store/features/personalization/my_address/presentation/views_model/address_controller.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.address, required this.onTap});
  final AddressModel address;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final AddressController controller = AddressController.instance;
    final bool isDarkMode = Theme.of(context).brightness==Brightness.dark;
    return Obx(
      (){
        final selectedAddressId=controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == address.id;
        return InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: TRoundedContainer(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.sizeOf(context).width,
            showBorder: true,
            backGroundColor: selectedAddress ? TColors.primary.withOpacity(0.5) : Colors.transparent,
            borderColor:selectedAddress? Colors.transparent: isDarkMode? TColors.darkerGrey : TColors.grey,
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
                      address.name,
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4,),
                     Text(address.formattedPhoneNo,maxLines: 1,overflow: TextOverflow.ellipsis,),
                    const SizedBox(height: 4,),
                     Text(
                      address.toString(),
                      softWrap: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}