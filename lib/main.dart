import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator/button.dart';

void main(){
  runApp(MaterialApp(
    home: Calculator(),
  ));
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String _result='0';
  String _exp='0';
  String _op;
  String _first='0';
  String _second='0';
  String _forSecond;
  var _solution;
  List _numbers = ['1','2','3','4','5','6','7','8','9','.','0'];
  String _check;

//function for number buttons
  void _numberButton(String _char) {
    setState(() {
      if (_op == null) {
        if (_first == '0') {
          _first = _char;
          _exp = _first;
        }
        else {
          _first = _first + _char;
          _exp = _first;
        }
      }
      else {
        if (_second == '0') {
          _second = _char;
          _exp = _exp+_second;
        }
        else {
          _forSecond=_second + _char;
          _second = _char;
          _exp = _exp+_second;
          _second=_forSecond;
        }
      }
    }
    );
  }

  //function for '.' button
  void _charDot(){
    setState(() {
      if(_op==null){
        if(_first=='0'){
          _first='.';
          _exp = _first;
        }
        else{
          if(_first.contains('.')){
            _exp='Error';
          }
          else{
            _first=_first+'.';
            _exp=_first;
          }
        }
      }
      else{
        if(_second=='0'){
          _second='.';
          _exp=_exp+_second;
        }
        else{
          if(_second.contains('.')){
            _exp='Error';
          }
          else{
            _forSecond=_second+'.';
            _second='.';
            _exp=_exp+_second;
            _second=_forSecond;
          }
        }
      }
    });
  }
//function for operation buttons
  void _operationButton(String _char){
    setState(() {
      if(_first=='0'){
        _result='Error';
      }
      else if(_second=='0'){
        _op=_char;
        _exp=_exp+_char;
      }
      else{
        if(_op!=null) {
          switch (_op) {
            case '+':
              _solution = double.parse(_first) + double.parse(_second);
              _first = _solution.toString();
              _op=_char;
              _exp = _exp + _char;
              _result = _first;
              _second = '0';
              break;
            case '-':
              _solution = double.parse(_first) - double.parse(_second);
              _first = _solution.toString();
              _op=_char;
              _exp = _exp + _char;
              _result = _first;
              _second = '0';
              break;
            case '×':
              _solution = double.parse(_first) * double.parse(_second);
              _first = _solution.toString();
              _op=_char;
              _exp = _exp + _char;
              _result = _first;
              _second = '0';
              break;
            case '÷':
              _solution = double.parse(_first) / double.parse(_second);
              _first = _solution.toString();
              _op=_char;
              _exp = _exp + _char;
              _result = _first;
              _second = '0';
              break;
            case '^':
              _solution = pow(double.parse(_first), double.parse(_second));
              _first = _solution.toString();
              _op=_char;
              _exp = _exp + _char;
              _result = _first;
              _second = '0';
              break;
            default:
              print("Error in function _operationButton()");
              break;
          }
        }
        else{
          _op=_char;
          _exp=_exp+_char;
        }
      }
    });
  }
//This function is for Clear, backspace and result
  void _mainFun(String _char){
    setState(() {
      switch(_char){
        case 'AC': _exp='0';
                   _result='0';
                   _op=null;
                   _solution=null;
                   _second='0';
                   _first='0';
                   break;
        case '=': _check=_exp.substring(_exp.length-1,_exp.length);
                  if(_numbers.contains(_check)){
                    if(_second!='0'){
                      switch(_op){
                        case '+': _solution = double.parse(_first)+double.parse(_second);
                        _first=_solution.toString();
                        _result = _first;
                        _second = '0';
                        _first='0';
                        break;
                        case '-': _solution = double.parse(_first)-double.parse(_second);
                        _first=_solution.toString();
                        _result = _first;
                        _second = '0';
                        _first='0';
                        break;
                        case '×': _solution = double.parse(_first)*double.parse(_second);
                        _first=_solution.toString();
                        _result = _first;
                        _second = '0';
                        _first='0';
                        break;
                        case '÷': _solution = double.parse(_first)/double.parse(_second);
                        _first=_solution.toString();
                        _result = _first;
                        _second = '0';
                        _first='0';
                        break;
                        case '^': _solution = pow(double.parse(_first),double.parse(_second));
                        _first=_solution.toString();
                        _result = _first;
                        _second = '0';
                        _first='0';
                        break;
                        default: print("Just for Fun");
                        break;
                      }
                      _first=_result;
                    }
                    else{
                      _result=_first;
                    }
                  }
                  else{
                    _result='Error';
                  }
                  _check=null;
                  _first='0';
                  _second='0';
                  _exp='0';
                  break;

        case '⌫': _check=_exp.substring(_exp.length-1,_exp.length);
                  _exp=_exp.substring(0,_exp.length-1);
                  if(_exp==''){
                    _exp='0';
                  }
                  if(_numbers.contains(_check)){
                    if(_second!='0'){
                      _second=_second.substring(0,_second.length-1);
                      if(_second==''){
                        _second='0';
                      }
                    }
                    else {
                      _first = _first.substring(0, _first.length - 1);
                      if (_first == '') {
                        _first ='0';
                      }
                    }
                  }
                  else{
                    _op=null;
                  }
                  _check=null;
                  break;

      }
     _op=null;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        elevation: 0,
        backgroundColor: Colors.grey[600],
      ),
      backgroundColor: Colors.grey[800],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.all(10),
            height: size.height*0.07,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              boxShadow: [
                BoxShadow(
                  offset: Offset(10,10),
                  blurRadius: 20.0,
                  color: Colors.grey[850],
                )
              ],
              borderRadius: BorderRadius.circular(10),
            ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(_exp,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  ),
                ),
            ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[850],
                  blurRadius: 20.0,
                  offset: Offset(10,10),
                )
              ]
            ),
            height: size.height*0.07,
              child: Padding(
                padding: const EdgeInsets.only(right:10),
                child: Text(_result,
                style: TextStyle(
                  fontSize: 25,
                  color:Colors.white,
                ),),
              ),
            ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: size.height*.60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              color: Colors.grey[700],
              boxShadow: [
                BoxShadow(
                  offset: Offset(5,-2),
                  blurRadius: 10,
                  color: Colors.grey[850],
                )
              ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Button(
                          char: 'AC',
                          function:()=>_mainFun('AC') ,
                          charColor: Colors.amber,
                        ),
                        Button(
                          char: '⌫',
                          function: ()=>_mainFun('⌫'),
                          charColor: Colors.amber,
                        ),
                        Button(
                          char: '^',
                          function: ()=>_operationButton('^'),
                          charColor: Colors.amber,
                        ),
                        Button(
                          char: '×',
                          function: ()=>_operationButton('×'),
                          charColor: Colors.amber,
                        )

                      ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Button(
                            char: '7',
                            function: ()=>_numberButton('7'),
                          ),
                          Button(
                            char: '8',
                            function: ()=>_numberButton('8'),
                          ),
                          Button(
                            char: '9',
                            function: ()=>_numberButton('9'),
                          ),
                          Button(
                            char: '÷',
                            function: ()=>_operationButton('÷'),
                            charColor: Colors.amber,
                          )

                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Button(
                            char: '4',
                            function: ()=>_numberButton('4'),
                          ),
                          Button(
                            char: '5',
                            function: ()=>_numberButton('5'),
                          ),
                          Button(
                            char: '6',
                            function: ()=>_numberButton('6'),
                          ),
                          Button(
                            char: '-',
                            function: ()=>_operationButton('-'),
                            charColor: Colors.amber,
                          )
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Button(
                            char: '1',
                            function: ()=>_numberButton('1'),
                          ),
                          Button(
                            char: '2',
                            function: ()=>_numberButton('2'),
                          ),
                          Button(
                            char: '3',
                            function: ()=>_numberButton('3'),
                          ),
                          Button(
                            char: '+',
                            function: ()=>_operationButton('+'),
                            charColor: Colors.amber,
                          )

                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Button(
                            char: '.',
                            function: ()=>_charDot(),
                          ),
                          Button(
                            char: '0',
                            function: ()=>_numberButton('0'),
                          ),
                          Button(
                            char: '00',
                            function: ()=>_numberButton('00'),
                          ),
                          Button(
                            char: '=',
                            function: ()=>_mainFun('='),
                            bgColor: Colors.amber,
                          )

                        ]
                    ),
                    ]
                  )
            ),
        ]
      )
    );
  }
}

