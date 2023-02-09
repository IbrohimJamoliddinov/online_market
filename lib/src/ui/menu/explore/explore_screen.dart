import 'package:apilorning/src/bloc/explore_bloc.dart';
import 'package:apilorning/src/model/home/category_model.dart';
import 'package:apilorning/src/utils/app_theme.dart';
import 'package:apilorning/src/widget/explore_widget/custum_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  void initState() {
    exploreBloc.allExplore();
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
            margin: const EdgeInsets.only(
              right: 16,
            ),
            child: SvgPicture.asset(
              "assets/icons/notification.svg",
            ),
          ),
        ],
        title: Container(
          height: 48,
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
                  autofocus: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 0),
                    border: InputBorder.none,
                    hintText: 'Search Product',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: StreamBuilder<List<ExploreModel>>(
        stream: exploreBloc.getExplore,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ExploreModel> data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, value) {
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin:
                          const EdgeInsets.only(top: 16, left: 16, bottom: 12),
                      child: Text(
                        "${data[value].name} fashion",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          letterSpacing: 0.5,
                          color: AppTheme.neturelDark,
                        ),
                      ),
                    ),
                    CustomBuilderWidget(data: data, index: value),
                  ],
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
