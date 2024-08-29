import 'package:get/get.dart';
import 'package:k12_analiz/modules/analiz/models/id_adi_model.dart';

class DerslikListController extends GetxController{
  var isLoading = 0.obs;
  var dataList = <IdAdi>[].obs;
  int statusCode = 0;

  Future getData() async{
    isLoading(0);
    await Future.delayed(const Duration(seconds: 1));

    List<IdAdi> mockData = [
      IdAdi(id: 1, adi: "D101"),
      IdAdi(id: 2, adi: "D102"),
      IdAdi(id: 3, adi: "D103"),
      IdAdi(id: 4, adi: "D104"),
      IdAdi(id: 5, adi: "D105"),
      IdAdi(id: 6, adi: "D106"),
      IdAdi(id: 7, adi: "D107"),
      IdAdi(id: 8, adi: "D108"),
      IdAdi(id: 9, adi: "D109"),
      IdAdi(id: 10, adi: "D110"),
    ];

    dataList.assignAll(mockData);
    isLoading(1);
  }

}