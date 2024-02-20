
class AppUrl {
  // static String baseURL = "https://patientcarepoint.000webhostapp.com";
  static String baseURL = "http://192.168.100.4";
  static String loginUrl = '$baseURL/medics/api/login.php';
  static String signupUrl = '$baseURL/medics/api/sign_up.php';
  static String loginWithGoogle = '$baseURL/medics/api/login_with_google.php';
  static String category = '$baseURL/medics/api/category.php';
  static String doctorProfile = '$baseURL/medics/api/doctor_profile.php';
  static String doctorDetail = '$baseURL/medics/api/doctor_detail.php';
  static String doctorProfileDoctorPanel = '$baseURL/medics/api/doctor_profile_doctor_panel.php';
  static String timeTable = '$baseURL/medics/api/time_table.php';
  static String reservedTimeDoctors = '$baseURL/medics/api/reserved_time_doctors.php';
  static String paymentMethod = '$baseURL/medics/api/payment_method.php';

  ///Doctor Panel
  static String doctorPanel = '$baseURL/medics/api/doctor_panel.php';
  static String userRecord = '$baseURL/medics/api/user_record.php';
  static String doctorFormOne = '$baseURL/medics/api/doctor_form_one.php';
  static String doctorFormTwo = '$baseURL/medics/api/doctor_form_Two.php';
  static String interviewMessage = '$baseURL/medics/api/interview_message.php';

  /// Patient Panel
  static String patientPanel = '$baseURL/medics/api/patient_panel.php';
  static String patientFormOne = '$baseURL/medics/api/patient_form_one.php';
  static String patientDetail = '$baseURL/medics/api/patient_detail.php';
  static String bookAppointment = '$baseURL/medics/api/book_appointment.php';

  ///Medics Assets
  static String logos = '$baseURL/medics/assets/logos/';
  static String onBoardingPictures = '$baseURL/medics/assets/onboarding/';
  static String backgroundPictures = '$baseURL/medics/assets/background_pictures/';
  static String icons = '$baseURL/medics/assets/icons/';
  static String animations = '$baseURL/medics/assets/animations/';

  ///Doctors Assets
  static String doctorPictures = '$baseURL/medics/assets/doctors/display_pictures/';
  static String resume = '$baseURL/medics/assets/doctors/resume/';
  static String doctorAds = '$baseURL/medics/assets/doctors/ads/';

  ///Articles
  static String articlePictures = '$baseURL/medics/assets/articles/';

  ///Patient Assets
  static String patientPictures = '$baseURL/medics/assets/patients/display_pictures/';

  ///Patient Assets
  static String medicinePictures = '$baseURL/medics/assets/pharmacy/medicine_pictures/';
  static String pharmacyAds = '$baseURL/medics/assets/pharmacy/ads/';
}

