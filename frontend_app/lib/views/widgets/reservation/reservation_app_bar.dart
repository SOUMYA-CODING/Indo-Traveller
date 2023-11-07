import 'package:flutter/material.dart';
import 'package:frontend_app/views/widgets/common/custom_app_bar.dart';

class ReservationAppBar extends StatelessWidget {
  const ReservationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  const CustomAppBar(
      showBackArrow: true,
      title: Text("Request to book"),
    );
  }
}
