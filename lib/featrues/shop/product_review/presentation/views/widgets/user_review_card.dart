import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/featrues/shop/product_review/presentation/views/widgets/t_rating_bar_indicator.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.userProfileImage2),),
                const SizedBox(width: 16,),
                Text("Ahmed Tarek", style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: 16,),
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            Text("23 Sept, 2024",style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: 16,),
        const ReadMoreText(
          "The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great jop!",
          trimMode: TrimMode.Line,
          trimLength: 2,
          trimExpandedText: " show less",
          trimCollapsedText: " show more",
          moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
        ),
        const SizedBox(height: 16,),
        TRoundedContainer(
          backGroundColor: isDarkMode ? TColors.darkerGrey :TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("T's Store",style: Theme.of(context).textTheme.titleMedium,),
                    Text("25 Sept, 2024",style: Theme.of(context).textTheme.titleMedium,),
                  ],
                ),
                const SizedBox(height: 16,),
                const ReadMoreText(
                  "The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great jop!",
                  trimMode: TrimMode.Line,
                  trimLength: 2,
                  trimExpandedText: " show less",
                  trimCollapsedText: " show more",
                  moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
