import 'package:customer_app/constants/app_string.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/app_color.dart';
import '../../../../theme/app_style.dart';
import '../controller/search_product_controller.dart';

class SearchSuggestion extends StatefulWidget{
  final bool fromCompare;
  final int? id;
  const SearchSuggestion({super.key,  this.fromCompare = false, this.id});
  @override
  State<SearchSuggestion> createState() => _SearchSuggestionState();
}

class _SearchSuggestionState extends State<SearchSuggestion> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GetBuilder<SearchProductController>(
        init: SearchProductController(),
        builder: (controller) {
          return SizedBox(height: 56,
            child: Padding(padding: const EdgeInsets.only(bottom: 10.0),
              child: Autocomplete(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  // if (textEditingValue.text.isEmpty || controller.suggestionModel == null) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  } else {
                    return controller.nameList.where((word) => word.toLowerCase().contains(textEditingValue.text.toLowerCase()));
                  }
                },
                optionsViewBuilder: (context, Function(String) onSelected, options) {
                  return Container();
                },
                onSelected: (selectedString) {
                  if (kDebugMode) {
                    print(selectedString);
                  }
                },
                fieldViewBuilder: (context, control, focusNode, onEditingComplete) {
                  controller.searchController = control;
                  return TextFormField(
                    controller: controller.searchController,
                    focusNode: focusNode,
                    textInputAction: TextInputAction.search,
                    cursorColor: AppColor.mainTextColor,
                    onChanged: (val){
                      if(val.isNotEmpty){
                        controller.getSuggestionProductName(controller.searchController.text.trim());
                      }
                      else{
                        print("Else======>");
                        controller.nameList.clear();
                        controller.update();
                      }

                    },
                    onFieldSubmitted: (value) {
                      // if(control.text.trim().isNotEmpty) {
                      //   searchProvider.saveSearchAddress( control.text.toString());
                      //   searchProvider.searchProduct(query : control.text.toString(), offset: 1);
                      // }else{
                      //   showCustomSnackBar(getTranslated('enter_somethings', context), context);
                      // }
                    },
                    style: AppStyle.textStyleOutfit(
                      color: AppColor.mainTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.only(top: 15),
                      border: InputBorder.none,
                      hintText: AppText.searchTo,
                      hintStyle: AppStyle.textStyleOutfit(
                        color: AppColor.midTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      suffixIcon: SizedBox(
                       width: 0,
                       child: Padding(
                         padding: const EdgeInsets.only(top: 15,left: 25),
                         child: Row(
                           children: [
                             if(control.text.isNotEmpty)
                             InkWell(onTap: (){
                               setState(() {
                                 control.clear();
                                 // searchProvider.cleanSearchProduct(notify: true);
                               });
                             },
                             child: const Icon(Icons.clear, size: 20,)),
                           ],
                         ),
                       ),
                     )
                    ),
                  );
                },
              ),
            ),
          );
        }
      ),
    );
  }
}
