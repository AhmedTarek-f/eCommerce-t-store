import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/core/constants/colors.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.sizeOf(context).width*0.0611,
        left: MediaQuery.sizeOf(context).width*0.0611,
        top: MediaQuery.sizeOf(context).height*0.0280,
        bottom: MediaQuery.sizeOf(context).height*0.0280,
      ),
      child: const TOrderListItems(),
    );
  }
}

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => const OrderItem(),
      separatorBuilder: (context, index) => const SizedBox(height: 16,),
      itemCount: 15,
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                      Text("Processing",style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary,fontWeightDelta: 1),),
                      Text("24 Sept 2024",style: Theme.of(context).textTheme.headlineSmall,),
                    ],
                  ),
                ],
              ),
              IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_3_copy,size: 16,)),
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
                        Text("Order",style: Theme.of(context).textTheme.labelMedium,),
                        Text("[#256f2]",style: Theme.of(context).textTheme.titleMedium,),
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
                        Text("Shipping Date",style: Theme.of(context).textTheme.labelMedium,),
                        Text("03 Feb 2025",style: Theme.of(context).textTheme.titleMedium,),
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
