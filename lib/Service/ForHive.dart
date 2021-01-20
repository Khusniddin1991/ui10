

import 'package:flutter_ui9/model/User.dart';
import 'package:hive/hive.dart';

class HiveDB{

 static var box=Hive.box('hive');


 static loadUser({String username,String password,String email ,})async{
    await box.put('username', username);
    await box.put('password', password);
  }

 static Map<String,dynamic> getuser(){

    Map<String,dynamic> mp1=new Map();
    mp1['username']=box.get('username');
    mp1['password']=box.get('password');
    return mp1;
  }

  remove(){
     box.delete('username');
     box.delete('password');

  }

 static loadUsers({String username,String password,String email,String phone})async{
   await box.put('username', username);
   await box.put('password', password);
   await box.put("phone",phone);
   await box.put("email",email);
 }

 static Map<String,dynamic> getusers(){

   Map<String,dynamic> mp1=new Map();
   mp1['username']=box.get('username');
   mp1['password']=box.get('password');
   mp1['email']=box.get('email');
   mp1['phone']=box.get('phone');
   return mp1;
 }

 removes(){
   box.delete('username');
   box.delete('password');
   box.delete('email');
   box.delete('phone');

 }







}