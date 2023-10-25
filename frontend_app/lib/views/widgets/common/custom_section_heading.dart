import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';

class CustomSectionHeading extends StatelessWidget {
  final String title, buttonTitle;
  final Color? textColor;
  final bool showActionButton;
  final void Function()? onPressed;

  const CustomSectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = "Explore All",
    this.textColor,
    required this.showActionButton,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: textColor, fontWeight: FontWeight.bold)),
        if (showActionButton)
          TextButton(
              onPressed: onPressed,
              child: Text(
                buttonTitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColor.darkerGrey),
              )),
      ],
    );
  }
}
