import 'package:apilorning/src/bloc/home_bloc.dart';
import 'package:apilorning/src/model/home/super_flash_model.dart';
import 'package:apilorning/src/widget/item/product_grid_widget.dart';
import 'package:apilorning/src/widget/home_widget/corousel_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OfHomeScreen extends StatefulWidget {
  final int id;
  final String name;

  const OfHomeScreen({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);

  @override
  State<OfHomeScreen> createState() => _OfHomeScreeState();
}

class _OfHomeScreeState extends State<OfHomeScreen> {

  @override
  void initState() {
    homeBloc.homeOffer(widget.id);
    super.initState();
  }

  int gridCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: const Icon(
              Icons.arrow_back_ios_outlined,
              size: 20,
              color: Colors.grey,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          widget.name,
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: Color(0xFF223263),
            fontSize: 16,
            fontWeight: FontWeight.bold,
            height: 1.5,
            letterSpacing: 0.5,
          ),
        ),
        actions: [
          SvgPicture.asset(
            "assets/icons/search.svg",
            width: 20,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: StreamBuilder<SuperFlashResult>(
        stream: homeBloc.homeOffer(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            SuperFlashResult data = snapshot.data!;
            return ListView(
              children: [
                SizedBox(
                  height: 222,
                  child: CarouselBoxWidget(
                    image: data.image,
                    name: data.name,
                  ),
                ),
                ProductGridWidget(
                  sale: data.product,
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

}
