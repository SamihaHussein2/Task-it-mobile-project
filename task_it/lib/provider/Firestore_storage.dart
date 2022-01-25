import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:task_it/provider/Firestore_services.dart';

File? file;
var imagepicker = ImagePicker();

Future getImg() async {
  try {
    await DefaultImg();
    return url;
  } catch (e) {
    print(e);
    return null;
  }
}

// Future getImgUploaded() async {
//   try {
//     await uploadImg();
//     return url;
//   } catch (e) {
//     print(e);
//     return null;
//   }
// }

//use this to read image first
Future<String> uploadImg() async {
  // var imgPicked = await imagepicker.pickImage(source: ImageSource.gallery);
  var imgPicked = await imagepicker.pickImage(source: ImageSource.camera);

  var random = Random().nextInt(100000000);
  if (imgPicked != null) {
    file = File(imgPicked.path);
    var ImgName = basename(imgPicked.path);
    ImgName = "$random$ImgName";
    var storageRef = FirebaseStorage.instance.ref('UsersImages/$ImgName');
    await storageRef.putFile(file!);
    String url = await storageRef.getDownloadURL();
    setImg(url);
    print(url);
    return url;
  } else {
    print('no chosen image');
    return getImg().toString();
  }
}

Future<String> uploadImgGallery() async {
  var imgPicked = await imagepicker.pickImage(source: ImageSource.gallery);
  // var imgPicked = await imagepicker.pickImage(source: ImageSource.camera);

  var random = Random().nextInt(100000000);
  if (imgPicked != null) {
    file = File(imgPicked.path);
    var ImgName = basename(imgPicked.path);
    ImgName = "$random$ImgName";
    var storageRef = FirebaseStorage.instance.ref('UsersImages/$ImgName');
    await storageRef.putFile(file!);
    String url = await storageRef.getDownloadURL();
    setImg(url);
    print(url);
    return url;
  } else {
    print('no chosen image');
    return getImg().toString();
  }
}

Future<String> DefaultImg() async {
  // var imgPicked = await imagepicker.pickImage(source: ImageSource.gallery);
  //var imgPicked = await imagepicker.pickImage(source: AssetImage('assets/avatar/avatar.png'));
  // file = File('assets/avatar/avatar.png');
  // var ImgName = basename(file!.path);
  var storageRef = FirebaseStorage.instance.ref('avatar.png');
  var url = storageRef.getDownloadURL();
  //String r = url.toString();
  return url;
}
