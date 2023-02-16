import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/gen/colors.gen.dart';

class AuthorizeCommonTop extends StatelessWidget {
  final String title;

  const AuthorizeCommonTop({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Assets.images.icSmallLogoFull.svg(),
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ColorName.primaryColor,
              ),
        )
      ],
    );
  }
}
