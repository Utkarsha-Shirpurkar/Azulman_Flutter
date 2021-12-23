import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.user,
    required this.deviceName,
    required this.deviceId,
  });

  String user;
  String deviceName;
  String deviceId;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
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