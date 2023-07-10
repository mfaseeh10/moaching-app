import 'package:flutter/material.dart';
import 'package:moaching_app/workout_module/views/exercise/model/model.dart';

import '../../../../constants/constant_colors.dart';
import '../../../../constants/static_data.dart';

class CategoriesSlider extends StatelessWidget {
  CategoriesSlider({Key? key ,required this.exercise}) : super(key: key);
  final List<Exercise> exercise ;

  @override
  Widget build(BuildContext context) {
    Size mediaData = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.symmetric(vertical: 1),
        width: mediaData.width,
        height: mediaData.height * 0.1,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center ,
              children:
              exercise
                  .map(
                    (type) => CategoryCard(
                  exType: type,
                ),
              )
                  .toSet().toList(),
            )));
  }


}

class CategoryCard extends StatelessWidget {
  final Exercise exType;

  //final ValueChanged<Product> onSelected;
  CategoryCard({
    Key? key,
    required this.exType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: ConstantColors.gradientSecond.withOpacity(0.8),
              style: BorderStyle.solid),
          //color: ConstantColors.gradientSecond.withOpacity(0.8),
          color: ConstantColors.tablerowText,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "category",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,

                color: ConstantColors.gradientSecond.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}