import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/features/shop/search_in_store/presentation/views/widgets/search_in_store_view_body.dart';

class SearchInStoreView extends StatelessWidget {
  const SearchInStoreView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(
        title: Text("Search In Store".tr,style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: const SearchInStoreViewBody(),
    );
  }
}
