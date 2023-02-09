import 'package:apilorning/src/ui/menu/account/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../model/profile/model _account.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int selectedIndex = -1;

  List<ModelAccount> dataAcc = [
    ModelAccount(
      image: "assets/icons/user.svg",
      text: "Profile",
    ),
    ModelAccount(
      image: "assets/icons/bag.svg",
      text: "Order",
    ),
    ModelAccount(
      image: "assets/icons/location.svg",
      text: "Address",
    ),
    ModelAccount(
      image: "assets/icons/creditCard.svg",
      text: "Payment",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: false,
        shadowColor: const Color(0xFFEBF0FB),
        title: const Text(
          "Account",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  if (selectedIndex == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProfileScreen(
                            title: dataAcc[index].text,
                          );
                        },
                      ),
                    );
                  }
                });
              },
              child: Container(
                color: selectedIndex == index
                    ? const Color(0xFFEBF0FF)
                    : Colors.transparent,
                height: 56,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      dataAcc[index].image,
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        dataAcc[index].text,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
