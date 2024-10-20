import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/shop/product_review/presentation/views_model/product_review_controller.dart';

class ReviewForm extends StatelessWidget {
  const ReviewForm({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final ProductReviewController controller = ProductReviewController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RatingBar(
            minRating: 1,
            maxRating: 5,
            initialRating: 1,
            allowHalfRating: false,
            ratingWidget: RatingWidget(
                full: const Icon(
                  Iconsax.star_1,
                  color: TColors.primary,
                ),
                half: const Icon(
                  Iconsax.star_1,
                  color: TColors.grey,
                ),
                empty: const Icon(
                  Iconsax.star_1,
                  color: TColors.grey,
                )),
            onRatingUpdate: (ratting) {
              controller.rating.value = ratting;
            },
            updateOnDrag: true,
            unratedColor: TColors.grey,
            glow: true,
            glowColor: TColors.primaryColor.withOpacity(0.7),
            itemSize: 24,
          ),
        ),
        TextField(
          controller: controller.userReview,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isDarkMode ? Colors.white : Colors.black),
              borderRadius: BorderRadius.circular(16),
            ),
            hintText: "Add your review",
            hintStyle: const TextStyle(color: TColors.darkGrey,fontSize: 14),
            contentPadding: const EdgeInsets.only(left: 24,bottom:16 ,right:16 ,top:16 ),
          ),
          onChanged: (value) {
            controller.userReview.text = value;
          },
          maxLines: null,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width*0.2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(8)),
                onPressed: () async {
                  await controller.checkUserReview(productId: productId);
                },
                child: Text("Send".tr),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
