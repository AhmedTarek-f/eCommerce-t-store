import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/features/shop/sub_categories/presentation/views/widgets/sub_categories_view_body.dart';

class SubCategoriesView extends StatelessWidget {
  const SubCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(
        title: Text("Sport",style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: const SubCategoriesViewBody(),
    );
  }
}
