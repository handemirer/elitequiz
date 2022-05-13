import 'dart:convert';
import 'dart:typed_data';

import 'package:elitequiz/models/profile.dart';
import 'package:elitequiz/utils/constants.dart';
import 'package:elitequiz/utils/database.dart';
import 'package:elitequiz/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Edit extends StatefulWidget {
  String name;
  String profilePhoto;
  Edit({Key? key, required this.name, required this.profilePhoto})
      : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  String name = "";
  String profilePhoto = "";

  @override
  void initState() {
    name = widget.name;
    profilePhoto = widget.profilePhoto;
    super.initState();
  }

  void profilePicture() async {
    XFile? _tempImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxHeight: 512,
        maxWidth: 512);
    if (_tempImage != null) {
      Uint8List byte = await _tempImage.readAsBytes();
      profilePhoto = base64Encode(byte.toList());
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: eqColor,
      appBar: eqAppBar("Edit Profile", actions: [
        InkWell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                Database().updateProfile(profilePhoto, name);
                Navigator.of(context).pop();
              },
              child: Center(
                child: eqText(
                  "Save",
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ),
          ),
        ),
      ]),
      body: Container(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  profilePicture();
                },
                child: CircleAvatar(
                  radius: 64,
                  backgroundColor: Colors.white,
                  child: Image.memory(base64Decode(profilePhoto)),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                decoration: roundDecor(Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 32, right: 32, top: 8.0, bottom: 8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 32),
                            eqTextField(
                              hint: "Name",
                              onChanged: (val) {
                                name = val;
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
