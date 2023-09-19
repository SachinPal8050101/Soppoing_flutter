class LogInSignUpModal {
  String? sId;
  String? token;

  LogInSignUpModal({this.sId, this.token});

  LogInSignUpModal.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['token'] = this.token;
    return data;
  }
}
