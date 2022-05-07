import 'package:library_attend_check/app/data/model/firestore_keys.dart';

class AppUser {
  String? uid;
  String? email;
  String? nickname;
  String? university;
  List? friendsList;
  List? friendsWaitingList;
  List? attendanceList;

  AppUser(
      {this.uid,
      this.email,
      this.nickname,
      this.university,
      this.friendsList,
      this.friendsWaitingList,
      this.attendanceList});

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      uid: json['uid'] == null ? '' : json['uid'] as String,
      email: json['email'] == null ? '' : json['email'] as String,
      nickname: json['nickname'] == null ? '' : json['nickname'] as String,
      university:
          json['university'] == null ? '' : json['university'] as String,
      friendsList:
          json['friendsList'] == null ? [] : json['friendsList'] as List,
      friendsWaitingList: json['friendsWaitingList'] == null
          ? []
          : json['friendsWaitingList'] as List,
      attendanceList: json[KEY_USER_ATTENDANCE_LIST] == null
          ? []
          : json[KEY_USER_ATTENDANCE_LIST] as List,

    );
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email,
      "nickname": nickname,
      "university": university,
      "friendsList": friendsList,
      "friendsWaitingList": friendsWaitingList,
      KEY_USER_ATTENDANCE_LIST: attendanceList,
    };
  }

  AppUser copyWith({
    String? uid,
    String? email,
    String? nickname,
    String? university,
    List? friendsList,
    List? friendsWaitingList,
    List? attendanceList,
  }) {
    return AppUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      university: university ?? this.university,
      friendsList: friendsList ?? this.friendsList,
      friendsWaitingList: friendsWaitingList ?? this.friendsWaitingList,
      attendanceList: attendanceList ?? this.attendanceList,
    );
  }
}
