import 'package:get/get.dart';
import 'package:presen/app/data/base_provider.dart';

class LoginProvider extends BaseProvider {
  Future<Response> auth(Map data) =>
      post('$myUrl/signin', data, headers: myHeader);

  Future<Response> cuti() => get('$myUrl/data-cuti', headers: myHeader);
  Future<Response> ListCuti() => get('$myUrl/list-cuti', headers: myHeader);
  Future<Response> storeCuti(Map data) =>
      post('$myUrl/store-cuti', data, headers: myHeader);

  Future<Response> storePresen(Map data) =>
      post('$myUrl/scan', data, headers: myHeader);
}
