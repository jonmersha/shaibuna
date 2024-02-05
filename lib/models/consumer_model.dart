class ConsumerResponse {
  List<Consumers>? consumers;
  ConsumerResponse({this.consumers});
  ConsumerResponse.fromJson(Map<String, dynamic> json) {
    if (json['consumers'] != null) {
      consumers = <Consumers>[];
      json['consumers'].forEach((v) {
        consumers!.add(new Consumers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.consumers != null) {
      data['consumers'] = this.consumers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Consumers {
  int? id;
  String? fullName;
  String? email;
  String? mobileNumber;
  Null? locLatitude;
  Null? locLongitude;

  Consumers(
      {this.id,
        this.fullName,
        this.email,
        this.mobileNumber,
        this.locLatitude,
        this.locLongitude});

  Consumers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    locLatitude = json['loc_latitude'];
    locLongitude = json['loc_longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['loc_latitude'] = this.locLatitude;
    data['loc_longitude'] = this.locLongitude;
    return data;
  }
}
