
  import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

dropDown(String hint,List<String> options) {

    return DropdownSearch<String>(

                dropdownButtonProps: DropdownButtonProps(
                  constraints: BoxConstraints(maxHeight: 170)
                ),

                validator: (v) => v == null ? "Report of ?" : null,

                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                  hintText: hint,
                )
                ),

                popupProps: PopupProps.menu(
                  title: Text(hint),
                  showSelectedItems: true,
                  constraints: BoxConstraints(maxHeight: options.length*70>200?240:options.length*70)
                ),
                items: options,
                // label: "Report of ?",
                onChanged: (value) {
                  // reportController.reportOf = value!;
                },
              );

  }