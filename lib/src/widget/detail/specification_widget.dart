import 'package:apilorning/src/model/home/detail_model.dart';
import 'package:apilorning/src/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';

class SpecificationWidget extends StatefulWidget {
  final List<Specification> data;

  const SpecificationWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<SpecificationWidget> createState() => _SpecificationWidgetState();
}

class _SpecificationWidgetState extends State<SpecificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
          child: Row(
            children: [
              Text(
                "Specification",
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
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Shown:",
                  style: TextStyle(
                    color: AppTheme.neturelDark,
                    fontSize: 12,
                    height: 1.8,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Expanded(
                child: widget.data.isEmpty
                    ? Container()
                    : Column(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.data[0].shown,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: AppTheme.neutrelGrey,
                              fontSize: 12,
                              height: 1.8,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  "Style:",
                  style: TextStyle(
                    color: AppTheme.neturelDark,
                    fontSize: 12,
                    height: 1.8,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              widget.data.isEmpty
                  ? Container()
                  : Expanded(
                      child: Text(
                        widget.data[0].style,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: AppTheme.neutrelGrey,
                          fontSize: 12,
                          height: 1.8,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
            ],
          ),
        ),
        widget.data.isEmpty
            ? Container()
            : Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  widget.data[0].textmodels,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                    color: AppTheme.neutrelGrey,
                  ),
                ),
              ),
      ],
    );
  }
}
