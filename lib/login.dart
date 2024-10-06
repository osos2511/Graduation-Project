
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controllers/GetAllPropertiesController.dart';
import 'Controllers/GetAllPropertybyType.dart';
import 'Controllers/LoginControllers.dart';
import 'Widgets/CustomTextFormField.dart';

void main(){
  runApp(const Login());
}
class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}
bool status=true;
bool secureText= true;
bool val = false;

class _LoginState extends State<Login> {
  final _FormKey = GlobalKey<FormState>();
  GetAllProperties prop =Get.put(GetAllProperties());
  LoginController loginController=Get.put(LoginController());
  //Getallpropertybytype getbytype =Get.put(Getallpropertybytype());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: ClipRRect(
                  borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(200)),
                  child: AppBar(
                    toolbarHeight: 80,
                    backgroundColor: Colors.deepPurple,
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("LOG" , style: TextStyle(
                          fontSize: 30 ,
                          fontWeight: FontWeight.w800,
                        ),
                        ),
                        Text(" IN" , style: TextStyle(
                            color: Colors.white ,
                            fontSize: 30,
                            fontWeight: FontWeight.w800
                        ),
                        ),
                      ],
                    ),
                  ),
              ),),
             body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(top: 90,left: 10,right: 10),
                child: Column(
                  children: [
                    Form(
                     key: _FormKey,
                      child: Column(
                        children: [
                          TextFormFieldWidget(
                            controller: loginController.emailController,
                            hint:"البريد الالكتروني" ,
                            validator: (value){
                              if(value==null || value.isEmpty){
                                return "أدخل البريد الالكتروني";
                              }
                              else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
                                return "برجاء ادخال بريد الكتروني صالح";
                              }
                              return null;
                            },
                            suffixIcon:const Icon(Icons.email) ,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormFieldWidget(
                            controller: loginController.passwordController,
                            obscureText: secureText,
                            hint:"كلمه المرور" ,
                            validator: (value){
                              if(value==null || value.isEmpty){
                                return "أدخل كلمة المرور";
                              }
                              else if (value.length<8){
                                return "كلمة المرور لا تقل عن 8 حروف";
                              }
                              return null;
                            },
                            suffixIcon:const Icon(Icons.lock),
                            prefixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  secureText = !secureText;
                                });
                              },
                              child: Icon(secureText
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
               SizedBox(height: 40,),
                Container(
                  width: 343,
                  height: 110,
                  padding: const EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                    ),
                    onPressed: (){
                      if (_FormKey.currentState!.validate()){
                         //getbytype.SearchController.text="بيع";
                        // getbytype.fetchAllPropertiesByType();
                        prop.fetchAllProperties();
                       loginController.Login();
                      // Navigator.of(context).pushNamed("Bottomnavigatbar");
                      }
                    },
                    child: const Text("تسجيل الدخول" ,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed:(){
                            Navigator.of(context).pushNamed("Signup");
                          },
                          child: const Text("إنشاء حساب جديد" ,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: Colors.blue,
                            ),
                          )
                      ),
                      const Text("ليس لديك حساب؟",style: TextStyle(
                        fontSize: 15,fontWeight: FontWeight.bold,
                      ),
                      )
                    ],
                  ),
                ),
                        ]
                      ),
                    ),
                  ],
                ),
              ),
            ),
            )
        );
    }
}