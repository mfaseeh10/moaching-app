import '../classes/class_one.dart';


final List<String>
name_item  = [
  'Straberry Ice Cream',
  'Sandwich Strave',
  'Potato Fries',
  'Straberry Ice Cream',
  'Sandwich Strave',
  'Potato Fries',
  'Straberry Ice Cream',
  'Sandwich Strave',
  'Potato Fries',
  'Straberry Ice Cream',

];

List itemimages= [
  'images/strabri_icecream.png',
  'images/sandwhich_image.png',
  'images/potato_fries_image.png',
  'images/strabri_icecream.png',
  'images/sandwhich_image.png',
  'images/potato_fries_image.png',
  'images/strabri_icecream.png',
  'images/sandwhich_image.png',
  'images/potato_fries_image.png',
  'images/strabri_icecream.png',



];
List femalimages= [
  'images/carol_hawkins_image.png',
  'images/female_image2.png',
  'images/female_image3.png',
  'images/carol_hawkins_image.png',
  'images/female_image2.png',
  'images/female_image3.png',
  'images/carol_hawkins_image.png',
  'images/female_image2.png',
  'images/female_image3.png',
  'images/carol_hawkins_image.png',


];


List<String> femalename= [
  'Carol Hawkins',
  'Patricia Reid',
  'Pemale Jawkins',
  'Carol Hawkins',
  'Particia Ride',
  'Pemale Jawkins',
  'Carol Hawkins',
  'Particia Ride',
  'Pemale Jawkins',
  'Carol Hawkins',

];

final List<AllDataModel> itemData = List.generate(
    name_item.length,
        (index) => AllDataModel('${name_item[index]}','${itemimages[index]}','${femalimages[index]}',
            '${femalename[index]}'
    )
);

