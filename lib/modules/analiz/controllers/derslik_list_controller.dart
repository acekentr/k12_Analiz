import 'package:get/get.dart';
import 'package:k12_analiz/modules/analiz/models/derslik_model.dart';

class DerslikListController extends GetxController{
  var isLoading = 0.obs;
  var dataList = <DerslikModel>[].obs;
  int statusCode = 0;

  Future getData() async{
    isLoading(0);
    await Future.delayed(const Duration(seconds: 1));

    List<DerslikModel> mockData = [
      DerslikModel(id: 1, adi: "D101", kapasite: 1),
      DerslikModel(id: 2, adi: "D102", kapasite: 1),
      DerslikModel(id: 3, adi: "D103", kapasite: 1),
      DerslikModel(id: 4, adi: "D104", kapasite: 1),
      DerslikModel(id: 5, adi: "D105", kapasite: 1),
      DerslikModel(id: 6, adi: "D106", kapasite: 1),
      DerslikModel(id: 7, adi: "D107", kapasite: 1),
      DerslikModel(id: 8, adi: "D108", kapasite: 1),
      DerslikModel(id: 9, adi: "D109", kapasite: 1),
      DerslikModel(id: 10, adi: "D110", kapasite: 1),
    ];

    dataList.assignAll(mockData);
    isLoading(1);
  }

}