import 'package:apilorning/src/model/home/product_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailCarouselWidget extends StatefulWidget {
  final List<ProductImages> data;

  const DetailCarouselWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailCarouselWidget> createState() => _DetailCarouselWidgetState();
}

class _DetailCarouselWidgetState extends State<DetailCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    int activeIndex = 0;
    return Column(children: [
      SizedBox(
        height: 222,
        child: widget.data.isEmpty
            ? Container()
            : CarouselSlider.builder(
                itemCount: widget.data.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  pageViewIndex = activeIndex;
                  return Container(
                    margin: const EdgeInsets.all(16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        widget.data[itemIndex].image,
                        fit: BoxFit.fitWidth,
                        width: 383,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  height: 390.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 1,
                ),
              ),
      ),
      Center(
        child: AnimatedSmoothIndicator(
          count: 5,
          activeIndex: activeIndex,
          effect: const SlideEffect(
            spacing: 8.0,
            radius: 4.0,
            dotWidth: 8.0,
            dotHeight: 8.0,
            // paintStyle:  PaintingStyle.stroke,
            strokeWidth: 1.5,
            dotColor: Color(0xFFD0D5E5),
            activeDotColor: Color(0xFF40BFFF),
          ),
        ),
      ),
    ]);
  }
}
