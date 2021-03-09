import 'package:flutter/material.dart';


class ItemSetting{
  final String name;
  final IconData logo;

  ItemSetting({@required this.name, @required this.logo});
}

class DashboardSettings extends StatelessWidget {
  double height, width;

  List<ItemSetting> listItemSettings = [
    ItemSetting(name: 'Archive', logo: Icons.archive),
    ItemSetting(name: 'Activity', logo: Icons.access_time),
    ItemSetting(name: 'Saved', logo: Icons.bookmark_border),
  ];

  Widget itemSettingWidget ({@required String nameSetting, @required IconData iconSetting}){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconSetting,
            color: Colors.white,
            size: 20.0,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            "$nameSetting",
            style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w400, letterSpacing: 0.5),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text("Settings", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600, letterSpacing: 1.0),),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: listItemSettings.map((e) => itemSettingWidget(nameSetting: e.name, iconSetting: e.logo)).toList()
              ),
            )
          ],
        ),
      )
    );
  }
}
