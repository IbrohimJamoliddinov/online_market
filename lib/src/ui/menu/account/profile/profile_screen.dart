import 'package:apilorning/src/bloc/profile_bloc.dart';
import 'package:apilorning/src/model/profile/user_me_model.dart';
import 'package:apilorning/src/ui/menu/account/profile/item/calendar_screen.dart';
import 'package:apilorning/src/ui/menu/account/profile/item/change_mail.dart';
import 'package:apilorning/src/ui/menu/account/profile/item/gender_switch.dart';
import 'package:apilorning/src/ui/menu/account/profile/item/password_change.dart';
import 'package:apilorning/src/ui/menu/account/profile/item/phone_change.dart';
import 'package:apilorning/src/widget/account_widget/change_name_widget.dart';
import 'package:apilorning/src/widget/account_widget/profile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  final String title;

  const ProfileScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String lockValue = "";

  @override
  Widget build(BuildContext context) {
    profileBloc.userProfile();
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text(
            widget.title,
            style: const TextStyle(
                color: Color(0xFF223263),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.transparent,
              child: SvgPicture.asset(
                "assets/icons/left.svg",
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
        body: StreamBuilder<UserMeModel>(
          stream: profileBloc.getProfile,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              UserMeModel data = snapshot.data!;
              DateTime dateTime = data.user.birthDate;
              DateFormat format = DateFormat("dd MMMM, yyyy");
              String formattedDate = format.format(dateTime);
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  ChangeNameWidget(data: data.user),
                  const SizedBox(height: 32),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return GenderScreen(
                            change: () {
                              _getData();
                            },
                            gender: data.user.gender,
                          );
                        }),
                      );
                    },
                    child: ProfileItemWidget(
                      value: data.user.gender,
                      name: "Gender",
                     index: 0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CalendarScreen(
                              dayValue: data.user.birthDate,
                              change: () {
                                _getData();
                              },
                            );
                          },
                        ),
                      );
                    },
                    child: ProfileItemWidget(
                      value: formattedDate,
                      name: "Gender",
                      index: 1,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return ChangeMailScreen(
                            title: "Email",
                            change: () {
                              _getData();
                            },
                            mailValue: data.user.email,
                          );
                        }),
                      );
                    },
                    child: ProfileItemWidget(
                      value: data.user.email,
                      name: "Email",
                      index: 2,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return PhoneChange(
                            phoneValue: data.user.number,
                            change: () {
                              _getData();
                            },
                          );
                        }),
                      );
                    },
                    child:ProfileItemWidget(
                      value: data.user.number,
                      name: "Phone Number",
                      index: 3,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return PasswordChangeScreen(
                            change: () {
                              _getData();
                            },
                            oldPass: lockValue.isEmpty
                                ? lockValue.toString()
                                : "12345678",
                          );
                        }),
                      );
                    },
                    child: ProfileItemWidget(value: "", name: "Change Password", index: 4, pass: true,)
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Future<void> _getData() async {
    setState(() {});
  }
}
