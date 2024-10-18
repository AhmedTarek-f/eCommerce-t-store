import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/personalization/my_address/model/address_model.dart';
import 'package:t_store/features/personalization/my_address/presentation/views/widgets/t_single_address.dart';
import 'package:t_store/features/personalization/my_address/presentation/views_model/address_controller.dart';

class MyAddressViewBody extends StatelessWidget {
  const MyAddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressController controller = AddressController.instance;
    return  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.sizeOf(context).width*0.0611,
            left: MediaQuery.sizeOf(context).width*0.0611,
            top: MediaQuery.sizeOf(context).height*0.0280,
            bottom: MediaQuery.sizeOf(context).height*0.0280,
          ),
          child: Obx(
              () => FutureBuilder<List<AddressModel>>(
              key: Key(controller.refreshData.value.toString()),
                future: controller.getAllUserAddresses(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator(color: TColors.primaryColor,),);
                  }
                  else if(!snapshot.hasData || snapshot.data == null || (snapshot.data?.isEmpty ?? true))
                  {
                    return Center(child: Text("No Data Found!".tr),);
                  }
                  else if(snapshot.hasError)
                  {
                    return Center(child:  Text("Something went wrong.".tr),);
                  }
                  else {
                    final allUserAddresses = snapshot.data!;
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: allUserAddresses.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 32,),
                      itemBuilder: (context, index) {
                        final address = allUserAddresses[index];
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
          ),
        ),
    );
  }
}



