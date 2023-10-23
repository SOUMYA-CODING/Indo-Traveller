import 'package:flutter/material.dart';
import 'package:frontend_app/views/widgets/shapes/custom_curved_edges.dart';

class CurvedEdgeWidget extends StatelessWidget {
  final Widget? child;

  const CurvedEdgeWidget({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: child,
    );
  }
}