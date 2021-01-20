import 'package:flutter/material.dart';
import 'package:flutter_ui9/Service/ForHive.dart';
import 'package:flutter_ui9/pages/Sign%20in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  static final String id='SignUp';


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final  _userNameController=new TextEditingController();
  final  _password=new TextEditingController();
  final  _email=new TextEditingController();
  final  _phone=new TextEditingController();

  justDoit(){
    String user=_userNameController.text.trim();
    String password= _password.text.trim();
    String email=_email.text.trim();
    String phone= _phone.text.trim();
    HiveDB.loadUsers(username:user,password:password,phone:phone,email: email  );



    Map<String,dynamic> value= HiveDB.getusers();

    print(value['username']);
    print(value['password']);
    print(value['phone']);
    print(value['email']);


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromRGBO(26, 29, 55, 1),
      body: ListView(
        children: [

          Container(
            padding: EdgeInsets.symmetric(vertical: 80),
            // margin: EdgeInsets.symmetric(horizontal:0 ),
            child:Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // picture
                // Container(
                //
                //   height: 65,
                //   width: 65
                //   ,child: ClipRRect(
                //   borderRadius:BorderRadius.circular(20),
                //   child: Image(image: AssetImage(
                //       'asset/images/ic_profil.jpg'
                //   ),),
                //
                // ),
                // ),
                SizedBox(height: 20,),
                // title
                Container(
                  width: double.infinity,
                  child:RichText(
                    textAlign: TextAlign.center,
                    text:TextSpan(
                      text:'Create\n Account',
                      style:GoogleFonts.poppins(color:Colors.white,fontWeight: FontWeight.w500,fontSize: 30,letterSpacing: 1),
                      // children: [
                      //   TextSpan(
                      //     text:'Sign in to continue',
                      //     style:GoogleFonts.poppins(color:Colors.grey[300],fontWeight: FontWeight.w500,fontSize: 19,),
                      //   ),
                      // ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                // # texfield

                _fieldfor(icon:Icon(FontAwesomeIcons.user,color: Colors.grey[300],),controller:_userNameController,text:'User Name',ispass: false),
                SizedBox(height:20),
                _fieldfor(icon:Icon(FontAwesomeIcons.envelope,color: Colors.grey[300]),controller:_email,text:'E-Mail',ispass: false),
                SizedBox(height:20),
                _fieldfor(icon:Icon(FontAwesomeIcons.phone,color: Colors.grey[300],),controller:_phone,text:'Phone Number',ispass: false),
                SizedBox(height:20),
                _fieldfor(icon:Icon(FontAwesomeIcons.key,color: Colors.grey[300]),controller:_password,text:'Password',ispass: false),
                SizedBox(height:10),
                Text('Forgot password',style: TextStyle(color: Colors.grey),),
                SizedBox(height:30),
                // icon button
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    // color: Colors.blueAccent,
                    shape: BoxShape.circle,
                    gradient:LinearGradient(
                        begin: Alignment(-1,-1),
                        colors: [
                          Colors.blue,
                          Colors.blue[700],
                          Colors.blue[400],
                          Colors.lightBlue[100]
                        ]

                    ),
                  ),
                  child: IconButton(
                    onPressed: (){
                      justDoit();
                      Navigator.push(context, MaterialPageRoute(builder:(ctx)=>SignInPage()));
                    },
                    splashColor: Colors.indigo,
                    icon: Icon(FontAwesomeIcons.arrowRight,color: Colors.white,),
                    iconSize: 25,
                  ),
                ),
                SizedBox(height: 170,),

                Container(
                  // width: double.infinity,
                  margin:EdgeInsets.only(bottom: 25),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text('Already you have account? ',style:TextStyle(fontSize: 16,color:Colors.grey[500])),
                      GestureDetector(
                        child:Text('Sign in '.toUpperCase(),style:TextStyle(fontSize: 16,color:Colors.blue,)),
                        onTap:()async{
                          await Navigator.pushNamed(context,SignInPage.id);
                        },
                      ),
                    ],
                  ),
                )








              ],
            ),
          )
        ],
      ),


    );
  }

  _fieldfor({icon,text,controller,ispass}){
    return Container(
      margin:EdgeInsets.symmetric(horizontal: 20),
      width:MediaQuery.of(context).size.width,
      decoration:BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.5,color: Colors.grey[300]))
      ),
      child: TextField(
        obscureText: ispass?true:false,
        controller:controller ,
        decoration: InputDecoration(
          icon:icon,
          hintText:text,
          hintStyle: TextStyle(color: Colors.grey[300]),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
