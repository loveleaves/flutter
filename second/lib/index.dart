import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  static const Nkeys=[
    'C','D','?','/',
    '9','8','7','*',
    '6','5','4','-',
    '3','2','1','+',
    " ",'0','.','='
  ];
  //按钮背景颜色
  static const  Color NUM_BTN_BG=Color(0xff323232);
  //页面背景颜色
  static const Color PAGE_COLOR=Colors.black;
  //顶部按钮颜色
  static const Color TOP_BTN_BG=Color(0xFFa6a6a6);

  //右侧按钮颜色
  static const Color Right_BTN_BG=Color(0xFFff9500);

  //顶部按钮
  static const Tkey=[
    'C','D','?'
  ];
  //右侧按钮
  static const Rkey=[
    '/','*','-',"+",'='
  ];

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  String _num="";

  void clickKey(String key){
    if ("C".compareTo(key) == 0){
      _num="";
      key="";
    }
    setState(() {
      _num+=key;
    });//点击
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: IndexPage.PAGE_COLOR,
      appBar: AppBar(
        title: Text("计算器"),
        backgroundColor: IndexPage.PAGE_COLOR,
        centerTitle: true,
      ),
      body: Padding(
        //设置按钮的边距，不紧挨着最下面
        padding: const EdgeInsets.all(8.0),
        child: Container(child: Column(
          children: <Widget>[
            //Expanded用来指定元素填充页面
            Expanded(
                child:SingleChildScrollView(
                    reverse: true,//显示区域滚动
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                      child: Align(
                          alignment:Alignment.bottomRight,
                          child: Text("$_num",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32.0,
                            ),
                          )
                      ),
                    ))
            ),
            //row组件实现按钮布局，row组件是按列排序的
            Container(
                child: Center(
                    child: _buildBtns()))
          ],
        ),),
      ),
    );
  }

  Widget buildFlatButton(String num, {int flex = 1}) {
    //Expande使按钮在整行进行分布，而不是靠左分布
    return Expanded(
      //flex按钮的尺寸
      flex: flex,
      //FlatButton是透明背景的按钮组件，可以使用FlatButton包裹Container来实现圆形按钮。
      child: FlatButton(
          onPressed: ()  {
            clickKey(num);

          }, //点击按钮触发的方法
          padding: EdgeInsets.all(0.0),
          child: Container(
            //设置按钮的颜色
            decoration: BoxDecoration(
              //给各个按钮分配颜色
                color: IndexPage.Tkey.contains(num)?IndexPage.TOP_BTN_BG:IndexPage.Rkey.contains(num)?IndexPage.Right_BTN_BG:IndexPage.NUM_BTN_BG,
                //判断flex是否>1，如果是就把按钮形状修改为矩形否则就为圆形
                shape: flex > 1 ? BoxShape.rectangle : BoxShape.circle,
                //把矩形的边角修饰圆一些
                borderRadius: flex > 1 ? BorderRadius.all(Radius.circular(1000)) : null
            ),
            //设置字体的大小
            padding: EdgeInsets.all(20),
            //'$num'显示按钮的值
            margin: EdgeInsets.all(10.0),
            child: Center(child: Text(
                '$num', style: TextStyle(fontSize: 28, color: Colors.white))),
          )
      ),
    );
  }

  Widget _buildBtns() {
    List<Widget> rows = [];
    List<Widget> btns = [];
    int flex=1;
    for (int i = 0; i < IndexPage.Nkeys.length; i++) {
      String key = IndexPage.Nkeys[i];
      if(key==" "){
        flex++;
        continue;
      }else{
        Widget b = buildFlatButton(key,flex:flex);
        btns.add(b);
        flex=1;
      }

      //四个按钮为一行
      if ((i + 1) % 4 == 0) {
        rows.add(Row(
          children: btns,
        ));
        btns = [];
      }
    }
    //当不足三个时候，也就是最后一行
    if(btns.length>0)
    {
      rows.add(Row(
        children: btns,
      ));
    }


    return Column(
      children: rows,

    );
  }
}
