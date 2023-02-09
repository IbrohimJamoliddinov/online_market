// ignore_for_file: must_be_immutable
import 'package:apilorning/src/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/profile/profile_item_icon_model.dart';

class ProfileItemWidget extends StatelessWidget {
  final String name;
  final String value;
  final int index;
  String password;
  bool pass;

  ProfileItemWidget({
    Key? key,
    required this.value,
    required this.name,
    required this.index,
    this.password = "",
    this.pass = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProfileItemIconModel> images = [
      ProfileItemIconModel(
        image: "assets/icons/gender.svg",
      ),
      ProfileItemIconModel(
        image: "assets/icons/birthday.svg",
      ),
      ProfileItemIconModel(
        image: "assets/icons/mail.svg",
      ),
      ProfileItemIconModel(
        image: "assets/icons/phone.svg",
      ),
      ProfileItemIconModel(
        image: "assets/icons/password.svg",
      ),
    ];
    return Container(
      height: 54,
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: SvgPicture.asset(
              images[index].image,
              fit: BoxFit.scaleDown,
              color: AppTheme.primaryBlue,
            ),
          ),
          const SizedBox(
            width: 18,
          ),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Color(0xFF223263),
            ),
          ),
          const Spacer(),
          pass
              ? SizedBox(
                  height: 20,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: password.length,
                      itemBuilder: (__, _) {
                        return Container(
                          margin: const EdgeInsets.only(right: 2),
                          child: const Center(
                            child: Text(
                              "*",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        );
                      }))
              : Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFF9098B1),
                  ),
                ),
          const SizedBox(
            width: 16,
          ),
          SvgPicture.asset(
            "assets/icons/right.svg",
            fit: BoxFit.scaleDown,
            color: AppTheme.primaryBlue,
          )
        ],
      ),
    );
  }
}
