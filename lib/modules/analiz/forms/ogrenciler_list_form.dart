import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k12_analiz/constants/app_theme.dart';
import 'package:k12_analiz/general_setting.dart';

class OgrencilerListForm extends StatefulWidget {
  final List<dynamic> ogrenciList;
  final int idDers;

  const OgrencilerListForm({super.key, required this.ogrenciList, required this.idDers});

  @override
  State<OgrencilerListForm> createState() => _OgrencilerListFormState();
}

class _OgrencilerListFormState extends State<OgrencilerListForm> {

  List<dynamic> ogrenciList = [];

  @override
  void initState() {
    super.initState();
    
    setState(() {
      ogrenciList = widget.ogrenciList.where((e) => e.idDers == widget.idDers).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      height: 550,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Öğrenciler",
                style: GeneralSettings.formBaslikSize20Style(),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: (){ Get.back(); }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text('Kapat', style: TextStyle(color: Colors.white))
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 10),
          SizedBox(
            height: Get.height * 0.35,
            child: ListView.separated(
              itemCount: ogrenciList.length,
              separatorBuilder: (context, i) => const SizedBox(height: 3),
              itemBuilder: (context, i){
                return Card(
                  margin: const EdgeInsets.only(bottom: 5),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      color: Colors.indigo,
                      width: 1,
                    ),
                  ),
                  shadowColor: Colors.indigo,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  child: ListTile(
                    title: Text(
                      "${ogrenciList[i].adi}",
                      textAlign: TextAlign.start,
                      style: GeneralSettings.pdtStyle().copyWith(
                        color: AppTheme.blackColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
 
}