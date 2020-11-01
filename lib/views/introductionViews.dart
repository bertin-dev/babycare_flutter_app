import 'dart:async';

import 'package:flutter/material.dart';
import 'package:babycare_flutter_app/views/widgets/introView.dart';

import '../main.dart';

class IntroductionViews extends StatefulWidget {
  final bool goToLogin;

  const IntroductionViews({Key key, this.goToLogin = true}) : super(key: key);

  @override
  _IntroductionViewsState createState() => _IntroductionViewsState();
}

const MaterialColor myWhite = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

class _IntroductionViewsState extends State<IntroductionViews> with SingleTickerProviderStateMixin {

  TabController tabController;

  int activeTab;

  bool done = false;


  @override
  void initState() {

    super.initState();


    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(_setActiveTabIndex);
    Timer(Duration(seconds: 60),
            (){
          if (tabController.index < tabController.length - 1) {
            setState(() {
              tabController.index += 1;
            });
            tabController.addListener((){
              print('my index is'+ tabController.index.toString());
            });

          }
          else {
            return;
          }
        }
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color(0xff63B330),
        backgroundColor: (activeTab == 0) ? Color(0xff63B330) : (activeTab == 1) ? Color(0xff6A368C) : (activeTab == 2) ? Color(0xffF07E10) :  (activeTab == 3) ? Color(0xff68C5D9) : Color(0xff63B330),

        body: Column(
          children: <Widget>[
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: <Widget>[

                  IntroView(
                      title: DemoLocalizations.of(context).trans('professionnelle_titre'),
                      message: DemoLocalizations.of(context).trans('professionnelle'),
                      imageLink: 'assets/icons/souscription/medecin.png',
                      colorBg: Color(0xff63B330),
                      imageBg: 'assets/icons/souscription/fond1.png'
                  ),

                  IntroView(
                      title: DemoLocalizations.of(context).trans('partage_titre'),
                      message: DemoLocalizations.of(context).trans('partage'),
                      imageLink: 'assets/icons/souscription/forum.png',
                      colorBg: Color(0xff6A368C),
                      imageBg: 'assets/icons/souscription/fond2.png'
                  ),

                  IntroView(
                      title: DemoLocalizations.of(context).trans('fiabilite_titre'),
                      message: DemoLocalizations.of(context).trans('fiabilite'),
                      imageLink: 'assets/icons/souscription/personal-info.png',
                      colorBg: Color(0xffF07E10),
                      imageBg: 'assets/icons/souscription/fond3.png'
                  ),

                  IntroView(
                      title: DemoLocalizations.of(context).trans('efficacite_titre'),
                      message: DemoLocalizations.of(context).trans('efficacite'),
                      imageLink: 'assets/icons/souscription/famille.png',
                      colorBg: Color(0xff68C5D9),
                      imageBg: 'assets/icons/souscription/fond4.png'
                  )

                ],),
            ),
            Container(//padding: EdgeInsets.all(10.0),
              //Set background for container.
                //decoration: (activeTab == 0) ? new BoxDecoration(color: Color(0xff63B330),) : (activeTab == 1) ? new BoxDecoration(color: Color(0xff6A368C),) : (activeTab == 2) ? new BoxDecoration(color: Color(0xffF07E10),) :  (activeTab == 3) ? new BoxDecoration(color: Color(0xff68C5D9),) : new BoxDecoration(color: Color(0xff63B330),),

                child:
                activeTab != 3 ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(onPressed: (){setState(() {tabController.index = 3;});},
                      child: IconButton(icon: Icon(Icons.close, color: Color(0xff191934),),),),

                    Theme(
                        data: ThemeData(
                            primarySwatch: Colors.blue,
                            primaryColor: myWhite
                        ),
                        child: TabPageSelector(controller: tabController, color: Colors.blue.withOpacity(0), selectedColor: Colors.black12.withOpacity(0.8),)
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: IconButton(icon: Icon(Icons.arrow_forward_ios, color: Color(0xff191934),), onPressed: pageSliding,),
                    )

                  ],)
                    :
                Padding(
                  padding: const EdgeInsets.only(bottom: 13.0),
                  child: Center(child: IconButton(icon: Icon(Icons.play_circle_outline, color: Color(0xff191934), size: 50,), onPressed: (){ widget.goToLogin ? Navigator.pushNamed(context, '/login') : Navigator.pushNamed(context, '/home');})),
                ),



            )
          ],
        )
    );
  }
  pageSliding (){
    if (tabController.index < tabController.length - 1) {
      setState(() {
        tabController.index += 1;
      });

    }
    else {
      setState(() {
        done = true;
      });
    }
  }
  void _setActiveTabIndex() {
    activeTab = tabController.index;
    setState(() {
      activeTab = tabController.index;
    });
  }


}