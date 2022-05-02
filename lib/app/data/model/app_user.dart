class AppUser {
  String? uid;
  String? email;
  String? nickname;
  String? university;
  List? friendsList;
  List? friendsWaitingList;

  AppUser(
      {this.uid,
      this.email,
      this.nickname,
      this.university,
      this.friendsList,
      this.friendsWaitingList});

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
    };
  }

  AppUser copyWith({
    String? uid,
    String? email,
    String? nickname,
    String? university,
    List? friendsList,
    List? friendsWaitingList,
  }) {
    return AppUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      university: university ?? this.university,
      friendsList: friendsList ?? this.friendsList,
      friendsWaitingList: friendsWaitingList ?? this.friendsWaitingList,
    );
  }
}
