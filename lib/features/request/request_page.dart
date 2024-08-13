import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furtable/features/request/request_controller.dart';
import 'package:furtable/utils/widget/body_widget.dart';
import 'package:furtable/utils/widget/dropdown_widget.dart';
import 'package:furtable/utils/widget/floating_action_button_widget.dart';
import 'package:furtable/utils/widget/label_form_widget.dart';
import 'package:furtable/utils/widget/text_field_widget.dart';
import 'package:get/get.dart';

import '../../routes/page_names.dart';
import '../../theme.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestController>(
      builder: (controller) {
        return Scaffold(
          body: BodyWidget(
            title: 'Permintaan',
            children: [
              const Center(
                child: Text(
                  'Isi Data Berikut',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkColor
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              const LabelFormWidget(label: 'Contoh Model'),
              SizedBox(
                width: Get.width,
                child: DottedBorder(
                  padding: const EdgeInsets.all(20),
                  dashPattern: const [6],
                  radius: const Radius.circular(10),
                  borderType: BorderType.RRect,
                  color: AppColors.primaryColor,
                  child: controller.image == null
                      ? Column(
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          'assets/images/icon_upload.svg',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      const SizedBox(height: 14,),
                      const Text(
                        'Silahkan unggah gambar contoh model',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightGreyColor
                        ),
                      ),
                      const SizedBox(height: 24,),
                      SizedBox(
                        width: 147,
                        height: 46,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              )
                          ),
                          onPressed: () async {
                            await controller.pickImage();
                          },
                          child: const Text(
                            'Pilih Gambar',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.lightColor
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                      : Center(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                          width: 250,
                          height: 250,
                          controller.image!,
                          fit: BoxFit.cover, )
                        ),
                      )
                ),
              ),
              const SizedBox(height: 16,),
              const LabelFormWidget(label: 'Bahan Kain'),
              DropdownWidget(
                  hintText: 'Bahan Kain',
                  selectedItem: controller.bahanKain,
                  itemList: controller.bahanKainList,
                  onChanged: (String? value) {
                    controller.bahanKain = value;
                    controller.update();
                  }
              ),
              const SizedBox(height: 16,),
              const LabelFormWidget(label: 'Bahan Furniture'),
              DropdownWidget(
                  hintText: 'Bahan Furniture',
                  selectedItem: controller.bahanFurniture,
                  itemList: controller.bahanFurnitureList,
                  onChanged: (String? value) {
                    controller.bahanFurniture = value;
                    controller.update();
                  }
              ),
              const SizedBox(height: 16,),
              const LabelFormWidget(label: 'Panjang'),
              TextFieldWidget(
                  hintText: 'Panjang',
                  onChanged: (String? value) {
                    controller.panjang = value;
                    controller.update();
                  }
              ),
              const SizedBox(height: 16,),
              const LabelFormWidget(label: 'Lebar'),
              TextFieldWidget(
                  hintText: 'Lebar',
                  onChanged: (String? value) {
                    controller.lebar = value;
                    controller.update;
                  }
              ),
              const SizedBox(height: 16,),
              const LabelFormWidget(label: 'Lebar Sandaran Tangan'),
              TextFieldWidget(
                  hintText: 'Lebar Sandaran Tangan',
                  onChanged: (String? value) {
                    controller.lebarSandaranTangan = value;
                    controller.update();
                  }
              ),
              const SizedBox(height: 16,),
              const LabelFormWidget(label: 'Lebar Dudukan'),
              TextFieldWidget(
                  hintText: 'Lebar Dudukan',
                  onChanged: (String? value) {
                    controller.lebarDudukan = value;
                    controller.update();
                  }
              ),
              const SizedBox(height: 16,),
              const LabelFormWidget(label: 'Tinggi Sofa'),
              TextFieldWidget(
                  hintText: 'Tinggi Sofa',
                  onChanged: (String? value) {
                    controller.tinggiSofa = value;
                    controller.update();
                  }
              ),
              const SizedBox(height: 16,),
              const LabelFormWidget(label: 'Tinggi Sandaran Tangan'),
              TextFieldWidget(
                  hintText: 'Tinggi Sandaran Tangan',
                  onChanged: (String? value) {
                    controller.tinggiSandaranTangan = value;
                    controller.update();
                  }
              ),
              const SizedBox(height: 16,),
              const LabelFormWidget(label: 'Tinggi Dudukan'),
              TextFieldWidget(
                  hintText: 'Tinggi Dudukan',
                  onChanged: (String? value) {
                    controller.tinggiDudukan = value;
                    controller.update();
                  }
              ),
              const SizedBox(height: 70,)
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButtonWidget(
            title: 'Lanjutkan',
            onPressed: () {
              Get.toNamed(PageNames.DETAIL_REQUEST, arguments: {
                'bahan_kain' : controller.bahanKain?? '-',
                'bahan_furniture' : controller.bahanFurniture?? '-',
                'panjang' : controller.panjang?? '-',
                'lebar' : controller.lebar?? '-',
                'lebar_sandaran_tangan' : controller.lebarSandaranTangan?? '-',
                'lebar_dudukan' : controller.lebarDudukan?? '-',
                'tinggi_sofa' : controller.tinggiSofa?? '-',
                'tinggi_sandaran_tangan' : controller.tinggiSandaranTangan?? '-',
                'tinggi_dudukan' : controller.tinggiDudukan?? '-',
              });
            },
          )
        );
      },
    );
  }
}
