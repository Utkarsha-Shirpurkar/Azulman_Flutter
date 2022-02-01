import 'dart:convert';

//LoginwithOTP:
LoginwithOtp loginwithOtpFromJson(String str) => LoginwithOtp.fromJson(json.decode(str));

String loginwithOtpToJson(LoginwithOtp data) => json.encode(data.toJson());

class LoginwithOtp {
  LoginwithOtp({
    required this.user,
    required this.deviceName,
    required this.deviceId,
  });

  String user;
  String deviceName;
  String deviceId;

  factory LoginwithOtp.fromJson(Map<String, dynamic> json) => LoginwithOtp(
    user: json["User"],
    deviceName: json["DeviceName"],
    deviceId: json["DeviceID"],
  );

  Map<String, dynamic> toJson() => {
    "User": user,
    "DeviceName": deviceName,
    "DeviceID": deviceId,
  };
}


//LoginwithOTP'sResponse:
class LoginResponse {
  LoginResponse({
    required this.flag,
    required this.message
  });

  String flag;
  String message;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      LoginResponse(
          flag: json["flag"],
          message: json["message"]
      );

  Map<String, dynamic> toJson() =>
      {
        "flag": flag,
        "message": message
      };
}

//VerifyLoginwithOTP:
VerifyLogin verifyLoginFromJson(String str) => VerifyLogin.fromJson(json.decode(str));

String verifyLoginToJson(VerifyLogin data) => json.encode(data.toJson());

class VerifyLogin {
  VerifyLogin({
    required this.user,
    required this.otp,
    required this.deviceName,
    required this.deviceId,
  });

  String user;
  String otp;
  String deviceName;
  String deviceId;

  factory VerifyLogin.fromJson(Map<String, dynamic> json) => VerifyLogin(
    user: json["User"],
    otp: json["OTP"],
    deviceName: json["DeviceName"],
    deviceId: json["DeviceID"],
  );

  Map<String, dynamic> toJson() => {
    "User": user,
    "OTP": otp,
    "DeviceName": deviceName,
    "DeviceID": deviceId,
  };
}


//
// VerifyUser verifyUserFromJson(String str) => VerifyUser.fromJson(json.decode(str));
//
// String verifyUserToJson(VerifyUser data) => json.encode(data.toJson());

//VerifyLoginwithOTP'sResponse:
class VerifyUser {
  VerifyUser({
    required this.isValidUser,
  });

  String isValidUser;

  factory VerifyUser.fromJson(Map<String, dynamic> json) => VerifyUser(
    isValidUser: json["IsValidUser"],
  );

  Map<String, dynamic> toJson() => {
    "IsValidUser": isValidUser,
  };
}

//EmailLoginAPI:
EmailLogin emailLoginFromJson(String str) => EmailLogin.fromJson(json.decode(str));

String emailLoginToJson(EmailLogin data) => json.encode(data.toJson());

class EmailLogin {
  EmailLogin({
    required this.phoneno,
    required this.email,
    required this.deviceId,
    required this.deviceName,
  });

  String phoneno;
  String email;
  String deviceId;
  String deviceName;

  factory EmailLogin.fromJson(Map<String, dynamic> json) => EmailLogin(
    phoneno: json["Phoneno"],
    email: json["Email"],
    deviceId: json["DeviceID"],
    deviceName: json["DeviceName"],
  );

  Map<String, dynamic> toJson() => {
    "Phoneno": phoneno,
    "Email": email,
    "DeviceID": deviceId,
    "DeviceName": deviceName,
  };
}

//EmailLoginapi'sResponse:
EmailLoginResponse emailLoginResponseFromJson(String str) => EmailLoginResponse.fromJson(json.decode(str));

String emailLoginResponseToJson(EmailLoginResponse data) => json.encode(data.toJson());

class EmailLoginResponse {
  EmailLoginResponse({
    required this.isValidUser,
    required this.message,
  });

  String isValidUser;
  String message;

  factory EmailLoginResponse.fromJson(Map<String, dynamic> json) => EmailLoginResponse(
    isValidUser: json["IsValidUser"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "IsValidUser": isValidUser,
    "message": message,
  };
}

//LogOut Api's
LogOut logOutFromJson(String str) => LogOut.fromJson(json.decode(str));

String logOutToJson(LogOut data) => json.encode(data.toJson());

class LogOut {
  LogOut({
    required this.userId,
  });

  String userId;

  factory LogOut.fromJson(Map<String, dynamic> json) => LogOut(
    userId: json["UserID"],
  );

  Map<String, dynamic> toJson() => {
    "UserID": userId,
  };
}


//VerifyloginOTP Response

LoginUserData loginUserDataFromJson(String str) => LoginUserData.fromJson(json.decode(str));

String loginUserDataToJson(LoginUserData data) => json.encode(data.toJson());

class LoginUserData {
  LoginUserData({

    required this.address,
    required this.adhaarNo,
    required this.adhaarScan,
    required this.bankDetails,
    required this.city,
    required this.deviceId,
    required this.deviceName,
    required this.drivingLicenseNo,
    required this.emailId,
    required this.fcmDeviceTokens,
    required this.isValidUser,
    required this.name,
    required this.numberOfJobs,
    required this.onDutyTime,
    required this.phoneno,
    required this.profilePic,
    required this.state,
    required this.technicianActivityStatus,
    required this.technicianStatus,
    required this.trade,
    required this.userType,
    required this.vehicleNo,
    required this.verificationStatus,
    required this.id,

  });

