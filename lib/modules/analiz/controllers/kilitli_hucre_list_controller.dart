import 'package:get/get.dart';
import 'package:k12_analiz/modules/analiz/models/kilitli_hucre_model.dart';

class KilitliHucreListController extends GetxController{
  var isLoading = 0.obs;
  var dataList = <KilitliHucreModel>[].obs;
  int statusCode = 0;

  Future getData() async{
    isLoading(0);
    await Future.delayed(const Duration(seconds: 1));

    List<KilitliHucreModel> mockData = [
      KilitliHucreModel(zamanId: 1, derslikId: 1, periyotId: 1),
    ];

    dataList.assignAll(mockData);
    isLoading(1);
  }
}