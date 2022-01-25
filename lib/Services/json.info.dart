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

