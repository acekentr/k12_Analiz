import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k12_analiz/constants/app_theme.dart';
import 'package:k12_analiz/general_setting.dart';

class OgretmenlerListForm extends StatefulWidget {
  final List<dynamic> ogretmenList;
  final int idDers;
  const OgretmenlerListForm({super.key, required this.ogretmenList, required this.idDers});

  @override
  State<OgretmenlerListForm> createState() => _OgretmenlerListFormState();
}

class _OgretmenlerListFormState extends State<OgretmenlerListForm> {

  List<dynamic> ogretmenList = [];

  @override
  void initState() {
    super.initState();
    
    setState(() {
      ogretmenList = widget.ogretmenList.where((e) => e.idDers == widget.idDers).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 430,
      height: 550,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Öğretmenler",
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
              itemCount: ogretmenList.length,
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
                      "${ogretmenList[i].adi}",
                      textAlign: TextAlign.start,
                      style: GeneralSettings.pdtStyle().copyWith(
                        color: AppTheme.blackColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }


 

}