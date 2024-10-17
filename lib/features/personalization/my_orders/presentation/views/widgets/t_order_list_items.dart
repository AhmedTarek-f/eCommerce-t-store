import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/core/utlis/loaders/t_animation_loader_widget.dart';
import 'package:t_store/features/personalization/my_orders/model/order_model.dart';
import 'package:t_store/features/personalization/my_orders/presentation/views/widgets/order_item.dart';
import 'package:t_store/features/personalization/my_orders/presentation/views_model/order_controller.dart';
import 'package:t_store/features/shop/navigation_menu/presentation/views/navigation_menu_view.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    return FutureBuilder<List<OrderModel>>(
      future: controller.fetchUserOrders(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return TAnimationLoaderWidget(
              text: "Whoops! No Orders Yet!",
              animation: TImages.orderCompleteAnimation,
            showAction: true,
            actionText: "Let's fill it",
            onActionPressed: () => Get.offAll(() => const NavigationMenuView()),

          );
        }
        else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
          return const Center(child: Text("No Data Found!"),);
        }
        else if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong."),);
        }
        else{
          final orders = snapshot.data!;
          return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final order = orders[index];
            return OrderItem(order: order,) ;
          },
          separatorBuilder: (context, index) => const SizedBox(height: 16,),
          itemCount: orders.length,
        );
        }
      },
    );
  }
}