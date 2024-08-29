import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k12_analiz/constants/app_theme.dart';
import 'package:k12_analiz/constants/custom_form_decoration.dart';
import 'package:k12_analiz/general_setting.dart';
import 'package:k12_analiz/modules/analiz/models/id_adi_model.dart';
import 'package:k12_analiz/widgets/input_fields/form_input_widget.dart';

class OgrencilerListForm extends StatefulWidget {
  final List<IdAdi> ogrenciList;
  const OgrencilerListForm({super.key, required this.ogrenciList});

  @override
  State<OgrencilerListForm> createState() => _OgrencilerListFormState();
}

class _OgrencilerListFormState extends State<OgrencilerListForm> {

  final TextEditingController textEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                onPressed: (){ kayitGuncelle(); }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(6),
                   ),
                ),
                child: const Text('Güncelle', style: TextStyle(color: Colors.white))
              ),
              const SizedBox(width: 5),
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
          buildBody(),
        ],
      ),
    );
  }

  buildBody(){
    return Column(
      children: [
        buildOgrenciEkle(),
        buildOgrenciListe(),
      ],
    );
  }

  Widget buildOgrenciEkle() {
    return Wrap(
        children: [
          Form(
            key: formKey,
            child: FormInputWidget(
              width: 300,
              height: 60,
              inputWidget: TextFormField(
                controller: textEditingController,
                enabled: true,
                keyboardType: TextInputType.name,
                style: GeneralSettings.textFormFieldStyle(),
                decoration: CustomFormDecoration.buildCustomFormDecoration(label: "Öğrenci Adı"),
                validator: (value) {
                  if (value == null || value == "") {
                    return "Zorunlu alan.";
                  }
                  return null;
                },
              ),
            ),
          ),
          IconButton(
           onPressed: () {
            if (!formKey.currentState!.validate()) {
              return;
            }

            formKey.currentState!.save();

            widget.ogrenciList.add(IdAdi(
              id: 2,
              adi: textEditingController.text
            ));

            textEditingController.clear();

            setState(() {});
           },
           icon: const Icon(Icons.add, color: Colors.green)
          )
        ],
      );
  }

  Widget buildOgrenciListe() {
    return SizedBox(
        height: Get.height * 0.35,
        child: ListView.separated(
          itemCount: widget.ogrenciList.length,
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
                  "${widget.ogrenciList[i].adi}",
                  textAlign: TextAlign.start,
                  style: GeneralSettings.pdtStyle().copyWith(
                    color: AppTheme.blackColor,
                  ),
                ),
                trailing: GestureDetector(
                    onTap: () {
                      widget.ogrenciList.removeAt(i);
                      setState(() {});
                    },
                    child: const Icon(Icons.close, color: Colors.red)),
              ),
            );
          },
        ),
      );
  }

  kayitGuncelle(){
    Get.back();
  }

}