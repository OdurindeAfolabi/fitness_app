import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 5);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.75,
      child: Drawer(
        child: Material(
          color: const Color.fromRGBO(0, 0, 0, 1),
          child: ListView(
            children: <Widget>[
              buildHeader(
                iconAction: 'assets/images/back.png',
                imageUrl: 'assets/images/profileImage.png',
                onClicked: (){
                  Navigator.pop(context);
                },
              ),
              Container(
                padding: padding,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    buildMenuItem(
                      text: 'Joe Smith',
                      icon: Icons.edit,
                      onClicked: () => selectedItem(context, 0),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'example@gmail.com',
                      icon: Icons.edit,
                      onClicked: () => selectedItem(context, 1),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'Current Weight',
                      icon: Icons.edit,
                      onClicked: () => selectedItem(context, 2),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'BMI',
                      icon: Icons.edit,
                      onClicked: () => selectedItem(context, 3),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'Help',
                      icon: Icons.help_outline,
                      onClicked: () => selectedItem(context, 4),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader({
    required String iconAction,
    required String imageUrl,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0,top: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: onClicked,
                  child: Image.asset(iconAction)),
              Center(child: Container(
                  width: 107,
                  height: 107,
                  child: CircleAvatar(backgroundImage: AssetImage(imageUrl),)))
            ],
          ),
        ),
      );

  // Widget buildSearchField() {
  //   final color = Colors.white;
  //
  //   return TextField(
  //     style: TextStyle(color: color),
  //     decoration: InputDecoration(
  //       contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  //       hintText: 'Search',
  //       hintStyle: TextStyle(color: color),
  //       prefixIcon: Icon(Icons.search, color: color),
  //       filled: true,
  //       fillColor: Colors.white12,
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5),
  //         borderSide: BorderSide(color: color.withOpacity(0.7)),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5),
  //         borderSide: BorderSide(color: color.withOpacity(0.7)),
  //       ),
  //     ),
  //   );
  // }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Color.fromRGBO(214, 214, 214, 1);
    final hoverColor = Color.fromRGBO(214, 214, 214, 1);

    return ListTile(
      title: TextField(
        enabled: true,
        //autofocus: true,
        style: const TextStyle(color: Color.fromRGBO(214, 214, 214, 1),fontSize: 14),
        //autofocus: true,
        cursorColor:Color.fromRGBO(214, 214, 214, 1) ,
        decoration: InputDecoration(
            suffixIcon:Icon(icon, color: color),
            hintText: text,
            hintStyle: const TextStyle(
              color: Color.fromRGBO(214, 214, 214, 1),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: UnderlineInputBorder(borderSide: const BorderSide(color: Color.fromRGBO(214, 214, 214, 1),style: BorderStyle.solid)),
            focusedBorder: UnderlineInputBorder(borderSide: const BorderSide(color: Color.fromRGBO(214, 214, 214, 1),style: BorderStyle.solid))

        ),
      ),

      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        break;
      case 1:
        break;
    }
  }
}
