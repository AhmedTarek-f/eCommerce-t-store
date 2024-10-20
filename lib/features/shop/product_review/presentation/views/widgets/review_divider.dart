import 'package:flutter/material.dart';

class ReviewDivider extends StatelessWidget {
  const ReviewDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.1),
      child: const Divider(
        height: 32,
        thickness: 2,
      ),
    );
  }
}
