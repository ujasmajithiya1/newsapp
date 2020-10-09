import 'package:news/countries.dart';
import 'package:news/pages/home_page.dart';
import 'package:news/pages/profile.dart';
import 'package:news/pages/saved.dart';
import './packages/packages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
  List<Widget> pages = [
    HomePage(),
    Profile(),
    Saved(),
    Countries()
    
  ];
PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: PageView.builder(
        itemCount: 4,
        controller:controller,
        onPageChanged: (page){
              setState(() {
                _index= page;
              });
            },
        
         itemBuilder:(context, position) {
          return Container(
                child:Center(child: pages[position]),
              );
            })
        
      ,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              gap: 8,
              activeColor: Colors.amber,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: Colors.white,
              tabs: [
                GButton(
                  iconColor: Colors.grey,
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  iconColor: Colors.grey,
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
                GButton(
                  iconColor: Colors.grey,
                  icon: LineIcons.bookmark,
                  text: 'Saved',
                ),
                GButton(
                  iconColor: Colors.grey,
                  icon: LineIcons.globe,
                  text: 'Country',
                ),
              ],
              selectedIndex: _index,
              onTabChange: (index){
                  setState(() {
                    _index =index;
                  });
                  controller.jumpToPage(index);
                },
            ),
          ),
        ),
      ),
    );
  }
}

