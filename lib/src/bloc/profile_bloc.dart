import 'package:apilorning/src/model/profile/user_me_model.dart';
import 'package:apilorning/src/provider/api_provider.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc {
  final ApiProvider _provider = ApiProvider();
  final _fetchProfile = PublishSubject<UserMeModel>();

  Stream<UserMeModel> get getProfile => _fetchProfile.stream;

  userProfile() async {
    UserMeModel userMeModel  = await _provider.getProfileUser();
    _fetchProfile.sink.add(userMeModel);
  }
}
final profileBloc = ProfileBloc();
