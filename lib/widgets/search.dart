import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height* 0.08,
          width: width * 0.57,
          child: TextFormField(
            controller: searchController,
            decoration:  const InputDecoration(
              labelText: 'search',
              labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black
              ),
              hintText: 'search',
              hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black
              ),
              border: OutlineInputBorder(


              ),
              // errorText: 'Enter the correct value'
            ),


          ),
        ),
        Container(
           height: height*0.06,
            width: width *0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color:  Colors.black,
            ),
            child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.search,
                  color: Colors.white, size: 25 ,)))
      ],
    );
  }
}
