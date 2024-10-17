import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/features/personalization/my_address/presentation/views_model/address_controller.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressController controller = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: "Shipping Address",
          padding:const EdgeInsets.all(0),
          buttonTitle: "Change",
          onPressed: (){
            controller.selectNewAddressPopup(context);
          },
        ),
        controller.selectedAddress.value.id.isNotEmpty
            ? Obx(
              ()=> Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
              Text(controller.selectedAddress.value.name,style: Theme.of(context).textTheme.bodyLarge,),
              const SizedBox(height: 8,),
              Row(
                children: [
                  const Icon(Icons.phone,size: 16,color: Colors.grey,),
                  const SizedBox(width: 16,),
                  Text(controller.selectedAddress.value.phoneNumber, style:  Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
              const SizedBox(height: 8,),
              Row(
                children: [
                  const Icon(Icons.location_history,size: 16,color: Colors.grey,),
                  const SizedBox(width: 16,),
                  Expanded(child: Text(controller.selectedAddress.value.toString(), style:  Theme.of(context).textTheme.bodyMedium,softWrap: true,)),
                ],
              ),
                        ],
                      ),
            ) : Text("Select address",style:Theme.of(context).textTheme.bodyMedium,)
      ],
    );
  }
}
