import 'package:apilorning/src/model/home/category_model.dart';
import 'package:apilorning/src/model/home/home_model.dart';
import 'package:apilorning/src/model/home/product_model.dart';
import 'package:apilorning/src/model/home/super_flash_model.dart';
import 'package:apilorning/src/model/http_result.dart';
import 'package:apilorning/src/provider/api_provider.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final ApiProvider _provider = ApiProvider();
  final _fetchHome = PublishSubject<HomeModel>();
  final _fetchHomeOffer = PublishSubject<HttpResult>();

  Stream<HomeModel> get getAllHome => _fetchHome.stream;

  HomeModel data = HomeModel(
    superFlash: [],
    flashSale: [],
    megaSale: [],
    homeSale: [],
    category: [],
  );

  allHome() async {
    HttpResult responseCategory = await _provider.getCategory();
    if (responseCategory.isSuccess) {
      CategoryModel categoryModel = CategoryModel.fromJson(
        responseCategory.data,
      );
      data.category = categoryModel.results;
      _fetchHome.sink.add(data);
    }

    HttpResult responseSuperFlash = await _provider.getSuperFlash();
    if (responseSuperFlash.isSuccess) {
      SuperFlashModel superFlashModel =
          SuperFlashModel.fromJson(responseSuperFlash.data);
      data.superFlash = superFlashModel.results;
      _fetchHome.sink.add(data);
    }

    HttpResult responseFlashSaleModel = await _provider.getFlashSale();
    if (responseFlashSaleModel.isSuccess) {
      ProductModel productModel =
          ProductModel.fromJson(responseFlashSaleModel.data);
      data.flashSale = productModel.results;
      _fetchHome.sink.add(data);
    }

    HttpResult responseMageSaleModel = await _provider.getMageSale();
    if (responseMageSaleModel.isSuccess) {
      ProductModel productModel = ProductModel.fromJson(
        responseMageSaleModel.data,
      );
      data.megaSale = productModel.results;
      _fetchHome.sink.add(data);
    }

    HttpResult responseHomeSaleModel = await _provider.getHomeSale();
    if (responseHomeSaleModel.isSuccess) {
      ProductModel productModel = ProductModel.fromJson(
        responseHomeSaleModel.data,
      );
      data.homeSale = productModel.results;
      _fetchHome.sink.add(data);
    }
  }

  homeOffer(int id) async{
    HttpResult offerHomeModel = await _provider.getOffer(id);
    if(offerHomeModel.isSuccess){
      SuperFlashResult offerHome = SuperFlashResult.fromJson(
        offerHomeModel.data,
      );
      _fetchHomeOffer.sink.add(offerHomeModel);
    }
  }
}

final homeBloc = HomeBloc();
