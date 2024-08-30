import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k12_analiz/constants/custom_form_decoration.dart';
import 'package:k12_analiz/constants/widget_style.dart';
import 'package:k12_analiz/general_setting.dart';
import 'package:k12_analiz/modules/analiz/controllers/derslik_list_controller.dart';
import 'package:k12_analiz/modules/analiz/controllers/kilitli_hucre_list_controller.dart';
import 'package:k12_analiz/modules/analiz/controllers/sinav_list_controller.dart';
import 'package:k12_analiz/modules/analiz/controllers/zaman_list_controller.dart';
import 'package:k12_analiz/modules/analiz/models/derslik_model.dart';
import 'package:k12_analiz/modules/analiz/models/id_adi_model.dart';
import 'package:k12_analiz/modules/analiz/models/kilitli_hucre_model.dart';
import 'package:k12_analiz/modules/analiz/models/sinav_model.dart';
import 'package:k12_analiz/services/form_routers.dart';
import 'package:k12_analiz/widgets/dialog/dialog_widget.dart';
import 'package:pull_down_button/pull_down_button.dart';

class AnalizView extends StatefulWidget {
  const AnalizView({super.key});

  @override
  State<AnalizView> createState() => _AnalizViewState();
}

final SinavListController sinavListController = Get.put(SinavListController());
final ZamanListController zamanListController = Get.put(ZamanListController());
final DerslikListController derslikListController = Get.put(DerslikListController());
final KilitliHucreListController kilitliHucreListController = Get.put(KilitliHucreListController());

class _AnalizViewState extends State<AnalizView> {

