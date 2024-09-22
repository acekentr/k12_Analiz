import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:k12_analiz/constants/custom_form_decoration.dart';
import 'package:k12_analiz/constants/widget_style.dart';
import 'package:k12_analiz/general_setting.dart';
import 'package:k12_analiz/modules/analiz/forms/ogrenciler_list_form.dart';
import 'package:k12_analiz/modules/analiz/forms/ogretmenler_list_form.dart';
import 'package:k12_analiz/modules/analiz/models/hucre_model.dart';
import 'package:k12_analiz/modules/analiz/models/id_adi_model.dart';
import 'package:k12_analiz/modules/analiz/models/zaman_model.dart';
import 'package:k12_analiz/widgets/dialog/dialog_widget.dart';
import 'package:pull_down_button/pull_down_button.dart';

class AnalizView extends StatefulWidget {
  final Future<RxList<dynamic>> Function() getOgrenciListFunc;
  final Future<RxList<dynamic>> Function() getOgrenciBlokZamanListFunc;
  final Future<RxList<dynamic>> Function() getOgretmenListFunc;
  final dynamic sinavBilgi;
  final RxList<dynamic> derslikList;
  final RxList<dynamic> derslikBlokZamanList;
  final RxList<dynamic> sorumluDerslerList;

  const AnalizView({
    super.key,
    required this.getOgrenciListFunc,
    required this.getOgrenciBlokZamanListFunc,
    required this.getOgretmenListFunc,
    required this.sinavBilgi,
    required this.derslikList,
    required this.derslikBlokZamanList,
    required this.sorumluDerslerList,
  });

  @override
  State<AnalizView> createState() => _AnalizViewState();
}

class _AnalizViewState extends State<AnalizView> {

  final TextEditingController textEditingController = TextEditingController();
  RxList<dynamic> filteredDerslikList = <dynamic>[].obs;
  RxList<ZamanModel> zamanList = <ZamanModel>[].obs;
  RxBool isLoaded = false.obs;

  int idSinav = 0; 

