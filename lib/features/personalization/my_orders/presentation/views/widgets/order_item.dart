import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/personalization/my_orders/model/order_model.dart';
import 'package:t_store/features/personalization/my_orders/presentation/views_model/order_controller.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key, required this.order,
  });
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    final OrderController orderController = OrderController.instance;
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TRoundedContainer(
      padding: const EdgeInsets.all(16),
      showBorder: true,
      backGroundColor:isDarkMode? TColors.dark : TColors.light,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Iconsax.ship_copy),
                  const SizedBox(width: 8,),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(order.orderStatusText.tr,style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary,fontWeightDelta: 1),),
                      Text(order.formattedOrderDate,style: Theme.of(context).textTheme.headlineSmall,),
                    ],
                  ),
                ],
              ),
              IconButton(
                  onPressed: (){},
                  icon: orderController.isArabic()? const Icon(Iconsax.arrow_left_2_copy,size: 16,) :const Icon(Iconsax.arrow_right_3_copy,size: 16,),
              ),
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(Iconsax.tag_copy),
                    const SizedBox(width: 8,),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Order No".tr,style: Theme.of(context).textTheme.labelMedium,),
                        Text(order.id,style: Theme.of(context).textTheme.titleMedium,),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Icon(Iconsax.calendar_copy),
                    const SizedBox(width: 8,),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Shipping Date".tr,style: Theme.of(context).textTheme.labelMedium,),
                        Text(order.formattedDeliveryDate,style: Theme.of(context).textTheme.titleMedium,),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
