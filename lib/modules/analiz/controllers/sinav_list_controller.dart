import 'package:get/get.dart';
import 'package:k12_analiz/modules/analiz/models/id_adi_model.dart';
import 'package:k12_analiz/modules/analiz/models/sinav_model.dart';

class SinavListController extends GetxController{
  var isLoading = 0.obs;
  var dataList = <SinavModel>[].obs;
  int statusCode = 0;

  Future getData() async{
    isLoading(0);
    await Future.delayed(const Duration(seconds: 1));

    List<SinavModel> mockData = [
      SinavModel(id: 1, adi: "Sınav 1", renk: "3F51B5", hucre: [], ogrenci: [IdAdi(id: 1, adi: "A")], ogretmen: [Ogretmen(id: 1, adi: "A", gozetmen: false)]),
      SinavModel(id: 2, adi: "Sınav 2", renk: "E91E63", hucre: [], ogrenci: [IdAdi(id: 2, adi: "B")], ogretmen: [Ogretmen(id: 2, adi: "B", gozetmen: false)]),
      SinavModel(id: 3, adi: "Sınav 3", renk: "4CAF50", hucre: [], ogrenci: [IdAdi(id: 3, adi: "C")], ogretmen: [Ogretmen(id: 3, adi: "C", gozetmen: false)]),
      SinavModel(id: 4, adi: "Sınav 4", renk: "FFC107", hucre: [], ogrenci: [IdAdi(id: 4, adi: "D")], ogretmen: [Ogretmen(id: 4, adi: "D", gozetmen: false)]),
      SinavModel(id: 5, adi: "Sınav 5", renk: "00BCD4", hucre: [], ogrenci: [IdAdi(id: 5, adi: "E")], ogretmen: [Ogretmen(id: 5, adi: "E", gozetmen: false)]),
      SinavModel(id: 6, adi: "Sınav 6", renk: "FF5722", hucre: [], ogrenci: [IdAdi(id: 6, adi: "F")], ogretmen: [Ogretmen(id: 6, adi: "F", gozetmen: false)]),
      SinavModel(id: 7, adi: "Sınav 7", renk: "673AB7", hucre: [], ogrenci: [IdAdi(id: 7, adi: "G")], ogretmen: [Ogretmen(id: 7, adi: "G", gozetmen: false)]),
      SinavModel(id: 8, adi: "Sınav 8", renk: "3F51B5", hucre: [], ogrenci: [IdAdi(id: 8, adi: "H")], ogretmen: [Ogretmen(id: 8, adi: "H", gozetmen: false)]),
      SinavModel(id: 9, adi: "Sınav 9", renk: "009688", hucre: [], ogrenci: [IdAdi(id: 9, adi: "F")], ogretmen: [Ogretmen(id: 9, adi: "F", gozetmen: false)]),
      SinavModel(id: 10, adi: "Sınav 10", renk: "FF9800", hucre: []),
    ];

    dataList.assignAll(mockData);
    isLoading(1);
  }

}