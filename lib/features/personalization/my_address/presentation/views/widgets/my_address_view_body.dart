import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/personalization/my_address/presentation/views/widgets/t_single_address.dart';
import 'package:t_store/features/personalization/my_address/presentation/views_model/address_controller.dart';

class MyAddressViewBody extends StatelessWidget {
  const MyAddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressController controller = AddressController.instance;
    return  Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.sizeOf(context).width*0.0611,
        left: MediaQuery.sizeOf(context).width*0.0611,
        top: MediaQuery.sizeOf(context).height*0.0280,
        bottom: MediaQuery.sizeOf(context).height*0.0280,
      ),
      child: Obx(
          () {
            if(controller.isLoading.value){
              return const Column(
                children: [
                  Expanded(child: Center(child: CircularProgressIndicator(color: TColors.primaryColor,),)),
                ],
              );
            }
            else if(controller.allAvailableAddresses.isEmpty)
            {
              return Center(child: Text("No Data Found!".tr),);
            }
            else {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.allAvailableAddresses.length,
                separatorBuilder: (context, index) => const SizedBox(height: 32,),
                itemBuilder: (context, index) {
                  final address = controller.allAvailableAddresses[index];
                  return TSingleAddress(
                    address: address,
                    onTap: () async {
                      await controller.selectAddress(address);
                    },
                  );
                },
              );
            }
          },
      ),
    );
  }
}



