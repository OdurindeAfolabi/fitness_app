import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HeightButton extends StatefulWidget {
  String dropdownValue;

  HeightButton(this.dropdownValue);
  @override
  State<HeightButton> createState() => _HeightButtonState();
}

class _HeightButtonState extends State<HeightButton> {
  List<DropdownMenuItem<String>>getDropdownItems(){
    List itemList = Iterable<int>.generate(101).toList();
   // List<String> itemList=['1','2','3','4','5','6','7','8','9','10'];
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
      alignment: Alignment.center,
      decoration:const BoxDecoration(
        color: Color.fromRGBO(103,103,103, 0.68),
        borderRadius: BorderRadius.all(Radius.circular(100))
      ) ,
      child: DropdownButton<String>(
        menuMaxHeight: 100,
        underline: Container(),
        dropdownColor:Color.fromRGBO(214,214,214, 0.68),
        hint: Text(widget.dropdownValue,style: TextStyle(color: Color.fromRGBO(214, 214, 214, 1),fontSize: 14,fontWeight: FontWeight.w400)),
        icon: const ImageIcon(AssetImage('assets/images/down.png'),color: Color.fromRGBO(152, 149, 149, 1),),
        iconSize: 12,
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
