import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_akimomi/util/widget/custom_text.dart';

import 'package:images_picker/images_picker.dart';

import '../../controller/room_controller.dart';
import '../../util/constant.dart';
import '../../util/widget/custom_button.dart';
import '../../util/widget/custom_image_upload.dart';
import '../../util/widget/payment_text_form_field.dart';

class AddRoomType extends StatefulWidget {
  final String roomType;
  const AddRoomType({super.key, required this.roomType});

  @override
  State<AddRoomType> createState() => _AddRoomTypeState();
}

class _AddRoomTypeState extends State<AddRoomType> {
  final RoomController roomController = Get.put(RoomController());
  File? _image1;
  File? _image2;
  File? _image3;
  String? _image1fileName;
  String? _image2fileName;
  String? _image3fileName;

  @override
  void initState() {
    init();

    super.initState();
  }

  void init() async {
    if (widget.roomType != "") {
      await roomController.getRoomsData(widget.roomType);

      _image1 = roomController.imagePath1.value;
      _image2 = roomController.imagePath2.value;
      _image3 = roomController.imagePath3.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text("Room Types"),
          // CustomText(
          //   text: ' Room Types',
          //   textStyle: kTextStyleCustom(16, context.theme.colorScheme.onPrimary),
          // ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: context.theme.colorScheme.surface,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  Form(
                      child: Column(
                    children: [
                      CustomText(
                          text: "Upload Images",
                          textStyle: kTextStyleCustom(14, Colors.black)),
                      kVerticalSpace(20),
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomImageUpload(
                              onTap: () async {
                                List<Media>? result = await ImagesPicker.pick(
                                  count: 1,
                                  pickType: PickType.image,
                                );
                                if (result != null) {
                                  roomController.imagePath1.value =
                                      File(result[0].path);
                                  _image1fileName = DateTime.now()
                                      .microsecondsSinceEpoch
                                      .toString();
                                  setState(() {
                                    _image1 = File(result[0].path);
                                  });

                                  debugPrint(
                                      "Image Path1 ===> ${roomController.imagePath1.value}");
                                  // _controller.uploadProfileImage(file);
                                }
                              },
                              image: _image1,
                              dbImg: roomController.img1.value,
                            ),
                            CustomImageUpload(
                              onTap: () async {
                                List<Media>? result = await ImagesPicker.pick(
                                  count: 1,
                                  pickType: PickType.image,
                                );
                                if (result != null) {
                                  roomController.imagePath2.value =
                                      File(result[0].path);
                                  _image2fileName = DateTime.now()
                                      .microsecondsSinceEpoch
                                      .toString();
                                  setState(() {
                                    _image2 = File(result[0].path);
                                  });

                                  debugPrint(
                                      "Image Path1 ===> ${roomController.imagePath2.value}");
                                  // _controller.uploadProfileImage(file);
                                }
                              },
                              image: _image2,
                              dbImg: roomController.img2.value,
                            ),
                            CustomImageUpload(
                              onTap: () async {
                                List<Media>? result = await ImagesPicker.pick(
                                  count: 1,
                                  pickType: PickType.image,
                                );
                                if (result != null) {
                                  roomController.imagePath3.value =
                                      File(result[0].path);
                                  _image3fileName = DateTime.now()
                                      .microsecondsSinceEpoch
                                      .toString();
                                  setState(() {
                                    _image3 = File(result[0].path);
                                  });

                                  debugPrint(
                                      "Image Path1 ===> ${roomController.imagePath3.value}");
                                  // _controller.uploadProfileImage(file);
                                }
                              },
                              image: _image3,
                              dbImg: roomController.img3.value,
                            ),
                          ],
                        );
                      }),

                      kVerticalSpace(20),
                      PaymentTextFormField(
                        hintText: "Room Type",
                        textEditingController:
                            roomController.roomTypeController,
                        prefixIcon: Icons.bedroom_baby,
                        textInputType: TextInputType.text,
                      ),
                      // kVerticalSpace(20),
                      kVerticalSpace(20),
                      PaymentTextFormField(
                        hintText: "Square Feet",
                        textEditingController:
                            roomController.squareFeetController,
                        prefixIcon: Icons.square_foot,
                        textInputType: TextInputType.number,
                      ),
                      kVerticalSpace(20),

                      PaymentTextFormField(
                        hintText: "Total Rooms",
                        textEditingController:
                            roomController.totalRoomsController,
                        prefixIcon: Icons.format_list_numbered,
                        textInputType: TextInputType.number,
                      ),
                      kVerticalSpace(20),

                      PaymentTextFormField(
                        hintText: "No of Double Red",
                        textEditingController:
                            roomController.doubleBedController,
                        prefixIcon: Icons.bed_rounded,
                        textInputType: TextInputType.number,
                      ),
                      kVerticalSpace(20),

                      PaymentTextFormField(
                        hintText: "No of Triple Red",
                        textEditingController:
                            roomController.tripleBedController,
                        prefixIcon: Icons.bed_rounded,
                        textInputType: TextInputType.number,
                      ),
                      kVerticalSpace(20),

                      PaymentTextFormField(
                        hintText: "No of BathRooms",
                        textEditingController:
                            roomController.bathRoomController,
                        prefixIcon: Icons.bathroom,
                        textInputType: TextInputType.number,
                      ),
                      kVerticalSpace(20),

                      PaymentTextFormField(
                        hintText: "Price Per Night (Ks)",
                        textEditingController:
                            roomController.pricePerNightController,
                        prefixIcon: Icons.price_change,
                        textInputType: TextInputType.number,
                      ),
                      kVerticalSpace(20),

                      PaymentTextFormField(
                        hintText: "No of Sleeps",
                        textEditingController: roomController.sleepsController,
                        prefixIcon: Icons.people,
                        textInputType: TextInputType.number,
                      ),

                      kVerticalSpace(30),
                      Center(
                        child: CustomButton(
                          backgroundColor: context.theme.primaryColor,
                          textStyle: kTextStyleWhite(14),
                          label: widget.roomType == ''
                              ? 'Add Room Type'
                              : "Update Room Type",
                          onTap: () async {
                            if (_image1 != null &&
                                _image2 != null &&
                                _image3 != null) {
                              Reference referenceRoot =
                                  FirebaseStorage.instance.ref();
                              Reference referenceImgDir =
                                  referenceRoot.child("RoomTypeImages");
                              Reference referenceImgToUpload1 = referenceImgDir
                                  .child(_image1!.path.split("/").last);
                              Reference referenceImgToUpload2 = referenceImgDir
                                  .child(_image2!.path.split("/").last);
                              Reference referenceImgToUpload3 = referenceImgDir
                                  .child(_image3!.path.split("/").last);
                              try {
                                referenceImgToUpload1
                                    .putFile(File(_image1!.path));
                                referenceImgToUpload2
                                    .putFile(File(_image2!.path));
                                referenceImgToUpload3
                                    .putFile(File(_image3!.path));
                                String img1Url = await referenceImgToUpload1
                                    .getDownloadURL();

                                var img2Url = await referenceImgToUpload2
                                    .getDownloadURL();
                                var img3Url = await referenceImgToUpload3
                                    .getDownloadURL();
                                var images = <String>[];
                                images.add(img1Url);
                                images.add(img2Url);
                                images.add(img3Url);
                                roomController.images.value = images;
                              } catch (e) {
                                debugPrint("Image add to cloud storage error");
                              }
                            }
                            widget.roomType == ""
                                ? roomController.validateRoomType(context)
                                : roomController
                                    .updateRoomData(widget.roomType);

                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ));
  }
}
