import 'package:apilorning/src/model/home/detail_model.dart';
import 'package:apilorning/src/provider/api_provider.dart';
import 'package:rxdart/rxdart.dart';
import '../model/http_result.dart';

class DetailBloc {
  final ApiProvider _provider = ApiProvider();
  final _fetchDetail = PublishSubject<DetailModel>();

  Stream<DetailModel> get getDetail => _fetchDetail.stream;

  detailAll(int id) async {
    HttpResult responseDetail = await _provider.getDetail(id);
    if (responseDetail.isSuccess) {
      DetailModel detailModel = DetailModel.fromJson(
        responseDetail.data,
      );
      _fetchDetail.sink.add(detailModel);
    }
  }
}

final detailBloc = DetailBloc();
