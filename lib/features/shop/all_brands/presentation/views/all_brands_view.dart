import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/features/shop/all_brands/presentation/views/widgets/all_brands_view_body.dart';

class AllBrandsView extends StatelessWidget {
  const AllBrandsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Brand",style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: const AllBrandsViewBody(),
    );
  }
}
