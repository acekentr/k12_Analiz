import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k12_analiz/modules/analiz/forms/ogrenciler_list_form.dart';
import 'package:k12_analiz/modules/analiz/forms/ogretmenler_list_form.dart';
import 'package:k12_analiz/modules/analiz/models/id_adi_model.dart';
import 'package:k12_analiz/modules/analiz/models/sinav_model.dart';

class FormRouterService{

  static Future ogrencilerListForm(List<IdAdi> ogrenciList) async{
    await showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          content: OgrencilerListForm(
            ogrenciList: ogrenciList,
          ),
        );
      },
    );
  }

  static Future ogretmenlerListForm(List<Ogretmen> ogretmenList) async{
    await showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          content: OgretmenlerListForm(
            ogretmenList: ogretmenList,
          ),
        );
      },
    );    
  }
 

}