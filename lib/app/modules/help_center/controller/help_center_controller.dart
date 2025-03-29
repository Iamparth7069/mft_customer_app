import 'package:customer_app/constants/app_string.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../constants/common_widget.dart';
import '../../cart/screens/widgets/select_drop_down_list.dart';

class HelpCenterController extends GetxController{

  OptionItem optionOrderIDSelected = OptionItem(title: AppText.selectOrderId);
  OptionItem optionProductSelected = OptionItem(title: AppText.selectProduct);
  OptionItem optionComplaintSelected = OptionItem(title: AppText.selectComplaint);
  DropListModel dropListOrderListModel = DropListModel([
    OptionItem(id: "1", title: "1",),
    OptionItem(id: "2", title: "2",),
    OptionItem(id: "3", title: "3",),
    OptionItem(id: "4", title: "4",),
    OptionItem(id: "5", title: "5",),
    OptionItem(id: "6", title: "6",),
  ]);
  DropListModel productListModel = DropListModel([
    OptionItem(id: "1", title: "Bouquet of emotion Cake",),
    OptionItem(id: "2", title: "Coffee chocochip cake",),
    OptionItem(id: "3", title: "Pink roses photo bouque",),
    OptionItem(id: "4", title: "Buttery cream cake",),
    OptionItem(id: "5", title: "Sensational mix",),
  ]);
  DropListModel complaintListModel = DropListModel([
    OptionItem(id: "1", title: "Incomplete or defective order",),
    OptionItem(id: "2", title: "Abnormal delay in sending the consignment",),
    OptionItem(id: "3", title: "The goods arrive in a damaged condition",),
    OptionItem(id: "4", title: "The goods are different from what was ordered",),
    OptionItem(id: "5", title: "Quantity of goods is not what was ordered",),
    OptionItem(id: "6", title: "Goods are delivered to the wrong address",),
    OptionItem(id: "7", title: "Work undertaken is done unsatisfactorily",),
    OptionItem(id: "8", title: "Misbehavior of staff or salesman",),
    OptionItem(id: "9", title: "A mistake in preparing the invoice",),
    OptionItem(id: "10", title: "Defective packing might lead to the damage of goods in transit",),
    OptionItem(id: "11", title: "Mistakes in a bill or reminders for payment after the bill has been paid, etc",),
    OptionItem(id: "12", title: "Others",),
  ]);
  TextEditingController noteController = TextEditingController();
  PlatformFile? platformFile;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void optionOrderIdSelected(OptionItem optionItem) {
    optionOrderIDSelected = optionItem;
    update();
  }

  void optionProductSelect(OptionItem optionItem) {
    optionProductSelected = optionItem;
    update();
  }

  void optionComplaintSelect(OptionItem optionItem) {
    optionComplaintSelected = optionItem;
    update();
  }

  void selectFile() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
      allowMultiple: false,
    );
    if (result != null) {
      PlatformFile file = result.files.first;
      print(file.size);
      if ((file.extension == 'jpg' || file.extension == 'png') &&
          file.size <= 8 * 1024 * 1024) {
        platformFile = result.files.first;
        update();
      } else {
        showSnackBar(message: "File size exceeds 8 MB limit");
      }
    } else {
      return;
    }
    update();
  }

  void removeFile() {
    platformFile = null;
    update();
  }

}