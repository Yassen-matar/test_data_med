class Verficationmodel {
  bool? status;
  String? msg;

  Verficationmodel({this.status, this.msg});

  Verficationmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;

    data['msg'] = msg;

    return data;
  }
}
