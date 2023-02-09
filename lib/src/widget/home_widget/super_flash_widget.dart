import 'package:apilorning/src/model/home/super_flash_model.dart';
import 'package:apilorning/src/ui/menu/home/item/offer_home.dart';
import 'package:apilorning/src/widget/home_widget/corousel_box_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SuperFlashWidget extends StatefulWidget {
  final List<SuperFlashResult> superFlash;

  const SuperFlashWidget({
    Key? key,
    required this.superFlash,
  }) : super(key: key);

  @override
  State<SuperFlashWidget> createState() => _SuperFlashWidgetState();
}

class _SuperFlashWidgetState extends State<SuperFlashWidget> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 222,
          child: widget.superFlash.isEmpty
              ? Container()
              : CarouselSlider.builder(
                  itemCount: widget.superFlash.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    pageViewIndex = _activeIndex;
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return OfHomeScreen(
                                id: widget.superFlash[itemIndex].id,
                                name: widget.superFlash[itemIndex].name,
                              );
                            }),
                          );
                        },
                        child: CarouselBoxWidget(
                          image: widget.superFlash[itemIndex].image,
                          name: widget.superFlash[itemIndex].name,
                        ));
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        _activeIndex = index;
                      });
                    },
                    height: 390.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 1,
                  ),
                ),
        ),
        Center(
          child: AnimatedSmoothIndicator(
            count: 5,
            activeIndex: _activeIndex,
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
      ],
    );
  }
}
