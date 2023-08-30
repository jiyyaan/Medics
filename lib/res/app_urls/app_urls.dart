
class AppUrl {
  static String baseURL = "http://192.168.100.4";
  // static String baseURL = "http://192.168.1.26";
  static String loginUrl = '$baseURL/medics/api/login.php';
  static String signupUrl = '$baseURL/medics/api/sign_up.php';
  static String loginWithGoogle = '$baseURL/medics/api/login_with_google.php';
  static String category = '$baseURL/medics/api/category.php';
  static String doctorProfile = '$baseURL/medics/api/doctor_profile.php';
  static String doctorDetail = '$baseURL/medics/api/doctor_detail.php';
  static String doctorProfileDoctorPanel = '$baseURL/medics/api/doctor_profile_doctor_panel.php';
  static String timeTable = '$baseURL/medics/api/time_table.php';
  static String paymentMethod = '$baseURL/medics/api/payment_method.php';

  ///Doctor Panel
  static String doctorPanel = '$baseURL/medics/api/doctor_panel.php';
  static String userRecord = '$baseURL/medics/api/user_record.php';
  static String doctorFormOne = '$baseURL/medics/api/doctor_form_one.php';
  static String doctorFormTwo = '$baseURL/medics/api/doctor_form_Two.php';

  /// Patient Panel
  static String patientPanel = '$baseURL/medics/api/patient_panel.php';
  static String patientFormOne = '$baseURL/medics/api/patient_form_one.php';


  ///Doctors Assets
  static String doctorPictures = '$baseURL/medics/assets/doctors/display_pictures/';
  static String resume = '$baseURL/medics/assets/doctors/resume/';

  ///Patient Assets
  static String patientPictures = '$baseURL/medics/assets/patients/display_pictures/';
}

