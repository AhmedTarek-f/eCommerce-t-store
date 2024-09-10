import 'package:flutter/material.dart';
import 'package:t_store/core/constants/image_strings.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration:  BoxDecoration(border:Border.all(color: Colors.grey) ,borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: (){},
            icon: Image.asset(
              TImages.google,
              width: MediaQuery.sizeOf(context).width*0.0611,
              height: MediaQuery.sizeOf(context).height*0.028,
            ),
          ),
        ),
        const SizedBox(width: 16,),
        Container(
          decoration:  BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: (){},
            icon: Image.asset(
              TImages.facebook,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ],
    );
  }
}
