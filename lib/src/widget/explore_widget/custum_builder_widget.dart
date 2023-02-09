import 'package:apilorning/src/model/home/category_model.dart';
import 'package:flutter/cupertino.dart';

class CustomBuilderWidget extends StatelessWidget {
  final List<ExploreModel> data;
  final int index;
  const CustomBuilderWidget({Key? key, required this.data, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: (data[index].results.length + 3) ~/ 4,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      border: Border.all(
                        color: const Color(0xFFEBF0FF),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    width: 70,
                    height: 70,
                    child: Center(
                      child: Image.network(
                        data[index].results[4 * index].image,
                        width: 18,
                        height: 18,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      data[index].results[4 * index].name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: 4 * index + 1 >= data[index].results.length
                  ? Container()
                  : Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      border: Border.all(
                        color: const Color(0xFFEBF0FF),
                        width: 1.5,
                      ),
                      borderRadius:
                      BorderRadius.circular(35),
                    ),
                    width: 70,
                    height: 70,
                    child: Center(
                      child: Image.network(
                        data[index]
                            .results[4 * index + 1]
                            .image,
                        width: 18,
                        height: 18,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      data[index]
                          .results[4 * index + 1]
                          .name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: 4 * index + 2 >= data[index].results.length
                  ? Container()
                  : Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      border: Border.all(
                        color: const Color(0xFFEBF0FF),
                        width: 1.5,
                      ),
                      borderRadius:
                      BorderRadius.circular(35),
                    ),
                    width: 70,
                    height: 70,
                    child: Center(
                      child: Image.network(
                        data[index]
                            .results[4 * index + 2]
                            .image,
                        width: 18,
                        height: 18,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      data[index]
                          .results[4 * index + 2]
                          .name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: 4 * index + 3 >= data[index].results.length
                  ? Container()
                  : Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      border: Border.all(
                        color: const Color(0xFFEBF0FF),
                        width: 1.5,
                      ),
                      borderRadius:
                      BorderRadius.circular(35),
                    ),
                    width: 70,
                    height: 70,
                    child: Center(
                      child: Image.network(
                        data[index]
                            .results[4 * index + 3]
                            .image,
                        width: 18,
                        height: 18,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      data[index]
                          .results[4 * index + 3]
                          .name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
