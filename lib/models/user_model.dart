class UserModel{
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? photo;
  //String? cover;
  //String? bio;
  dynamic time;
  bool? isDoctor;
  String? gender;
  String? birthDate;
  String? wight;
  String? height;


  UserModel({
    required this.email,
    required this.phone,
    required this.name,
    required this.uId,
    required this.time,
    this.photo,
    //this.cover,
    //this.bio,
    required this.isDoctor,
    required this.gender,
    required this.birthDate,
    required this.wight,
    required this.height
  });

  UserModel.fromJson(Map<String,dynamic> json){
    email=json['email'];
    name=json['name'];
    phone=json['phone'];
    uId=json['uId'];
    photo=json['photo'];
    //cover=json['cover'];
    //bio=json['bio'];
    time=json['time'];
    isDoctor=json['isDoctor'];
    gender=json['gender'];
    birthDate=json['birthDate'];
    wight=json['wight'];
    height=json['height'];
  }
  Map<String,dynamic> toMap(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
      'photo':photo,
      //'cover':cover,
      //'bio':bio,
      'time':time,
      'isDoctor':isDoctor,
      'gender':gender,
      'birthDate':birthDate,
      'wight':wight,
      'height':height,
    };
  }
}