import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k12_analiz/constants/app_theme.dart';
import 'package:k12_analiz/constants/custom_form_decoration.dart';
import 'package:k12_analiz/constants/widget_style.dart';
import 'package:k12_analiz/general_setting.dart';
import 'package:k12_analiz/modules/analiz/models/sinav_model.dart';
import 'package:k12_analiz/widgets/dropdown/dropdown_style.dart';
import 'package:k12_analiz/widgets/input_fields/form_input_widget.dart';

class OgretmenlerListForm extends StatefulWidget {
  final List<Ogretmen> ogretmenList;
  const OgretmenlerListForm({super.key, required this.ogretmenList});

  @override
  State<OgretmenlerListForm> createState() => _OgretmenlerListFormState();
}

class _OgretmenlerListFormState extends State<OgretmenlerListForm> {

  final TextEditingController textEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool? gozetmen;

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
        buildOgretmenEkle(),
        buildOgretmenListe(),
      ],
    );
  }

  Widget buildOgretmenEkle() {
    return Wrap(
      children: [
        Form(
          key: formKey,
          child: FormInputWidget(
            width: 200,
            height: 60,
            inputWidget: TextFormField(
              controller: textEditingController,
              enabled: true,
              keyboardType: TextInputType.name,
              style: GeneralSettings.textFormFieldStyle(),
              decoration: CustomFormDecoration.buildCustomFormDecoration(label: "Öğretmen Adı"),
              validator: (value) {
                if (value == null || value == "") {
                  return "Zorunlu alan.";
                }
                return null;
              },
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 175,
          height: 60,
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField2(
              decoration: WidgetStyle.buildTextInputDecoration().copyWith(
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              hint: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  'Gözetmen seçiniz',
                  style: GeneralSettings.textFormFieldStyle(),
                ),
              ),
              items: [
                DropdownMenuItem<bool>(
                  value: true,
                  child: Text(
                    "Evet",
                    overflow: TextOverflow.ellipsis,
                    style: GeneralSettings.pdtStyle(),
                  ),
                ),
                DropdownMenuItem<bool>(
                  value: false,
                  child: Text(
                    "Hayır",
                    overflow: TextOverflow.ellipsis,
                    style: GeneralSettings.pdtStyle(),
                  ),
                ),
              ],
              value: gozetmen,
              onChanged: (value){
                setState(() {
                  gozetmen = value!;
                });
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value != null) {
                  return null;
                }
                return "Seçiniz";
              },
              buttonStyleData: DropdownStyle.buttonStyleData(),
              iconStyleData: DropdownStyle.iconStyleData(),
              dropdownStyleData: DropdownStyle.dropdownStyleData(),
              menuItemStyleData: DropdownStyle.menuItemStyleData(),
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  textEditingController.clear();
                }
              },
            ),
          ),
        ),
        IconButton(
         onPressed: () {
          if (!formKey.currentState!.validate() || gozetmen == null) {
            return;
          }

          formKey.currentState!.save();

          widget.ogretmenList.add(Ogretmen(
            id: 2,
            adi: textEditingController.text,
            gozetmen: gozetmen
          ));

          textEditingController.clear();

          setState(() {});
         },
         icon: const Icon(Icons.add, color: Colors.green)
        )
      ],
    );
  }

  Widget buildOgretmenListe() {
    return SizedBox(
        height: Get.height * 0.35,
        child: ListView.separated(
          itemCount: widget.ogretmenList.length,
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
                  "${widget.ogretmenList[i].adi}",
                  textAlign: TextAlign.start,
                  style: GeneralSettings.pdtStyle().copyWith(
                    color: AppTheme.blackColor,
                  ),
                ),
                trailing: GestureDetector(
                    onTap: () {
                      widget.ogretmenList.removeAt(i);
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