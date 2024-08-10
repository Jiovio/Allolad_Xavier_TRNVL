
import 'package:allolab/Config/Color.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

SingleChildScrollView SymptomsScreen() => SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Symptoms",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 10.0,
              children: List.generate(
                symptomsList.length,
                (index) =>  OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          // side: controller.symptomsSelected.contains(index)
                          //     ? BorderSide(color: PrimaryColor, width: 1.5)
                          //     : null,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {},
                        // controller.SymptomSelect(
                        //     index, symptomsList[index].title),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                // color:
                                //     controller.symptomsSelected.contains(index)
                                //         ? PrimaryColor
                                //         : Colors.grey,
                              ),
                              child: Image.asset(
                                symptomsList[index].image,
                                height: 80,
                                width: 80,
                                color: PrimaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              symptomsList[index].title,
                              style: TextStyle(
                                  color: PrimaryColor,
                                  // controller.symptomsSelected
                                  //         .contains(index)
                                  //     ? PrimaryColor
                                  //     : Black,
                                  fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
              ),
            ),
             
                  true
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: TextField(
                          onTap: () {},
                          // controller: controller.otherSymptom,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          cursorColor: PrimaryColor,
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                          onChanged: (val) {},
                          decoration: InputDecoration(
                            hintText: "Add your symptom description",
                            hintStyle: TextStyle(fontSize: 18),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            filled: true,
                            fillColor: Black100,
                          ),
                        ),
                      )
                    : Container(),
          ],
        ),
      ),
    );

  List<Symptoms> symptomsList = [
    Symptoms(title: 'Normal'.tr, image: 'assets/Symptoms/normal.png'),
    Symptoms(title: 'Body Pain'.tr, image: 'assets/Symptoms/boad_pain.png'),
    Symptoms(
        title: 'Burning Stomach'.tr,
        image: 'assets/Symptoms/burning_in_stomach.png'),
    Symptoms(title: 'Cold Cough'.tr, image: 'assets/Symptoms/cold_cough.png'),
    Symptoms(title: 'Dizziness'.tr, image: 'assets/Symptoms/dizziness.png'),
    Symptoms(title: 'Headache'.tr, image: 'assets/Symptoms/headache.png'),
    Symptoms(title: 'Vomiting'.tr, image: 'assets/Symptoms/vomiting.png'),
    Symptoms(title: 'Other'.tr, image: 'assets/Symptoms/sad.png')
  ];

class Symptoms {
  String title;
  String image;
  Symptoms({required this.title, required this.image});
}
