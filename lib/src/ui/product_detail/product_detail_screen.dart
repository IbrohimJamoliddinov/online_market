import 'package:apilorning/src/bloc/detail_bloc.dart';
import 'package:apilorning/src/model/home/detail_model.dart';
import 'package:apilorning/src/utils/app_theme.dart';
import 'package:apilorning/src/widget/appBar_widget/leding_pop_widget.dart';
import 'package:apilorning/src/widget/detail/detail_builder_widget.dart';
import 'package:apilorning/src/widget/detail/detail_corousel_widget.dart';
import 'package:apilorning/src/widget/appBar_widget/detail_title_widget.dart';
import 'package:apilorning/src/widget/detail/detail_list_widget.dart';
import 'package:apilorning/src/widget/detail/review_widget.dart';
import 'package:apilorning/src/widget/detail/specification_widget.dart';
import 'package:apilorning/src/widget/item/bulder_title_widget.dart';
import 'package:apilorning/src/widget/item/product_widgets.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final int id;
  final String name;

  const ProductDetailScreen({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    detailBloc.detailAll(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
          elevation: 0.5,
          centerTitle: false,
          leading: const LeadingPopWidget(),
          backgroundColor: const Color(0xFFE5E5E5),
          title: DetailTitleWidget(name: widget.name)),
      body: StreamBuilder<DetailModel>(
        stream: detailBloc.getDetail,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            DetailModel detailModel = snapshot.data!;
            return ListView(
              children: [
                detailModel.images.isNotEmpty
                    ? DetailCarouselWidget(data: detailModel.images)
                    : Container(),
                DetailListWidget(
                    name: detailModel.name,
                    reviewAvg: detailModel.reviewAvg,
                    price: detailModel.price),
                detailModel.size.isNotEmpty
                    ? DetailBuilderWidget(
                        name: "Size",
                        list: detailModel.size,
                      )
                    : Container(),
                detailModel.color.isNotEmpty
                    ? DetailBuilderWidget(
                        name: "Color",
                        list: detailModel.color,
                      )
                    : Container(),
                detailModel.specification.isNotEmpty
                    ? SpecificationWidget(
                        data: detailModel.specification,
                      )
                    : Container(),
                const BuilderTitleWidget(
                  name: "Review Product",
                  more: "See More",
                ),
                // ignore: unnecessary_null_comparison
                detailModel.review == null
                    ? Container()
                    : ReviewWidget(data: detailModel.review),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text(
                    "You Might Also Like",
                    style: TextStyle(
                      color: AppTheme.neturelDark,
                      fontSize: 16,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                detailModel.products.isEmpty
                    ? Container()
                    : ProductWidgets(data: detailModel.products),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
