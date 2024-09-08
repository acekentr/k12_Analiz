import 'package:get/get.dart';
import 'package:k12_analiz/modules/analiz/models/id_adi_model.dart';
import 'package:k12_analiz/modules/analiz/models/zaman_model.dart';

class ZamanListController extends GetxController{
  var isLoading = 0.obs;
  var dataList = <ZamanModel>[].obs;
  int statusCode = 0;

  Future getData() async{
    isLoading(0);
    await Future.delayed(const Duration(seconds: 1));

    List<ZamanModel> mockData = [
      ZamanModel(id: 1, adi: "9 Eylül - Pazartesi", periyot: [IdAdi(id: 1, adi: "1"), IdAdi(id: 2, adi: "2"), IdAdi(id: 3, adi: "3"), IdAdi(id: 4, adi: "4"), IdAdi(id: 5, adi: "5")]),
      ZamanModel(id: 2, adi: "10 Eylül - Salı", periyot: [IdAdi(id: 1, adi: "1"), IdAdi(id: 2, adi: "2"), IdAdi(id: 3, adi: "3"), IdAdi(id: 4, adi: "4")]),
      ZamanModel(id: 3, adi: "11 Eylül - Çarşamba", periyot: [IdAdi(id: 1, adi: "1"), IdAdi(id: 2, adi: "2"), IdAdi(id: 3, adi: "3")]),
      ZamanModel(id: 4, adi: "12 Eylül - Perşembe", periyot: [IdAdi(id: 1, adi: "1"), IdAdi(id: 2, adi: "2")]),
      ZamanModel(id: 5, adi: "13 Eylül - Cuma", periyot: [IdAdi(id: 1, adi: "1")]),
    ];

    dataList.assignAll(mockData);
    isLoading(1);
  }

}