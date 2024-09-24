import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/featrues/personalization/my_address/presentation/views/widgets/add_new_address_view_body.dart';

class AddNewAddressView extends StatelessWidget {
  const AddNewAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text("Add new Address"),
        showBackArrow: true,
      ),
      body: AddNewAddressViewBody(),
    );
  }
}
