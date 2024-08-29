import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k12_analiz/general_setting.dart';

class DialogWidget{

  static Future buildShowAlertDialog({required String title, required String text}) async{
    await showDialog(
      context: Get.context!, 
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: GeneralSettings.formBaslikSize20Style(),
                  ),
                  ElevatedButton(
                    onPressed: (){ Get.back(); }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(6),
                       ),
                    ),
                    child: const Text('Kapat', style: TextStyle(color: Colors.white))
                  )
                ],
              ),
              const Divider(),
              const SizedBox(height: 10),
              Text(
                text,
                style: GeneralSettings.pdtStyle(),
              ),




            ],
          ),
        );
      }
    );
  }


}