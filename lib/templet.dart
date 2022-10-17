import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TempltetCard extends StatelessWidget {
   TempltetCard({Key? key ,required this.title,required this.status,required this.myfunc,required this.Indexx,required this.deletetask}) : super(key: key);
  String title ;
  bool status ;
  Function myfunc ;
  Function deletetask;
  int Indexx;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        myfunc(Indexx);
      },
      child: Dismissible(
        key:Key('${title}') ,
        onDismissed: (dirction){
          deletetask(Indexx);
        },
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(209, 224, 224, 0.2  ),
              borderRadius: BorderRadius.circular(20)
            ),
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Expanded(child: Text(title,style: status?TextStyle(color: Colors.white,fontSize: 22, decoration: TextDecoration.lineThrough,decorationColor: Colors.black,decorationThickness: 2,):TextStyle(color: Colors.white,fontSize: 22, ),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                    status?   Icon     (Icons.done,color: Colors.green,size: 27,)   :Icon     (Icons.close,color: Colors.red,size: 27,),
                    IconButton(onPressed: (){
                      deletetask(Indexx);
                    }, icon: Icon(Icons.delete,color: Colors.pink,)),
                ],
            ),
          ),
        ),
      ),
    );
      }
}
