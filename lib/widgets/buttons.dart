import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  bool isSelected = false;

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OutlinedButton(onPressed: (){
          toggleSelection();
        },

          style: OutlinedButton.styleFrom(
            backgroundColor: isSelected? Colors.black : Colors.white,

          ),
          child: Text('All' ,style: TextStyle(
           color:   isSelected? Colors.white : Colors.grey
          ),),),
        OutlinedButton(onPressed: (){

        },
            style: OutlinedButton.styleFrom(
                backgroundColor:  Colors.white,

            ),
            child:  const Text('Nike', style: TextStyle(
                color: Colors.grey
            ),)),
        OutlinedButton(onPressed: (){

        },
            style: OutlinedButton.styleFrom(
              backgroundColor:  Colors.white,

            ),
            child:  const Text('Adidas',style: TextStyle(
                color:   Colors.grey
            ),)),
        OutlinedButton(onPressed: (){

        },
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,

            ),
            child:  const Text('Converse',
          style: TextStyle(
              color: Colors.grey
          ),)),
      ],
    );
  }
}
