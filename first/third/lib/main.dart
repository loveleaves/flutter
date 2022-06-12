import 'package:flutter/material.dart';

void main() => runApp(const SignUpApp());

class SignUpApp extends StatelessWidget {
  const SignUpApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const ClipTestRoute(),
      },
    );
  }
}

class ClipTestRoute extends StatelessWidget {
  const ClipTestRoute();
  @override
  Widget build(BuildContext context) {
    // 头像
    Widget avatar = Image.asset("images/avatar.png", width: 60.0);
    return Center(
      child: Column(
        children: <Widget>[
          avatar, //不剪裁
          ClipOval(child: avatar), //剪裁为圆形
          ClipRRect( //剪裁为圆角矩形
            borderRadius: BorderRadius.circular(5.0),
            child: avatar,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5,//宽度设为原来宽度一半，另一半会溢出
                child: avatar,
              ),
              Text("你好世界", style: TextStyle(color: Colors.green),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRect(//将溢出部分剪裁
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,//宽度设为原来宽度一半
                  child: avatar,
                ),
              ),
              Text("你好世界",style: TextStyle(color: Colors.green))
            ],
          ),
        ],
      ),
    );
  }
}
class PaddingTestRoute extends StatelessWidget {
  const PaddingTestRoute();

  @override
  Widget build(BuildContext context) {
    return Padding(
      //上下左右各添加16像素补白
      padding: EdgeInsets.all(16.0),
      child: Column(
        //显式指定对齐方式为左对齐，排除对齐干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            //左边添加18像素补白
            padding: const EdgeInsets.only(left: 18.0),
            child: Text("Hello world"),
          ),
          Padding(
            //上下各添加20像素补白
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text("I am Andrew Stark(Loveleaves)"),
          ),
          Padding(
            // 分别指定四个方向的补白
            padding: const EdgeInsets.fromLTRB(20.0,10.0,20.0,20.0),
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }
}
