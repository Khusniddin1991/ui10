class User{
  String password;
  String email;


  User({this.password,this.email});


  User.convertToJson(Map<String ,dynamic>json):
      this.email=json['email'],
       this.password=json['password'];


  Map<String ,dynamic> converToMap()=>{
    'password':this.password,
    'email': this.password

  };


}