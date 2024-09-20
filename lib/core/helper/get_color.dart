import 'package:flutter/material.dart';

abstract class GetColor {
  static Color? getColor({required String color})
  {
    if(color.toLowerCase() == "green")
      {
        return Colors.green;
      }
    else if(color.toLowerCase() == "red")
      {
        return Colors.red;
      }
    else if(color.toLowerCase() == "blue")
    {
      return Colors.blue;
    }
    else if(color.toLowerCase() == "pink")
    {
      return Colors.pink;
    }
    else if(color.toLowerCase() == "grey")
    {
      return Colors.grey;
    }
    else if(color.toLowerCase() == "purple")
    {
      return Colors.purple;
    }
    else if(color.toLowerCase() == "black")
    {
      return Colors.black;
    }
    else if(color.toLowerCase() == "white")
    {
      return Colors.white;
    }
    else if(color.toLowerCase() == "yellow")
    {
      return Colors.yellow;
    }
    else if(color.toLowerCase() == "orange")
    {
      return Colors.orange;
    }
    else if(color.toLowerCase() == "brown")
    {
      return Colors.brown;
    }
    else{
      return null;
  }
  }
}