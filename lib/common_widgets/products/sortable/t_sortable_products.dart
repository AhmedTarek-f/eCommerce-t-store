import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/layouts/t_grid_layout.dart';
import 'package:t_store/common_widgets/products/products_card/t_product_card_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
    required this.searchListOptions,
  });

  final List<String> searchListOptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort_copy)),
          items: searchListOptions.map((searchItem) => DropdownMenuItem(value: searchItem,child: Text(searchItem),),).toList(),
          onChanged: (value){},
        ),
        const SizedBox(height: 32,),
        TGridLayout(itemCount: 6, itemBuilder: (context, index) => const TProductCardVertical(),),
      ],
    );
  }
}
