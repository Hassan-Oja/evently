import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height*0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primary,
          width: 2
        ),
        image: DecorationImage(
          fit: BoxFit.fill,
            image: AssetImage(AppAssets.sportsImage)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: width*0.02,
              vertical: width*0.02
            ),
            padding: EdgeInsets.symmetric(
              horizontal: width*0.02,
              vertical: height*0.001
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('22' , style: AppStyles.bold20Primary,),
                Text('Nov' , style: AppStyles.bold20Primary,),

              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.symmetric(
              horizontal: width*0.02,
              vertical: width*0.01
            ),
            padding: EdgeInsets.symmetric(
              horizontal: width*0.02,
              vertical: height*0.01
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('This is a Birthday Party ' , style: AppStyles.bold14Black,)),
                InkWell(
                  onTap: () {
                    //todo: add to favorite
                  },
                  child: Image.asset(
                      AppAssets.favoriteIcon,
                      color: AppColors.primary,
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
