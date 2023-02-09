import 'package:apilorning/src/model/home/category_model.dart';
import 'package:apilorning/src/provider/api_provider.dart';
import 'package:rxdart/rxdart.dart';

import '../model/http_result.dart';

class ExploreBloc {
  final ApiProvider _provider = ApiProvider();
  final _fetchExplore = PublishSubject<List<ExploreModel>>();

  Stream<List<ExploreModel>> get getExplore => _fetchExplore.stream;

  allExplore() async {
    HttpResult response = await _provider.getCategory();
    if (response.isSuccess) {
      CategoryModel categoryModel = CategoryModel.fromJson(response.data);
      List<ExploreModel> data = [];
      data.add(
        ExploreModel(
          id: categoryModel.results.first.genderTypes,
          name: categoryModel.results.first.genderType.genderType,
          results: [
            categoryModel.results.first,
          ],
        ),
      );

      for (int j = 1; j < categoryModel.results.length; j++) {
        bool add = true;
        for (int i = 0; i < data.length; i++) {
          if (categoryModel.results[j].genderTypes == data[i].id) {
            add = false;
            data[i].results.add(categoryModel.results[j]);
            break;
          }
        }
        if (add) {
          data.add(
            ExploreModel(
              id: categoryModel.results[j].genderTypes,
              name: categoryModel.results[j].genderType.genderType,
              results: [
                categoryModel.results[j],
              ],
            ),
          );
        }
      }
      _fetchExplore.sink.add(data);
    }
  }
}

final exploreBloc = ExploreBloc();
