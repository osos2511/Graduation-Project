import 'package:flutter/material.dart';

class aboutus extends StatelessWidget {
  const aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      body: Container(
        height: 800,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.deepPurple, Colors.blueAccent])),
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Text("تطبيق سمسارك هو تطبيق عقاري يتيح للمستخدمين الباحثين عن مكان للسكن او الاستثمار سواء بصيغه الشراء أو الإيجار وذلك توفيرا للجهد والمال والتطبيق أيضا يضع الامانه و الخصوصيه في مقدمه أولوياته عن طريق المحافظة علي بيانات المستخدمين وضمان حصولهم علي صور للعقار بطريقة واضحه ونوفر أيضا واجهه سلسه و واضحه للمستخدمين للتسهيل عليهم اول نسخه من سمسارك سيتم إطلاقها عام 2025 ومع كل تحديث للتطبيق سيتم ضمان المزيد من الميزات الجديدة للمستخدمين للتسهيل عليهم أكثر",
            style: TextStyle(fontSize: 16,color: Colors.white),textAlign: TextAlign.right,),
        ),
      ),

    );
  }
}
