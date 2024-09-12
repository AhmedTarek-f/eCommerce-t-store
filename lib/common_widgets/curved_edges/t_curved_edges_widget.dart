import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/curved_edges/curved_edges.dart';

class TCurvedEdgedWidget extends StatelessWidget {
  const TCurvedEdgedWidget({
    super.key, this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: child,
    );
  }
}
