import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/common_widgets/curved_edges/t_curved_edges_widget.dart';
import 'package:t_store/core/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key, required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCurvedEdgedWidget(
      child: Container(
        color: TColors.primary,
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
            Positioned(
              right: -250,
              top: -150,
              child: TRoundedContainer(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height*0.42,
                radius: MediaQuery.sizeOf(context).height*0.42,
                backGroundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TRoundedContainer(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height*0.42,
                radius: MediaQuery.sizeOf(context).height*0.42,
                backGroundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
