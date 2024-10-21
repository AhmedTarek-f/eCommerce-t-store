import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/shimmer/my_coupons_list_shimmer.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/core/utlis/loaders/t_animation_loader_widget.dart';
import 'package:t_store/features/personalization/my_coupons/model/coupons_model.dart';
import 'package:t_store/features/personalization/my_coupons/presentation/views/widgets/my_coupon_item.dart';
import 'package:t_store/features/personalization/my_coupons/presentation/views_model/my_coupons_controller.dart';

class MyCouponsViewBody extends StatelessWidget {
  const MyCouponsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final MyCouponsController controller = Get.put(MyCouponsController());
    return FutureBuilder<List<CouponsModel>>(
      future: controller.isArabic()? controller.fetchAllMyCouponsAr() :controller.fetchAllMyCoupons(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const MyCouponsListShimmer();
        }
        else if(!snapshot.hasData || snapshot.data == null || (snapshot.data?.isEmpty ?? true))
        {
          return const TAnimationLoaderWidget(
              text: "No Coupons are available for you yet!",
              animation: TImages.couponAnimation,
          );
        }
        else if(snapshot.hasError)
        {
          return Center(child:  Text("Something went wrong.".tr),);
        }
        else {
          final coupons = snapshot.data!;
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.sizeOf(context).width*0.0611,
                left: MediaQuery.sizeOf(context).width*0.0611,
                top: MediaQuery.sizeOf(context).height*0.0280,
                bottom: MediaQuery.sizeOf(context).height*0.0280,
              ),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => MyCouponItem(coupon: coupons[index]),
                  separatorBuilder: (context, index) => const SizedBox(height: 16,),
                  itemCount: coupons.length
              ),
            ),
          );
        }
      },
    );
  }
}