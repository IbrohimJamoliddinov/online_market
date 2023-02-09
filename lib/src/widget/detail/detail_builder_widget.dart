import 'package:apilorning/src/utils/app_theme.dart';
import 'package:flutter/material.dart';

class DetailBuilderWidget extends StatefulWidget {
  final String name;
  final List list;

  const DetailBuilderWidget({
    Key? key,
    required this.name,
    required this.list,
  }) : super(key: key);

  @override
  State<DetailBuilderWidget> createState() => _DetailBuilderWidgetState();
}

class _DetailBuilderWidgetState extends State<DetailBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
          child: Row(
            children: [
              Text(
                "Select ${widget.name}",
                style: TextStyle(
                  color: AppTheme.neturelDark,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        SizedBox(
          height: 56,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.list.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 48,
                  height: 48,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: widget.name == "Color"
                        ? Color(int.parse(
                            widget.list[index].color.replaceFirst('#', '0xFF')))
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: widget.name == "Size"
                          ? const Color(0xFFEBF0FF)
                          : Colors.transparent,
                      width: 1,
                    ),
                  ),
                  child: widget.name == "Size" ? Center(
                    child: Text(
                      widget.list[index].size,
                      style: TextStyle(
                        color: AppTheme.neturelDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ) : Container(),

                );
              }),
        ),
      ],
    );
  }
}
