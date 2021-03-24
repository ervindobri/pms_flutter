import 'package:flutter/material.dart';
import 'package:flutter_projects/constants/global_variables.dart';
import 'package:flutter_projects/constants/theme_data.dart';

class MenuWidget extends StatelessWidget {
  final Function(String)? onItemClick;

  MenuWidget({Key? key, this.onItemClick}) : super(key: key);

  NetworkImage? _avatarImg = NetworkImage('https://www.w3schools.com/howto/img_avatar.png');


  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.vibrantGreen,
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 65,
            backgroundColor: Colors.grey,
            backgroundImage: _avatarImg,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'VDM Dermatoscope',
            textAlign: TextAlign.center,
            style: TextStyle(

                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'BalsamiqSans'),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: List.generate(GlobalVariables.menuItems.length, (index) => sliderItem(GlobalVariables.menuItems.keys.toList()[index], GlobalVariables.menuItems.values.toList()[index].first)),
          ),
          sliderItem('Setting', Icons.settings),
          sliderItem('LogOut', Icons.arrow_back_ios)
        ],
      ),
    );
  }

  Widget sliderItem(String title, IconData icons) => TextButton(
    onPressed: (){
      onItemClick!(title);
    },
    child: ListTile(
      hoverColor: Colors.greenAccent,
        title: Text(
          title,
          style:
          TextStyle(color: Colors.white, fontFamily: 'BalsamiqSans_Regular'),
        ),
        leading: Icon(
          icons,
          color: Colors.white,
        ),
        onTap: () {
          onItemClick!(title);
        }),
  );
}