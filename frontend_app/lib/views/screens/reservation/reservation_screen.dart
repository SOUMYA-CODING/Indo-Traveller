import 'package:flutter/material.dart';
import 'package:frontend_app/constants/sizes.dart';
import 'package:frontend_app/views/widgets/reservation/reservation_app_bar.dart';
import 'package:frontend_app/views/widgets/reservation/reservation_room_details_section.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ReservationAppBar(),
            SizedBox(height: AppSizes.spaceBtwItems),
            ReservationRoomDetailsSection(
              image:
                  "https://a0.muscache.com/im/pictures/miso/Hosting-5264493/original/10d2c21f-84c2-46c5-b20b-b51d1c2c971a.jpeg?im_w=1200",
              propertyType: "Farm",
              title: "Vihang Farmhouse: Florican Room",
            ),
          ],
        ),
      ),
    );
  }
}
