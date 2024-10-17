import 'package:flutter/material.dart';
import 'package:t_store/features/personalization/my_orders/presentation/views/widgets/t_order_list_items.dart';

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



