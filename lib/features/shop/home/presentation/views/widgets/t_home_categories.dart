import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/image_text_widgets/t_vertical_image_text.dart';
import 'package:t_store/features/shop/home/presentation/views/widgets/t_category_shimmer.dart';
import 'package:t_store/features/shop/sub_categories/presentation/views/sub_categories_view.dart';
import 'package:t_store/features/shop/home/presentation/views_model/category_controller.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.put(CategoryController());
    
    return Obx(() {
      if(categoryController.isLoading.value)
        {
          return  const TCategoryShimmer();
        }
      else if(categoryController.featuredCategories.isEmpty){
        return Center(child: Text("No Data Found",style:  Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);
      }
      else {
        return SizedBox(
          height: 80,
          child: Padding(
            padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).width*0.0611),
            child: ListView.separated(
              itemCount: categoryController.featuredCategories.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder:(context, index) {
                final category = categoryController.featuredCategories[index];
                return TVerticalImageText(
                  title: category.name ,
                  image: category.image,
                  onTap: (){
                    Get.to(()=> const SubCategoriesView());
                  },
                );
              } ,
              separatorBuilder: (context, index) => const SizedBox(width: 16,),
            ),
          ),
        );
      }
    },
    );
  }
}

