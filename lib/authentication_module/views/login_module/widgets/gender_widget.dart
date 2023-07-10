part of 'widgets.dart';


class GenderWidget extends StatelessWidget {
  final VoidCallback onclick;
  final String title;
  final IconData icon;
  final String img;

  final bool isSelected;

  GenderWidget({
    required this.isSelected,
    required this.onclick,
    required this.title,
    required this.icon,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: isSelected ? ConstantColors.clickTextColor : null,
                borderRadius: BorderRadius.circular(20)),
            height: MediaQuery.of(context).size.height * 0.3,
            //change color based on your need
            child: Center(
              child: Image.asset(img),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              title,
              style: TextStyle(
                  color: ConstantColors.clickTextColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
