import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';

import '../../controller/setting_controller.dart';
import '../../util/constant.dart';
import '../../util/style.dart';
import '../../util/widget/custom_btn_gradient.dart';
import '../../util/widget/custom_dropdownbutton.dart';
import '../../util/widget/custom_loading.dart';
import '../../util/widget/custom_profile_textfield.dart';
import '../../util/widget/custom_text.dart';
import '../../util/widget/custom_title_text.dart';
import 'add_phone.dart';
import 'change_phone.dart';

class ProfileScreen extends StatefulWidget {
  @override
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  final SettingController _controller = Get.find<SettingController>();
  File? file;
  File? _image;
  @override
  void initState() {
    _controller.initProfileData();
    super.initState();
  }

  @override
  void dispose() {
    _controller.disposeProfileData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: SafeArea(
          child: Obx(() {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: context.theme.colorScheme.background,
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: context.theme.primaryColorLight))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kVerticalSpace(5),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey,
                        ),
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            _imgFromGallery();
                          },
                          child: Stack(
                            children: [
                              Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  width: 80,
                                  height: 80,
                                  child:
                                      // (_controller.urlImageEncode.value.isEmpty)
                                      //     ?
                                      _controller.imgUrl.value != ""
                                          ? file == null
                                              ? CircleAvatar(
                                                  radius: 40,
                                                  child: CircleAvatar(
                                                    radius: 35,
                                                    child: Image.network(
                                                      _controller.profile.value
                                                              .image ??
                                                          "",
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ))
                                              : ClipOval(
                                                  child: Image.file(
                                                    file!,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                          : SvgPicture.asset(
                                              'assets/icon/profile.svg')
                                  // : UserImageWidget(
                                  //     imageUrl: _controller
                                  //             .userProfile.value.image ??
                                  //         '',
                                  //     name: _controller.userProfile.value
                                  //             .fullName ??
                                  //         ''),
                                  ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: IconButton(
                          icon: const Icon(
                            Icons.add_a_photo,
                            color: greyColor,
                          ),
                          onPressed: () {
                            _imgFromGallery();
                          },
                        ),
                      ),
                      Center(
                        child: CustomText(
                          text: _controller.profile.value.fullName ??
                              (_controller.profile.value.name ?? ""),
                          // text: _controller.profile.value.name ?? "",
                          textStyle: kTextStyleCustom(
                              14, context.theme.colorScheme.primary),
                        ),
                      ),
                      kVerticalSpace(15),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                kSpacer(context.theme.primaryColorLight),
                Expanded(
                    child: SingleChildScrollView(
                        child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      color: context.theme.colorScheme.background,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomProfileTextfield(
                            label: 'full_name'.tr,
                            hintText: '',
                            controller: _controller.fullNameController,
                          ),
                          kDivider(),
                          kVerticalSpace(40),
                          CustomProfileTextfield(
                            label: 'username'.tr,
                            hintText: '',
                            readOnly: _controller.userNameController.text == ""
                                ? false
                                : true,
                            controller: _controller.userNameController,
                          ),
                          kDivider(),
                          kVerticalSpace(40),

                          _controller.profile.value.phno == '' ||
                                  _controller.profile.value.phno == null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTitleText(
                                        onTap: () {
                                          Get.to(() => AddPhone(
                                                controller: _controller,
                                              ));
                                        },
                                        description: 'verify_phone_no'.tr,
                                        title: 'phoneno'.tr),
                                  ],
                                )
                              : CustomProfileTextfield(
                                  readOnly: true,
                                  label: 'phoneno'.tr,
                                  hintText: '',
                                  suffixLabel: 'change_phoneno'.tr,
                                  controller: _controller.phoneNoController,
                                  onTap: () {
                                    Get.to(() => ChangePhone(
                                          controller: _controller,
                                        ));
                                  },
                                ),
                          kDivider(),
                          kVerticalSpace(40),
                          CustomProfileTextfield(
                            readOnly: true,
                            label: 'email'.tr,
                            hintText: '',
                            // suffixLabel: 'change_email'.tr,
                            controller: _controller.emailController,
                            onTap: () {
                              // Get.to(() => ChangeEmail(
                              //       controller: _controller,
                              //     ));
                            },
                          ),
                          kDivider(),
                          kVerticalSpace(40),
                          CustomText(
                            text: 'gender'.tr,
                            textStyle: kTextStyleCustom(12, dividerGrey),
                          ),
                          kVerticalSpace(8),
                          CustomDropDownButton(
                            items: ['male'.tr, 'female'.tr],
                            onChange: (value) {
                              _controller.isMale.value =
                                  value == 'male'.tr ? true : false;
                            },
                            title: 'gender'.tr,
                            selectedValue: _controller.isMale.value
                                ? 'male'.tr
                                : 'female'.tr,
                          ),
                          kVerticalSpace(40),
                          Container(
                            margin: const EdgeInsets.only(top: 8, bottom: 8),
                            child: CustomText(
                              text: 'birth_date'.tr,
                              textStyle: kTextStyleCustom(12, dividerGrey),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomDropDownButton(
                                  items: dayList,
                                  onChange: (value) {
                                    _controller.dayValue.value = value ?? '1';
                                  },
                                  title: 'day'.tr,
                                  selectedValue: _controller.dayValue.value,
                                ),
                              ),
                              kHorizontalSpace(10),
                              Expanded(
                                child: CustomDropDownButton(
                                  items: monthList,
                                  onChange: (value) {
                                    _controller.monthValue.value =
                                        value ?? 'January';
                                  },
                                  title: 'month'.tr,
                                  selectedValue: _controller.monthValue.value,
                                ),
                              ),
                              kHorizontalSpace(10),
                              Expanded(
                                child: CustomDropDownButton(
                                  items: yearList,
                                  onChange: (value) {
                                    _controller.yearValue.value =
                                        value ?? '1990';
                                  },
                                  title: 'year'.tr,
                                  selectedValue: _controller.yearValue.value,
                                ),
                              ),
                            ],
                          ),
                          kVerticalSpace(40),

                          // CustomDropDownButton(
                          //   items: ['parents'.tr, 'non_parents'.tr],
                          //   onChange: (value) {
                          //     _controller.isParent.value =
                          //         value == 'parents'.tr ? true : false;
                          //   },
                          //   title: 'parental_status'.tr,
                          //   selectedValue: _controller.isParent.value
                          //       ? 'parents'.tr
                          //       : 'non_parents'.tr,
                          // ),
                          // kVerticalSpace(40),
                          // CustomText(
                          //   text: 'pregnancy_status'.tr,
                          //   textStyle: kTextStyleCustom(12, dividerGrey),
                          // ),
                          // kVerticalSpace(8),
                          // CustomDropDownButton(
                          //   items: ['pregnent'.tr, 'non_pregnent'.tr],
                          //   onChange: (value) {
                          //     _controller.isPregnent.value =
                          //         value == 'pregnent'.tr ? true : false;
                          //   },
                          //   title: 'pregnancy_status'.tr,
                          //   selectedValue: _controller.isPregnent.value
                          //       ? 'pregnent'.tr
                          //       : 'non_pregnent'.tr,
                          // ),
                        ],
                      ),
                    ),
                    kSpacer(context.theme.primaryColorLight),
                    kVerticalSpace(20),
                    CustomBtnGradient(
                        width: 150.w,
                        height: 40.h,
                        onTap: () {
                          // if (_controller.phoneNoController.text.isEmpty) {
                          //   showToast(
                          //       'Cannot Save Now, Please verify your phone number');
                          // } else {
                          _controller.saveProfile(context);
                          // }
                        },
                        child: _controller.profileSaveLoading.value
                            ? const CustomLoading(
                                color: whiteColor,
                              )
                            : CustomText(
                                text: 'save'.tr,
                                textStyle: kTextStyleWhite(14),
                              )),
                    kVerticalSpace(50)
                  ],
                )))
              ],
            );
          }),
        ));
  }

  // _imgFromCamera() async {
  //   List<Media>? result = await ImagesPicker.openCamera(
  //     pickType: PickType.image,
  //     cropOpt: CropOption(
  //       aspectRatio: CropAspectRatio.custom,
  //       cropType: CropType.rect, // currently for android
  //     ),
  //   );
  //   if (result != null) {
  //     final File file = File(result[0].path);
  //     // _controller.uploadProfileImage(file);
  //   }
  // }

  _imgFromGallery() async {
    List<Media>? result = await ImagesPicker.pick(
      count: 1,
      pickType: PickType.image,
    );
    if (result != null) {
      setState(() {
        file = File(result[0].path);
      });

      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceImgDir = referenceRoot.child("users");
      Reference referenceImgToUpload1 =
          referenceImgDir.child(file!.path.split("/").last);

      try {
        await referenceImgToUpload1.putFile(File(file!.path));

        String img1Url = await referenceImgToUpload1.getDownloadURL();
        _controller.imgUrl.value = img1Url;
      } catch (e) {
        debugPrint("Image add to cloud storage error");
      }
      // _controller.uploadProfileImage(file);
    }
  }

  // void _showPicker(BuildContext context) {
  //   showCupertinoModalPopup(
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return CupertinoActionSheet(
  //           actions: <Widget>[
  //             Container(
  //               color: context.theme.colorScheme.outline,
  //               child: Column(
  //                 children: <Widget>[
  //                   CupertinoActionSheetAction(
  //                     onPressed: () {
  //                       _imgFromCamera();
  //                       Navigator.of(context).pop();
  //                     },
  //                     child: Container(
  //                       alignment: Alignment.centerLeft,
  //                       child: Text(
  //                         'camera'.tr,
  //                         style: kTextStyleCustom(
  //                             12, context.theme.colorScheme.primary),
  //                       ),
  //                     ),
  //                   ),
  //                   kSpacer(context.theme.primaryColorLight),
  //                   CupertinoActionSheetAction(
  //                     onPressed: () {
  //                       _imgFromGallery();
  //                       Navigator.of(context).pop();
  //                     },
  //                     child: Container(
  //                       alignment: Alignment.centerLeft,
  //                       child: Text(
  //                         'gallery'.tr,
  //                         style: kTextStyleCustom(
  //                             12, context.theme.colorScheme.primary),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //           cancelButton: GestureDetector(
  //             onTap: () => Navigator.pop(context),
  //             child: Container(
  //                 height: 40,
  //                 decoration: BoxDecoration(
  //                     color: context.theme.colorScheme.outline,
  //                     borderRadius: BorderRadius.circular(10)),
  //                 alignment: Alignment.center,
  //                 child: DefaultTextStyle(
  //                   style:
  //                       kTextStyleCustom(14, context.theme.colorScheme.primary),
  //                   child: const Text('Cancel'),
  //                 )),
  //           ),
  //         );
  //       });
  // }
}
