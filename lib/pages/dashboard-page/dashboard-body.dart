import 'package:flutter/material.dart';


class DashboardBody extends StatefulWidget {
  final VoidCallback onSettingsTap;

  const DashboardBody({Key key, this.onSettingsTap}) : super(key: key);

  @override
  _DashboardBodyState createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Body'),
        backgroundColor: Colors.black,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: InkWell(
              child: Icon(Icons.dehaze_outlined),
              onTap: ()=>widget.onSettingsTap(),
            ),
          )
        ],
      ),
    );
  }
}
