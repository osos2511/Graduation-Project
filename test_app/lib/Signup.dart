import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controllers/RegisterControllers.dart';
import 'Widgets/CustomTextFormField.dart';

void main(){
  runApp(const Signup());
}
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}
bool status=true;
bool secureText= true;
bool val = false;
RegisterController registerController=Get.put(RegisterController());
class _SignupState extends State<Signup> {
  final _FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar:  PreferredSize(
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
    Text("SIGN ",style: TextStyle(color: Colors.black,fontSize: 30 , fontWeight: FontWeight.w800),),
    Text("UP",style: TextStyle(color: Colors.white,fontSize: 30 , fontWeight: FontWeight.w800)),
    ],),),),),

            body:SingleChildScrollView(
              physics:const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(right: 10,left: 10,top: 70,),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: _FormKey,
                        child: Column(
                          children: [
                            TextFormFieldWidget(
                              controller: registerController.firstnameController,
                              hint:" الاسم الاول " ,
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return "أدخل الاسم الاول";
                                }
                                return null;
                              },
                              suffixIcon:const Icon(Icons.person) ,
                            ),
                            SizedBox(height: 20,),
                            TextFormFieldWidget(
                              controller:  registerController.lastnameController,
                              hint:"الاسم الاخير" ,
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return "أدخل الاسم الاخير";
                                }
                                return null;
                              },
                              suffixIcon:const Icon(Icons.person) ,
                            ),
                            SizedBox(height: 20,),
                            TextFormFieldWidget(
                              controller:  registerController.emailController,
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
                            SizedBox(height: 20,),
                            TextFormFieldWidget(
                              obscureText: secureText,
                              controller: registerController.passwordController,
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
                          ],
                        ),
                      ),

                     SizedBox(height: 60,),
                      Container(
                        width: 343,
                        height: 60,
                        decoration:BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        margin:const EdgeInsets.only(bottom: 30),
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            color: Colors.deepPurple,
                            height: 60,
                            child:const Text("انشاء حساب",style: TextStyle(color: Colors.white,fontSize:22 , fontWeight: FontWeight.w800))
                            ,   onPressed: (){
                          if (_FormKey.currentState!.validate()){
                            registerController.Register();
                          }
                        },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pushNamed("Login");
                            },
                            child:const Text("تسجيل الدخول",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("هل تمتلك حساب؟",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    ]
                ),
              ),
            )
            )
        );
    }

}