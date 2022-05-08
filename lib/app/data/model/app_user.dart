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
      uid: json[KEY_USER_UID] == null ? '' : json[KEY_USER_UID] as String,
      email: json[KEY_USER_EMAIL] == null ? '' : json[KEY_USER_EMAIL] as String,
      nickname: json[KEY_USER_NICKNAME] == null ? '' : json[KEY_USER_NICKNAME] as String,
      university:
          json[KEY_USER_UNIVERSITY] == null ? '' : json[KEY_USER_UNIVERSITY] as String,
      friendsList:
          json[KEY_USER_FRIENDS_LIST] == null ? [] : json[KEY_USER_FRIENDS_LIST] as List,
      friendsWaitingList: json[KEY_USER_FRIENDS_WAITING_LIST] == null
          ? []
          : json[KEY_USER_FRIENDS_WAITING_LIST] as List,
      attendanceList: json[KEY_USER_ATTENDANCE_LIST] == null
          ? []
          : json[KEY_USER_ATTENDANCE_LIST] as List,

    );
  }

  Map<String, dynamic> toMap() {
    return {
      KEY_USER_UID: uid,
      KEY_USER_EMAIL: email,
      KEY_USER_NICKNAME: nickname,
      KEY_USER_UNIVERSITY: university,
      KEY_USER_FRIENDS_LIST: friendsList,
      KEY_USER_FRIENDS_WAITING_LIST: friendsWaitingList,
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
