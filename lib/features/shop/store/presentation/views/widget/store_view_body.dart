import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_search_container.dart';
import 'package:t_store/common_widgets/layouts/t_grid_layout.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/shop/store/presentation/views/widget/t_brand_card.dart';
import 'package:t_store/features/shop/store/presentation/views/widget/t_category_tab.dart';
import 'package:t_store/features/shop/store/presentation/views/widget/t_tab_bar.dart';

class StoreViewBody extends StatelessWidget {
  const StoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return DefaultTabController(
      length: 5,
      child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return[
               SliverAppBar(
                pinned: true,
                floating: true,
                automaticallyImplyLeading: false,
                backgroundColor: isDarkMode? Colors.black:TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.sizeOf(context).width*0.0611,
                    left: MediaQuery.sizeOf(context).width*0.0611,
                    top: MediaQuery.sizeOf(context).height*0.0280,
                    bottom: MediaQuery.sizeOf(context).height*0.0280,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics:  const NeverScrollableScrollPhysics(),
                    children:  [
                      const SizedBox(height: 16,),
                      const TSearchContainer(
                        text: "Search in Store" ,
                        showBorder: true,
                        padding: EdgeInsets.zero,
                        showBackGround: false,
                      ),
                      const SizedBox(height: 32,),
                      TSectionHeading(title: "Featured Brands",onPressed: (){},padding: EdgeInsets.zero,),
                      const SizedBox(height: 10.5,),
                      TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (context, index) => const TBrandCard(showBorder: true,),
                      ),
                    ],
                  ),
                ),
                 bottom: const TTabBar(
                     tabs: [
                       Text("Sports"),
                       Text("Furniture"),
                       Text("Electronics"),
                       Text("Clothes"),
                       Text("Cosmetics"),
                     ]
                 ),
              ),
            ];
          },
          body: const TabBarView(
              children: [
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
          ],
          ),
      ),
    );
  }
}




