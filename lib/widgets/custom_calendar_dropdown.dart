import 'package:flutter/material.dart';
class CalendarDropDown extends StatefulWidget {
  String dropdownValue='Tuesday';
  CalendarDropDown({Key? key}) : super(key: key);

  @override
  State<CalendarDropDown> createState() => _CalendarDropDownState();
}

class _CalendarDropDownState extends State<CalendarDropDown> {
  List<DropdownMenuItem<String>>getDropdownItems(){
    List<String> itemList=['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
    List<DropdownMenuItem<String>> dropdownItems=[];
    for(int i=0;i<itemList.length;i++){
      String height=itemList[i].toString();
      var newHeight=DropdownMenuItem(
        child: Text(height),
        value: height,
      );
      dropdownItems.add(newHeight);
    }
    return dropdownItems;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 80,maxHeight: 26),
      //padding: EdgeInsets.all(8),
      //alignment: Alignment.center,
      decoration:const BoxDecoration(
          color:Color.fromRGBO(152, 149, 149, 1),
          //color: Color.fromRGBO(214,214,214,1),
          borderRadius: BorderRadius.all(Radius.circular(100))
      ) ,
      child: DropdownButton<String>(
        alignment: Alignment.center,
        menuMaxHeight: 200,
        underline: Container(),
        dropdownColor:const Color.fromRGBO(152,149,149, 1),
        hint: Text(widget.dropdownValue,style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5),fontSize: 11,fontWeight: FontWeight.w400)),
        icon: const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: ImageIcon(AssetImage('assets/images/down.png'),color: Color.fromRGBO(0, 0, 0, 0.5),),
        ),
        iconSize: 10,
        items:getDropdownItems(),
        onChanged: (value) {
          setState(() {
            widget.dropdownValue=value!;
          });
        },


      ),
    );
  }
}