  List<dynamic> address;
  String adhaarNo;
  String adhaarScan;
  BankDetails bankDetails;
  String city;
  String deviceId;
  String deviceName;
  String drivingLicenseNo;
  String emailId;
  List<dynamic> fcmDeviceTokens;
  String isValidUser;
  String name;
  int numberOfJobs;
  DateTime onDutyTime;
  String phoneno;
  String profilePic;
  String state;
  String technicianActivityStatus;
  String technicianStatus;
  String trade;
  String userType;
  String vehicleNo;
  String verificationStatus;
  int id;

  factory LoginUserData.fromJson(Map<String, dynamic> json) => LoginUserData(
    address: List<dynamic>.from(json["Address"].map((x) => x)),
    adhaarNo: json["AdhaarNo"],
    adhaarScan: json["AdhaarScan"],
    bankDetails: BankDetails.fromJson(json["BankDetails"]),
    city: json["City"],
    deviceId: json["DeviceID"],
    deviceName: json["DeviceName"],
    drivingLicenseNo: json["DrivingLicenseNo"],
    emailId: json["EmailID"],
    fcmDeviceTokens: List<dynamic>.from(json["FCMDeviceTokens"].map((x) => x)),
    isValidUser: json["IsValidUser"],
    name: json["Name"],
    numberOfJobs: json["NumberOfJobs"],
    onDutyTime: DateTime.parse(json["OnDutyTime"]),
    phoneno: json["Phoneno"],
    profilePic: json["ProfilePic"],
    state: json["State"],
    technicianActivityStatus: json["TechnicianActivityStatus"],
    technicianStatus: json["TechnicianStatus"],
    trade: json["Trade"],
    userType: json["UserType"],
    vehicleNo: json["VehicleNo"],
    verificationStatus: json["VerificationStatus"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "Address": List<dynamic>.from(address.map((x) => x)),
    "AdhaarNo": adhaarNo,
    "AdhaarScan": adhaarScan,
    "BankDetails": bankDetails.toJson(),
    "City": city,
    "DeviceID": deviceId,
    "DeviceName": deviceName,
    "DrivingLicenseNo": drivingLicenseNo,
    "EmailID": emailId,
    "FCMDeviceTokens": List<dynamic>.from(fcmDeviceTokens.map((x) => x)),
    "IsValidUser": isValidUser,
    "Name": name,
    "NumberOfJobs": numberOfJobs,
    "OnDutyTime": onDutyTime.toIso8601String(),
    "Phoneno": phoneno,
    "ProfilePic": profilePic,
    "State": state,
    "TechnicianActivityStatus": technicianActivityStatus,
    "TechnicianStatus": technicianStatus,
    "Trade": trade,
    "UserType": userType,
    "VehicleNo": vehicleNo,
    "VerificationStatus": verificationStatus,
    "_id": id,
  };
}

class BankDetails {
  BankDetails({
    required this.accHolderName,
    required this.bankAccNo,
    required this.bankAccType,
    required this.bankName,
    required this.branchName,
    required this.ifsc,
  });

  String accHolderName;
  String bankAccNo;
  String bankAccType;
  String bankName;
  String branchName;
  String ifsc;

  factory BankDetails.fromJson(Map<String, dynamic> json) => BankDetails(
    accHolderName: json["AccHolderName"],
    bankAccNo: json["BankAccNo"],
    bankAccType: json["BankAccType"],
    bankName: json["BankName"],
    branchName: json["BranchName"],
    ifsc: json["IFSC"],
  );

  Map<String, dynamic> toJson() => {
    "AccHolderName": accHolderName,
    "BankAccNo": bankAccNo,
    "BankAccType": bankAccType,
    "BankName": bankName,
    "BranchName": branchName,
    "IFSC": ifsc,
  };
}

//LogOut api
Logout logoutFromJson(String str) => Logout.fromJson(json.decode(str));

String logoutToJson(Logout data) => json.encode(data.toJson());

class Logout {
  Logout({
    required this.userId,
  });

  int userId;

  factory Logout.fromJson(Map<String, dynamic> json) => Logout(
    userId: json["UserID"],
  );

  Map<String, dynamic> toJson() => {
    "UserID": userId,
  };
}


//NavBar Side Menu Customer Screen.
UserSideNav userSideNavFromJson(String str) => UserSideNav.fromJson(json.decode(str));

String userSideNavToJson(UserSideNav data) => json.encode(data.toJson());

class UserSideNav {
  UserSideNav({
    required this.user,
  });

  String user;

  factory UserSideNav.fromJson(Map<String, dynamic> json) => UserSideNav(
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
  };
}
