import 'package:get/get.dart';
import 'package:k12_analiz/examples/models/derslik_list_model.dart';
import 'package:http/http.dart' as http;

class DerslikListController extends GetxController{
  var isLoading = 0.obs;
  var dataList = <DerslikListModel>[].obs;
  int statusCode = 0;

  Future getData({required int idSinav}) async{
    try{
      isLoading(0);

      var response = await http.get(Uri.parse('https://api_sinav.k12mos.com/api/sorumluluk/derslikler/$idSinav'));
      statusCode = response.statusCode;

      if (response.statusCode == 200) {
        var data = derslikListModelFromJson(response.body);
        dataList.assignAll(data);

        isLoading(1);
      } else if (response.statusCode == 400) {
        // await BadRequestService.handleError(response);
      } else {
        isLoading(2);
        // await BadRequestService.handleError(response);
      }
    }catch(e){
      isLoading(2);
      // await HandleExceptionService.handleException(e, statusCode);
    }
  }
}