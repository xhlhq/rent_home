///@author: fan
///@date: 2023/2/19 15:32
///@description: 图片选择器

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyImagePicker extends StatefulWidget {
  final ValueChanged<List<File>> onChange;

  const MyImagePicker({Key? key, required this.onChange}) : super(key: key);

  @override
  State<MyImagePicker> createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  final List<XFile> _files = [];
  final ImagePicker _picker = ImagePicker();
  // 选择图片
  _pickImageFromGallery() async {
    // XFile? image = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (image == null) return;
    setState(() {
      _files.add(image);
    });
    widget.onChange(_files.map((e) => File(e.path)).toList());
  }
  // 删除图片
  _deleteImage(XFile file) {
    setState(() {
      _files.remove(file);
    });
    widget.onChange(_files.map((e) => File(e.path)).toList());
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 10 * 4) / 3;
    double height = 434 / 750 * width;
    Widget addButton = GestureDetector(
      onTap: () {
        _pickImageFromGallery();
      },
      child: Container(
        width: width,
        height: height,
        color: Colors.grey,
        child: const Center(
          child: Text(
            "+",
            style: TextStyle(fontSize: 36, color: Colors.black87),
          ),
        ),
      ),
    );
    Widget imageWapper(XFile file) {
      // Image.network(_imageFileList![index].path)
      // Image.file(File(_imageFileList![index].path))
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Image.file(
            File(file!.path),
            width: width,
            height: height,
            fit: BoxFit.contain,
          ),
          Positioned(
              top: -20,
              right: -20,
              child: IconButton(
                onPressed: () {
                  _deleteImage(file);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ))
        ],
      );
    }
    List<Widget> images = _files.map((file) => imageWapper(file)).toList()
      ..add(addButton);
    return Container(
      padding: const EdgeInsets.all(10),
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: images,
      ),
    );
  }
}