  @override
  void initState() {
    super.initState();

    for(var derslik in widget.derslikList){
      filteredDerslikList.add(derslik);
    }

    for (int i = 0; i < widget.sinavBilgi.gun!; i++) {
      DateTime tarih = widget.sinavBilgi.tarih!.add(Duration(days: i));
      List<IdAdi> periyotList = [];

      for (int j = 0; j < widget.sinavBilgi.periyot!; j++) {
        periyotList.add(IdAdi(id: j+1, adi: "${j+1}"));
      }

      ZamanModel zamanModel = ZamanModel(
        id: i+1,
        tarih: tarih,
        periyot: periyotList,
      );

      zamanList.add(zamanModel);
    }

    isLoaded(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        child: buildBody(),
      ),
    );
  }

  buildBody(){
    return Obx((){
      if(isLoaded.value == false){
        return Container();
      }

      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: (){
                  //TODO:: yerlestir endpointi'ne istek atılacak sıfırlamak için.
                  for(var sinav in widget.sorumluDerslerList){
                    sinav.idDerslik = 0;
                    sinav.tarih = DateTime(1900, 1, 1);
                    sinav.periyot = "";
                  }
                  setState(() {});
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text('Tümünü Temizle', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 10),
              SizedBox(
                height: 30,
                width: Get.width * 0.15,
                child: TextField(
                  controller: textEditingController,
                  cursorHeight: 20,
                  onChanged: (value){
                    filteredDerslikList.clear();

                    if(value.isEmpty){
                      filteredDerslikList.addAll(widget.derslikList);
                    }else{
                      Set<int> derslikIds = {};
                      for (var sinav in widget.sorumluDerslerList) {
                        if (sinav.adi!.toLowerCase().contains(value.toLowerCase())) {
                          derslikIds.add(sinav.idDerslik!);
                        }
                      }
                      for (var derslik in widget.derslikList) {
                        if (derslikIds.contains(derslik.id)) {
                          filteredDerslikList.add(derslik);
                        }
                      }
                    }
                  },
                  style: GeneralSettings.searchBoxStyle(),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: WidgetStyle.buildSearcInputDecoration().copyWith(hintText: 'Ara'),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          buildSinavlar(),

          const SizedBox(height: 10),

          buildZamanDerslikTablo()
        ],
      );
    });
  }

  Widget buildSinavlar() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.indigo,
          width: 1
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          // Bu şekilde where kullanmamızın nedeni tabloya yerleştirilmemiş olan dersi üst listede gösteriyoruz.
          // Ders zaten yerleştirildiyse o alanda olmayacak. Ders yerleşimden kalkarsa tekrar geliyor.
          for (var ders in widget.sorumluDerslerList.where((e) => e.idDerslik == 0 && e.tarih!.year == 1900 && e.periyot == ""))
            Draggable(
              data: ders,
              feedback: Material(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(int.parse('0xFF${ders.renk}')),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      ders.adi ?? "",
                      style: const TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              childWhenDragging: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Text(
                  ders.adi ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: GeneralSettings.textFormFieldStyle(),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildSinavPullDownButon(idDers: ders.id!),
                    Text(
                      ders.adi ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: GeneralSettings.textFormFieldStyle(),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  buildSinavPullDownButon({required int idDers}){
    return PullDownButton(
      routeTheme: CustomFormDecoration.pullDownMenuRouteTheme(),
      itemBuilder: (context) => [
        PullDownMenuItem(
          title: 'Öğrenciler',
          icon: CupertinoIcons.person_2,
          onTap: () async {
            List<dynamic> ogrenciList = await widget.getOgrenciListFunc();

            await showDialog(
              barrierDismissible: false,
              context: Get.context!,
              builder: (context) {
                return AlertDialog(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  content: OgrencilerListForm(
                    ogrenciList: ogrenciList,
                    idDers: idDers,
                  ),
                );
              },
            );
          },
        ),
        PullDownMenuItem(
          title: 'Öğretmenler',
          icon: CupertinoIcons.group,
          onTap: () async {
            List<dynamic> ogretmenList = await widget.getOgretmenListFunc();

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
                    idDers: idDers,
                  ),
                );
              },
            );
          },
        ),
      ],
      animationBuilder: null,
      position: PullDownMenuPosition.automatic,
      buttonBuilder: (context, showMenu) => Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.grey[600],
          ),
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity, 
            vertical: VisualDensity.minimumDensity
          ),
          tooltip: 'Menü',
          onPressed: showMenu,
        ),
      ),
    );
  }

  buildZamanDerslikTablo() {
    return Expanded(
      flex: 9,
      child: Column(
        children: [
          const SizedBox(height: 5),

          // Zaman Listesi
          Container(
            color: Colors.white,
            child: Table(
              border: TableBorder.all(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(6), topLeft: Radius.circular(6)),
              ),
              columnWidths: const {
                0: FixedColumnWidth(150),
              },
              children: [
                TableRow(
                  children: [
                    TableCell(child: Container()),
                    for (var zaman in zamanList)
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            DateFormat('dd MMMM - EEEE', 'tr').format(zaman.tarih!),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Container()),
                    for (var zaman in zamanList)
                      TableCell(
                        child: Row(
                          children: [
                            for (var periyot in zaman.periyot ?? [])
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1),
                                    ),
                                  ),
                                  child: Text(
                                    periyot.adi ?? "",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          
          // Derslikler listesi ve derslikler ile zaman arası oluşan boş hücreler
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Table(
                  border: TableBorder.all(
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(6), bottomLeft: Radius.circular(6)),
                  ),
                  columnWidths: const {
                    0: FixedColumnWidth(150),
                  },
                  children: [
                    for (var derslik in filteredDerslikList)
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Text(
                              derslik.adi ?? "",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          for (var zaman in zamanList)
                            Builder(
                              builder: (context) {
                                return Row(
                                  children: [
                                    for (var periyot in zaman.periyot ?? [])
                                      Expanded(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              right: BorderSide(color: Colors.black, width: 1),
                                            ),
                                          ),
                                          child: DragTarget(
                                            onAcceptWithDetails: (details) async{
                                              List<dynamic> ogrenciList = await widget.getOgrenciListFunc();
                                              List<dynamic> ogrenciBlokZamanList = await widget.getOgrenciBlokZamanListFunc();

                                              setState(() {
                                                dynamic draggedSinav = details.data;
                
                                                var model = widget.sorumluDerslerList.firstWhere((e) => e.id == draggedSinav.id);
                
                                                var yeniHucre = HucreModel(
                                                  tarih: zaman.tarih,
                                                  idDerslik: derslik.id,
                                                  idPeriyot: periyot.id,
                                                );

                                                int checkPeriyot = 0;

                                                for(var i = 0; i < model.uzunluk; i++){
                                                  checkPeriyot = yeniHucre.idPeriyot! + i;
                                                }

                                                bool ogrenciVar = false;
                                                bool ogretmenVar = false;

                                                List<String> cakisanOgrenciList = [];
                                                List<String> cakisanOgretmenList = [];  

                                                for(var ogrenciBlok in ogrenciBlokZamanList){
                                                  for(var ogrenci in ogrenciList.where((e) => e.id == ogrenciBlok.idOgrenci && e.idDers == model.id)){
                                                    if(
                                                      ogrenciBlok.tarih == yeniHucre.tarih &&
                                                      ogrenciBlok.periyot == yeniHucre.idPeriyot
                                                    ){
                                                      ogrenciVar = true;
                                                      cakisanOgrenciList.add(ogrenci.adi);
                                                    }
                                                    else{
                                                      // Öğrenci blok güncelleme
                                                      var ogrenciBlokModel = ogrenciBlokZamanList.firstWhere((e) => e.idOgrenci == ogrenci.id);

                                                      if(ogrenciBlokModel != null){
                                                        ogrenciBlokModel.tarih = yeniHucre.tarih;
                                                        ogrenciBlokModel.periyot = yeniHucre.idPeriyot;
                                                      }
                                                      else{
                                                        var ogrenciBlokAddModel = {
                                                          'id_ogrenci': ogrenci.id,
                                                          'tarih': yeniHucre.tarih,
                                                          'periyot': yeniHucre.idPeriyot,
                                                        };

                                                        ogrenciBlokZamanList.add(ogrenciBlokAddModel);
                                                      }
                                                    }
                                                  }
                                                }

                                                for(var aa in ogrenciBlokZamanList){
                                                  print(aa.tarih);
                                                }

                                                if (ogrenciVar) {
                                                  DialogWidget.buildShowAlertDialog(
                                                    title: "Ekleme Başarısız",
                                                    text: "Bu periyot ve zaman diliminde ${cakisanOgrenciList.join(', ')} adlı öğrenci zaten başka bir derslikte eklenmiş."
                                                  );
                                                  return;
                                                }


                                                

                                                bool kilitli = widget.derslikBlokZamanList.any((kilitliHucre) =>
                                                  kilitliHucre.tarih == yeniHucre.tarih &&
                                                  kilitliHucre.idDerslik == yeniHucre.idDerslik &&
                                                  kilitliHucre.periyot == yeniHucre.idPeriyot
                                                );

                                                if (kilitli) {
                                                  DialogWidget.buildShowAlertDialog(
                                                    title: "Ekleme Başarısız",
                                                    text: "Bu hücre kilitli olduğu için ekleme yapılamaz."
                                                  );
                                                  return;
                                                }

                                                // var selectedDerslik = widget.derslikList.firstWhere((d) => d.id == derslik.id);

                                                // if (model.ogrenci != null && model.ogrenci!.length > selectedDerslik.kapasite!) {
                                                //   DialogWidget.buildShowAlertDialog(
                                                //     title: "Ekleme Başarısız",
                                                //     text: "${selectedDerslik.adi} adlı derslikte ${selectedDerslik.kapasite!} öğrenci kapasitesi bulunmaktadır.\nEklemeye çalıştığınız sınavda ${model.ogrenci!.length} öğrenci bulunduğu için ekleme yapılamaz."
                                                //   );
                                                //   return;
                                                // }
                
                                        
                                                

                                                model.tarih = yeniHucre.tarih;
                                                model.idDerslik = yeniHucre.idDerslik;
                                                model.periyot = yeniHucre.idPeriyot.toString();

                                                // TODO: yerlestir post metodu eklenecek.

                                                setState(() { });

                                                print(json.encode(model));
                                              });
                                            },
                                            onWillAcceptWithDetails: (data) {
                                              return true;
                                            },
                                            builder: (context, candidateData, rejectedData){
                                              return Container(
                                                color: Colors.transparent,
                                                height: 40,
                                                child: candidateData.isNotEmpty
                                                  ? const Center(
                                                      child: Text(
                                                        "Ekle",
                                                        style: TextStyle(color: Colors.grey),
                                                      ),
                                                    )
                                                  : buildSinavHucreAlan(
                                                      HucreModel(
                                                        tarih: zaman.tarih,
                                                        idDerslik: derslik.id,
                                                        idPeriyot: periyot.id,
                                                      ),
                                                    ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSinavHucreAlan(HucreModel model) {
    final List<dynamic> kilitliCells = widget.derslikBlokZamanList;

    final sorumluDersList = widget.sorumluDerslerList.where(
      (e) {
        final periyotList = e.periyot!.split(',');

        final idPeriyotString = model.idPeriyot.toString();

        return e.idDerslik == model.idDerslik &&
          e.tarih == model.tarih &&
          periyotList.contains(idPeriyotString);
      }
    ).toList();

    bool kilitli = kilitliCells.any((kilitliCell) =>
      kilitliCell.idDerslik == model.idDerslik &&
      kilitliCell.tarih == model.tarih &&
      kilitliCell.periyot == model.idPeriyot
    );

    if (sorumluDersList.isEmpty && !kilitli) {
      return Container();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Eğer hücre kilitli ise burada gösteriyoruz.
        if (kilitli)
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: Colors.red,
              child: const  Text(
                "Kilitli",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

        // Kilitli değilse ve hücrede atanmış sınavlar varsa burada gösteriyoruz.
        ...sorumluDersList.map((sinav) {
          return Expanded(
            child: Draggable(
              data: sinav,
              feedback: Material(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Color(int.parse('0xFF${sinav.renk}')),
                  child: Text(sinav.adi ?? "", style: const TextStyle(color: Colors.white)),
                ),
              ),
              childWhenDragging: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Text(
                  sinav.adi ?? "",
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                color: kilitli ? Colors.red : Color(int.parse('0xFF${sinav.renk}')),
                child: Text(
                  sinav.adi ?? "",
                  style: TextStyle(color: invert(Color(int.parse('0xFF${sinav.renk}')))),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }


  Color invert(Color color) {
    final r = 255 - color.red;
    final g = 255 - color.green;
    final b = 255 - color.blue;

    return Color.fromARGB((color.opacity * 255).round(), r, g, b);
  }
}