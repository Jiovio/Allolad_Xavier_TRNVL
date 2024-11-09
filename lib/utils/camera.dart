
import 'package:allolab/Config/Color.dart';
import 'package:allolab/Config/OurFirebase.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io' as Io;
import 'dart:convert' as convert;
import 'dart:io';
class Imageutils {


 static final picker = ImagePicker();


 static Future<String?> getImageFromCamera(String path,String phone) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 20);
    if (pickedFile != null) {
     final image = File(pickedFile.path);

    String url =  await OurFirebase.uploadImageToFirebase("Allolab", path, "l${DateTime.now().toIso8601String()}.jpg", image,phone);

      Fluttertoast.showToast(
          msg: "Image Uploaded Successfully", backgroundColor: PrimaryColor);

          return url;
    } else {
      print('No image selected.');
            Fluttertoast.showToast(
          msg: "No Image Selected", backgroundColor: PrimaryColor);
          return null;
    }

  }

  static  Future<String?> getImageFromGallery(String path,[String? phone]) async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 20,
    );
    if (pickedFile != null) {

      final image = File(pickedFile.path);

      String url =  await OurFirebase.uploadImageToFirebase("Allolab", path, "l${DateTime.now().toIso8601String()}.jpg",image,phone);

      Fluttertoast.showToast(
          msg: "Image Uploaded Successfully", backgroundColor: PrimaryColor);

          return url;
    } else {
      print('No image selected.');
            Fluttertoast.showToast(
          msg: "No Image Selected", backgroundColor: PrimaryColor);

          return null;
    }


  }


}

