import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class Ddown extends StatelessWidget {
  Ddown(
      {Key? key,
      this.validator,
      this.ssItem,
      required this.oChanged,
      this.itemz,
      this.label,
      this.mHeight,
      this.enable,
      this.sItem})
      : super(key: key);
  String? Function(Object?)? validator;

  void Function(Object?) oChanged;
  bool? ssItem;

  List<String>? itemz;
  String? sItem;
  double? mHeight;

  String? label;

  bool? enable;

  @override
  Widget build(BuildContext context) {
    // return DropdownSearch<String>(
    //   mode: Mode.MENU,
    //   showSelectedItem: ssItem!,
    //   validator: validator,
    //   items: itemz,
    //   selectedItem: sItem,
    //   label: label,
    //   enabled: enable ?? true,
    //   maxHeight: mHeight,
    //   onChanged: oChanged,
    // );

  return  DropdownSearch<String>(

                dropdownButtonProps: DropdownButtonProps(
                  constraints: BoxConstraints(maxHeight: 170)
                ),

                validator: (v) => v == null ? "Report of ?" : null,

                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                  hintText: label,
                )
                ),

                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  constraints: BoxConstraints(maxHeight: mHeight!)
                ),
                items: itemz!,
                // label: "Report of ?",
                onChanged: (value) {
                  // reportController.reportOf = value!;
                },
              );
  }
}
