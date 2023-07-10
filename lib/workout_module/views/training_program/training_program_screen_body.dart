import 'package:flutter/material.dart';

import '../../../custom_widget/custom_text.dart';

class TrainingScreenBody extends StatelessWidget {
  const TrainingScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
//new
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  CustomText(text: 'Varighed',color: Colors.white,size: 16,),
                  CustomText(text: '0:02:03',color: Colors.white,size: 16,),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  CustomText(text: 'Aktuel varighed',color: Colors.white,size: 16,),
                  CustomText(text: '0:01:23',color: Colors.white,size: 16,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
