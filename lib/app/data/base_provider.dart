import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

class BaseProvider extends GetConnect {
  var myUrl = 'https://absen.esktraweb.my.id/api';
  var myHeader = {
    'Accept': 'Application/json',
    'Authorization': 'Bearer ${SpUtil.getString('token')!}',
  };
}
