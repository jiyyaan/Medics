import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medics/repository/doctor_panel_repo.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/utils/utils.dart';

enum Gender { male, female }
class DoctorFormOneController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserRecord();
  }

  final _api = DoctorPanelRepositories();

  final Rx<Gender> selectedGender = Gender.male.obs;
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final Rx<bool> isChecked = false.obs;
  Rx<String> gender = ('-1').obs;


  /// User Record
  final String userID = Get.arguments;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController specialityController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode specialityFocusNode = FocusNode();
  final FocusNode genderFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode dobFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();
  final FocusNode checkBoxFocusNode = FocusNode();


  /// Important Notice Dialogue Box
  importantNotice(BuildContext context){
    Future.delayed(Duration.zero, () {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Row(
              children: [
                Icon(CupertinoIcons.exclamationmark_triangle_fill, color: AppColors.kredColor,),
                SizedBox(width: 8,),
                Text('Important Notice', style: TextStyle(color: AppColors.kredColor),),
              ],
            ),
            content: Container(
              height: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text('All the form fields are compulsory. Upload all required Documents:-', style: TextStyle(fontSize: 14),),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text('* Resume Cover Letter \n* Resume \n* Experience Letter \n* Last Doctorate Degree' ,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,),),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text('After submission of application form, you will be interviewed. Interview Letter will be sent to your concerned email.', style: TextStyle(fontSize: 14,),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Obx(
                              () => Checkbox(
                            focusNode: Get.find<DoctorFormOneController>()
                                .checkBoxFocusNode,
                            checkColor: Colors.white,
                            value:
                            Get.find<DoctorFormOneController>().isChecked.value,
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 1.5,
                            ),
                            onChanged: (bool? value) {
                              Get.find<DoctorFormOneController>().isChecked.value =
                              !Get.find<DoctorFormOneController>()
                                  .isChecked
                                  .value;
                            },
                          ),
                        ),
                        Expanded(
                          child: RichText(
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            text: TextSpan(
                              text: 'I agree to the medidoc ',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: 'Terms of Services ',
                                  style: const TextStyle(color: AppColors.kdarkColor),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                    },
                                ),
                                const TextSpan(
                                  text: 'and ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: const TextStyle(color: AppColors.kdarkColor),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                    },
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  if(isChecked.value == false){
                    Utils.toastErrorMessage("Please accept Terms of Services");
                    checkBoxFocusNode.requestFocus();
                  }
                  else
                  {
                    Get.back();
                  }
                },
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
    });
  }
  /// Date Selector Method
  Future<String> selectDate(BuildContext context) async {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
    dobController.text = dateFormat.format(selectedDate.value);
    return dateFormat.format(selectedDate.value);
  }
  /// Close Keyboard
  void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
  /// Get user record
  void getUserRecord(){
    Map data = {
      'userID' : userID
    };
    try{
      _api.getUserRecord(data).then((value) {
        ///For Fields
        nameController.text = (value[0]["user_name"]);
        gender.value = (value[0]["user_gender"]);
        dobController.text = (value[0]["user_dob"]);
        emailController.text = (value[0]["user_email"]);
        phoneController.text = (value[0]["user_phone"]);

        if(gender.value == "1"){
          selectedGender.value = Gender.male;
        }
        else if(gender.value == "0"){
          selectedGender.value = Gender.female;
        }
      });
    }catch(e){
      print(e.toString());
    }
  }
  /// Doctor Form One
  void doctorFormOne(BuildContext context) {
    bool? fields = isFieldEmpty();
    if(fields != false)
    {
      Map data = {
        'userID' : userID,
        'name': nameController.value.text,
        'speciality': specialityController.value.text,
        'gender': gender.value,
        'phone': phoneController.value.text,
        'dob': dobController.value.text,
        'email': emailController.value.text,
        'address': addressController.value.text
      };
      _api.doctorFormOne(data).then((value) {
      }).onError((error, stackTrace) {
        Utils.showSnackBar(context, error.toString());
      });
    }
  }
  /// Field checking method isEmpty or Not
  bool isFieldEmpty(){
    if(nameController.value.text == "")
    {
      Utils.toastErrorMessage("Please enter your name");
      nameFocusNode.requestFocus();
      return false;
    }
    if(specialityController.value.text == "")
    {
      Utils.toastErrorMessage("Please enter your speciality");
      specialityFocusNode.requestFocus();
      return false;
    }
    if(gender.value == "-1")
    {
      Utils.toastErrorMessage("Please select your gender");
      genderFocusNode.requestFocus();
      return false;
    }
    if(phoneController.value.text == "")
    {
      Utils.toastErrorMessage("Please enter your phone number");
      phoneFocusNode.requestFocus();
      return false;
    }
    if(dobController.value.text == "")
    {
      Utils.toastErrorMessage("Please select your date of birth");
      dobFocusNode.requestFocus();
      return false;
    }
    if(emailController.value.text == "")
    {
      Utils.toastErrorMessage("Please enter your email");
      emailFocusNode.requestFocus();
      return false;
    }
    if(addressController.value.text == "")
    {
      Utils.toastErrorMessage("Please enter your Address");
      addressFocusNode.requestFocus();
      return false;
    }
    else
    {
      return true;
    }
  }
}