  final TextEditingController textEditingController = TextEditingController();
  RxList<DerslikModel> filteredDerslikList = <DerslikModel>[].obs;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async{
    Future.wait([
      sinavListController.getData(),
      zamanListController.getData(),
      derslikListController.getData(),
      kilitliHucreListController.getData()
    ]).then((value){
      for(var derslik in derslikListController.dataList){
        filteredDerslikList.add(derslik);
      }
    });
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
      if(sinavListController.isLoading.value == 0 || zamanListController.isLoading.value == 0 || derslikListController.isLoading.value == 0){
        return const SizedBox();
      }

      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: (){
                  for(var sinav in sinavListController.dataList){
                    sinav.hucre?.clear();
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
                      filteredDerslikList.addAll(derslikListController.dataList);
                    }else{
                      Set<int> derslikIds = {};
                      for (var sinav in sinavListController.dataList) {
                        if (sinav.adi!.toLowerCase().contains(value.toLowerCase())) {
                          for (var hucre in sinav.hucre!) {
                            derslikIds.add(hucre.derslikId!);
                          }
                        }
                      }
                      for (var derslik in derslikListController.dataList) {
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
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSinavlar(),
                const SizedBox(width: 10),
                buildZamanDerslikTablo()
              ],
            ),
          ),
        ],
      );
    });
  }

  buildSinavlar(){
    return Expanded(
      flex: 1,
      child: ListView.builder(
        itemCount: sinavListController.dataList.length,
        itemBuilder: (context, i){
          final sinav = sinavListController.dataList[i];
          return Draggable<SinavModel>(
            data: sinav,
            feedback: Material(
              child: Container(
                padding: const EdgeInsets.all(8),
                width: 150,
                color: Color(int.parse('0xFF${sinav.renk}')),
                child: Text(sinav.adi ?? "", style: const TextStyle(color: Colors.white)),
              ),
            ),
            childWhenDragging: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Text(
                sinav.adi ?? "",
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1,
                ),
              ),
              child: ListTile(
                tileColor: Colors.transparent,
                title: Row(
                  children: [
                    buildSinavPullDownButon(ogrenciList: sinav.ogrenci ?? [], ogretmenList: sinav.ogretmen ?? []),
                    Text(
                      sinav.adi ?? "", 
                      overflow: TextOverflow.ellipsis,
                      style: GeneralSettings.textFormFieldStyle()
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  buildSinavPullDownButon({required List<IdAdi> ogrenciList, required List<Ogretmen> ogretmenList}){
    return PullDownButton(
      routeTheme: CustomFormDecoration.pullDownMenuRouteTheme(),
      itemBuilder: (context) => [
        PullDownMenuItem(
          title: 'Öğrenciler',
          icon: CupertinoIcons.person_2,
          onTap: () async {
            await FormRouterService.ogrencilerListForm(ogrenciList);
          },
        ),
        PullDownMenuItem(
          title: 'Öğretmenler',
          icon: CupertinoIcons.group,
          onTap: () async {
            await FormRouterService.ogretmenlerListForm(ogretmenList);
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
                    for (var zaman in zamanListController.dataList)
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            zaman.adi ?? "",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Container()),
                    for (var zaman in zamanListController.dataList)
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
                          for (var zaman in zamanListController.dataList)
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
                                          child: DragTarget<SinavModel>(
                                            onAcceptWithDetails: (details) {
                                              setState(() {
                                                SinavModel draggedSinav = details.data;
                
                                                var model = sinavListController.dataList.firstWhere((e) => e.id == draggedSinav.id);
                
                                                var yeniHucre = Hucre(
                                                  derslikId: derslik.id,
                                                  zamanId: zaman.id,
                                                  periyotId: periyot.id,
                                                );

                                                bool ogrenciVar = false;
                                                bool ogretmenVar = false;

                                                List<String> cakisanOgrenciList = [];
                                                List<String> cakisanOgretmenList = [];
                
                                                for (var otherSinav in sinavListController.dataList) {
                                                  ogrenciVar = otherSinav.hucre?.any((hucre) =>
                                                    hucre.zamanId == yeniHucre.zamanId &&
                                                    hucre.periyotId == yeniHucre.periyotId &&
                                                    otherSinav.ogrenci?.any((ogrenci) =>
                                                      model.ogrenci?.any((modelOgrenci) => modelOgrenci.id == ogrenci.id) == true
                                                    ) == true
                                                  ) == true;

                                                  if (ogrenciVar) {
                                                    for (var ogrenci in otherSinav.ogrenci ?? []) {
                                                      if (model.ogrenci?.any((modelOgrenci) => modelOgrenci.id == ogrenci.id) == true) {
                                                        cakisanOgrenciList.add(ogrenci.adi);
                                                      }
                                                    }
                                                  }

                                                  ogretmenVar = otherSinav.hucre?.any((hucre) =>
                                                    hucre.zamanId == yeniHucre.zamanId &&
                                                    hucre.periyotId == yeniHucre.periyotId &&
                                                    otherSinav.ogretmen?.any((ogretmen) =>
                                                      model.ogretmen?.any((modelOgretmen) => modelOgretmen.id == ogretmen.id) == true &&
                                                      ogretmen.gozetmen == false
                                                    ) == true
                                                  ) == true;

                                                  if (ogretmenVar) {
                                                    for (var ogretmen in otherSinav.ogretmen ?? []) {
                                                      if (model.ogretmen?.any((modelOgretmen) => modelOgretmen.id == ogretmen.id) == true) {
                                                        cakisanOgretmenList.add(ogretmen.adi);
                                                      }
                                                    }
                                                  }

                                                  if (ogrenciVar || ogretmenVar) break;
                                                }

                                                bool kilitli = kilitliHucreListController.dataList.any((kilitliHucre) =>
                                                  kilitliHucre.derslikId == yeniHucre.derslikId &&
                                                  kilitliHucre.zamanId == yeniHucre.zamanId &&
                                                  kilitliHucre.periyotId == yeniHucre.periyotId
                                                );

                                                var selectedDerslik = derslikListController.dataList.firstWhere((d) => d.id == derslik.id);
                                                  if (model.ogrenci != null && model.ogrenci!.length > selectedDerslik.kapasite!) {
                                                    DialogWidget.buildShowAlertDialog(
                                                      title: "Ekleme Başarısız",
                                                      text: "${selectedDerslik.adi} adlı derslikte ${selectedDerslik.kapasite!} öğrenci kapasitesi bulunmaktadır.\nEklemeye çalıştığınız sınavda ${model.ogrenci!.length} öğrenci bulunduğu için ekleme yapılamaz."
                                                    );
                                                    return;
                                                  }
                
                                                if (ogrenciVar) {
                                                  DialogWidget.buildShowAlertDialog(
                                                    title: "Ekleme Başarısız",
                                                    text: "Bu periyot ve zaman diliminde ${cakisanOgrenciList.join(', ')} adlı öğrenci zaten başka bir derslikte eklenmiş."
                                                  );
                                                  return;
                                                }
                                                
                                                if (ogretmenVar) {
                                                  DialogWidget.buildShowAlertDialog(
                                                    title: "Ekleme Başarısız",
                                                    text: "Bu periyot ve zaman diliminde ${cakisanOgretmenList.join(', ')} adlı öğretmen zaten başka bir derslikte eklenmiş."
                                                  );
                                                  return;
                                                }

                                                if (kilitli) {
                                                  DialogWidget.buildShowAlertDialog(
                                                    title: "Ekleme Başarısız",
                                                    text: "Bu hücre kilitli olduğu için ekleme yapılamaz."
                                                  );
                                                  return;
                                                }
                
                                                model.hucre?.add(yeniHucre);
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
                                                      Hucre(
                                                        derslikId: derslik.id,
                                                        zamanId: zaman.id,
                                                        periyotId: periyot.id,
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


  Widget buildSinavHucreAlan(Hucre model) {
    final List<KilitliHucreModel> kilitliCells = kilitliHucreListController.dataList;

    final sinavList = sinavListController.dataList.where(
      (e) => e.hucre != null &&
            e.hucre!.any((hucre) =>
              hucre.derslikId == model.derslikId &&
              hucre.zamanId == model.zamanId &&
              hucre.periyotId == model.periyotId
            ),
    ).toList();

    bool kilitli = kilitliCells.any((kilitliCell) =>
      kilitliCell.derslikId == model.derslikId &&
      kilitliCell.zamanId == model.zamanId &&
      kilitliCell.periyotId == model.periyotId
    );

    if (sinavList.isEmpty && !kilitli) {
      return Container();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Draggable<SinavModel>(
            data: sinavList.isNotEmpty ? sinavList.first : null,
            onDragStarted: () {
              setState(() {
                for (var sinav in sinavList) {
                  sinav.hucre?.removeWhere((e) =>
                    e.zamanId == model.zamanId &&
                    e.derslikId == model.derslikId &&
                    e.periyotId == model.periyotId
                  );
                }
              });
            },
            feedback: Material(
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Color(int.parse('0xFF${sinavList.isNotEmpty ? sinavList.first.renk : 'FFFFFF'}')),
                child: Text(
                  sinavList.isNotEmpty ? sinavList.first.adi ?? "" : "",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            childWhenDragging: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Text(
                sinavList.isNotEmpty ? sinavList.first.adi ?? "" : "",
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              color: kilitli ? Colors.red : Color(int.parse('0xFF${sinavList.isNotEmpty ? sinavList.first.renk : 'FFFFFF'}')),
              child: Text(
                kilitli ? "Kilitli"
                : sinavList.isNotEmpty ? sinavList.first.adi ?? "" : "",
                style: TextStyle(color: kilitli ? Colors.white : invert(Color(int.parse('0xFF${sinavList.isNotEmpty ? sinavList.first.renk : 'FFFFFF'}')))),
              ),
            ),
          ),
        ),
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