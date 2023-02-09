import 'package:flutter/material.dart';

class CarouselBoxWidget extends StatefulWidget {

  final String image;
   final String name;

  const CarouselBoxWidget(
      {Key? key, required this.image,  required this.name,})
      : super(key: key);

  @override
  State<CarouselBoxWidget> createState() => _CarouselBoxWidgetState();
}

class _CarouselBoxWidgetState extends State<CarouselBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              widget.image,
              fit: BoxFit.fitWidth,
              width: 383,
            ),
          ),
        ),
        Container(
                margin: const EdgeInsets.all(16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        height: 1.5,
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 4),
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child: Text(
                              '08',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF223263),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          ':',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 42,
                          height: 42,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child: Text(
                              '34',
                              style: TextStyle(
                                color: Color(0xFF223263),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          ':',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 42,
                          height: 42,
                          margin: const EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child: Text(
                              '52',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF223263),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
