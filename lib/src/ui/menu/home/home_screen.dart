import 'package:apilorning/src/bloc/home_bloc.dart';
import 'package:apilorning/src/model/home/home_model.dart';
import 'package:apilorning/src/widget/item/bulder_title_widget.dart';
import 'package:apilorning/src/widget/item/product_grid_widget.dart';
import 'package:apilorning/src/widget/home_widget/category_widget.dart';
import 'package:apilorning/src/widget/item/product_widgets.dart';
import 'package:apilorning/src/widget/home_widget/recomended_product_widget.dart';
import 'package:apilorning/src/widget/home_widget/super_flash_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    homeBloc.allHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              "assets/icons/love.svg",
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              "assets/icons/notification.svg",
            ),
          ),
        ],
        title: Container(
          height: 42,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: const Color(0xFFE0F0FF),
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: SvgPicture.asset(
                  "assets/icons/search.svg",
                  width: 22,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search Product', border: InputBorder.none),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: StreamBuilder<HomeModel>(
        stream: homeBloc.getAllHome,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            HomeModel data = snapshot.data!;
            return ListView(
              children: [
                SuperFlashWidget(
                  superFlash: data.superFlash,
                ),
                const BuilderTitleWidget(
                  name: "Category",
                  more: "More Category",
                ),
                CategoryWidget(
                  category: data.category,
                ),
                const BuilderTitleWidget(
                  name: "Flash Sale",
                  more: "See More",
                ),
                ProductWidgets(
                  data: data.flashSale,
                ),
                const BuilderTitleWidget(
                  name: "Mega Sale",
                  more: "See More",
                ),
                ProductWidgets(
                  data: data.megaSale,
                ),
                const RecomendedProductWidget(),
                ProductGridWidget(
                  sale: data.homeSale,
                ),
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
