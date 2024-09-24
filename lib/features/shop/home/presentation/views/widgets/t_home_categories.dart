import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/image_text_widgets/t_vertical_image_text.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/features/shop/home/model/category_model.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });
  final List<CategoryModel> categoriesList =const [
    CategoryModel(categoryName: "shoes Category", categoryImg: TImages.shoeIcon),
    CategoryModel(categoryName: "cloth Category", categoryImg: TImages.clothIcon),
    CategoryModel(categoryName: "animal Category", categoryImg: TImages.animalIcon),
    CategoryModel(categoryName: "furniture Category", categoryImg: TImages.furnitureIcon),
    CategoryModel(categoryName: "jewelery Category", categoryImg: TImages.jeweleryIcon),
    CategoryModel(categoryName: "sport Category", categoryImg: TImages.sportIcon),
    CategoryModel(categoryName: "electronics Category", categoryImg: TImages.electronicsIcon),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).width*0.0611),
        child: ListView.separated(
          itemCount: categoriesList.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder:(context, index) => TVerticalImageText(title:categoriesList[index].categoryName ,image: categoriesList[index].categoryImg,),
          separatorBuilder: (context, index) => const SizedBox(width: 16,),
        ),
      ),
    );
  }
}