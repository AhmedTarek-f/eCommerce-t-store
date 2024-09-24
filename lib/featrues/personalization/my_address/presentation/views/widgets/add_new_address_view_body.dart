import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class AddNewAddressViewBody extends StatelessWidget {
  const AddNewAddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

        child: Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.sizeOf(context).width*0.0611,
            left: MediaQuery.sizeOf(context).width*0.0611,
            top: MediaQuery.sizeOf(context).height*0.0280,
            bottom: MediaQuery.sizeOf(context).height*0.0280,
          ),
          child:Form(
            child: Column(
              children: [
                TextFormField(decoration:  const InputDecoration(prefixIcon: Icon(Iconsax.user_copy),label: Text("Name",)),),
                const SizedBox(height: 16,),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile_copy),label: Text("Phone Number")),),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_4_copy),label: Text("Street")),)),
                    const SizedBox(width: 16,),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code_copy),label: Text("PostalCode")),)),
                  ],
                ),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_copy),label: Text("City")),)),
                    const SizedBox(width: 16,),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity_copy),label: Text("State")),)),
                  ],
                ),
                const SizedBox(height: 16,),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global_copy),label: Text("Country")),),
                const SizedBox(height: 24,),
                SizedBox(width:MediaQuery.sizeOf(context).width,child: ElevatedButton(onPressed: (){}, child: const Text("Save"))),
              ],
            ),
          ),
        ),
    );
  }
}
