import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k12_analiz/examples/controllers/ogrenci_blok_zaman_list_controller.dart';
import 'package:k12_analiz/examples/controllers/ogrenci_list_controller.dart';
import 'package:k12_analiz/examples/controllers/ogretmen_list_controller.dart';
import 'package:k12_analiz/examples/controllers/derslik_blok_zaman_list_controller.dart';
import 'package:k12_analiz/examples/controllers/derslik_list_controller.dart';
import 'package:k12_analiz/examples/controllers/sinav_bilgi_controller.dart';
import 'package:k12_analiz/examples/controllers/sorumlu_dersler_list_controller.dart';
import 'package:k12_analiz/modules/analiz/views/analiz_view.dart';

class AnalizTestView extends StatefulWidget {
  const AnalizTestView({super.key});

  @override
  State<AnalizTestView> createState() => _AnalizTestViewState();
}

final SinavBilgiController sinavBilgiController = Get.put(SinavBilgiController());
final DerslikListController derslikListController = Get.put(DerslikListController());
final DerslikBlokZamanListController derslikBlokZamanListController = Get.put(DerslikBlokZamanListController());
final SorumluDerslerListController sorumluDerslerListController = Get.put(SorumluDerslerListController());
final OgrenciBlokZamanListController ogrenciBlokZamanListController = Get.put(OgrenciBlokZamanListController());

final OgrenciListController ogrenciListController = Get.put(OgrenciListController());
final OgretmenListController ogretmenListController = Get.put(OgretmenListController());

class _AnalizTestViewState extends State<AnalizTestView> {

  int idSinav = 0; // Bu sınav listesinden gelecek.

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async{
    Future.wait([
      sinavBilgiController.getData(idSinav: idSinav),
      derslikListController.getData(idSinav: idSinav),
      derslikBlokZamanListController.getData(idSinav: idSinav),
      sorumluDerslerListController.getData(idSinav: idSinav),
    ]);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
        if(sorumluDerslerListController.isLoading.value == 0){
          return Container();
        }

        return AnalizView(
          sinavBilgi: sinavBilgiController.data.value,
          derslikList: derslikListController.dataList,
          derslikBlokZamanList: derslikBlokZamanListController.dataList,
          sorumluDerslerList: sorumluDerslerListController.dataList,

          // getOgrenciListFunc > sadece ogrenciler butonuna basıldığında api'den çekilecek. 
          //Bu yüzden direkt çekim yapmayıp burada get yapıp liste gönderdik.
          getOgrenciListFunc: () async{
            await ogrenciListController.getData(idSinav: idSinav);
            return ogrenciListController.dataList;
          },


          // getOgrenciBlokZamanListFunc > sadece kart hücreye sürüklendiğinde api'den çekilecek
          //Bu yüzden direkt çekim yapmayıp burada get yapıp liste gönderdik.
          getOgrenciBlokZamanListFunc: () async{
            await ogrenciBlokZamanListController.getData(idSinav: idSinav);
            return ogrenciBlokZamanListController.dataList;
          },

          // getOgretmenListFunc > sadece ogretmenler butonuna basıldığında api'den çekilecek. 
          //Bu yüzden direkt çekim yapmayıp burada get yapıp liste gönderdik.
          getOgretmenListFunc: () async{
            await ogretmenListController.getData(idSinav: idSinav);
            return ogretmenListController.dataList;
          },





        );
      }),
    );
  }
}