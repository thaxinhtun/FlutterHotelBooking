class TBLUser {
  String? id;
  String? name;
  String? email;
  String? loginDate;
  String? fullName;
  String? phno;
  String? gender;
  String? dob;
  String? cardno;
  String? cardcode;
  String? cardExpire;
  String? nameOncard;
  String? image;

  TBLUser(
      {this.id,
      this.name,
      this.email,
      this.loginDate,
      this.fullName,
      this.phno,
      this.gender,
      this.dob,
      this.cardno,
      this.cardcode,
      this.cardExpire,
      this.nameOncard,
      this.image});
  factory TBLUser.fromMap(Map<String, dynamic> data) {
    return TBLUser(
        id: data['uid'],
        name: data['name'],
        email: data['email'],
        fullName: data['fullname'],
        gender: data['gender'],
        dob: data['dob'],
        cardno: data['cardNo'],
        cardcode: data['cardCode'],
        cardExpire: data['cardExpire'],
        nameOncard: data['nameOnCard'],
        image: data['image']);
  }
}
