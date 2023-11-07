import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/views/widgets/common/custom_circle_container.dart';
import 'package:frontend_app/views/widgets/shapes/curved_edge_widget.dart';

class CustomHeader extends StatelessWidget {
  final Widget child;

  const CustomHeader({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: AppColor.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
                top: -150,
                right: -250,
                child: CustomCircleContainer(
                    backgroundColor: Colors.white.withOpacity(0.1))),
            Positioned(
                top: 100,
                right: -300,
                child: CustomCircleContainer(
                    backgroundColor: Colors.white.withOpacity(0.1))),
            child,
          ],
        ),
      ),
    );
  }
}
