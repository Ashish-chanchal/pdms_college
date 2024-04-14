
import 'package:pdms/consts/consts.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
           Row(
            children: [
              Icon(Icons.person_2, color: AppColors.whiteColor),
              10.widthBox,
              Text('CareLink', style: TextStyle(color: AppColors.whiteColor)),
            ],
          ),
        
        backgroundColor: AppColors.primaryColor,
       
      ),
       body:SingleChildScrollView(
         child: Column(
           children: [
             SizedBox(
              height: 620 ,
               child: Stack(
                
                children: [ListView.builder(
                 itemCount: messages.length,
                 shrinkWrap: true,
                 padding: const EdgeInsets.only(top: 10,bottom: 10),
                 physics: const NeverScrollableScrollPhysics(),
                 itemBuilder: (context, index){
                   return Container(
                     padding: const EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                     child: Align(
                alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:AppColors.primaryColor.withOpacity(0.5)),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Text(messages[index].messageContent, style: const TextStyle(fontSize: 15),),
                ),
                     ),
                   );
                 },
               ),],
               ),
             ),
             Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    
                    const SizedBox(width: 15,),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none
                        ),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    FloatingActionButton(
                      onPressed: (){},
                      backgroundColor:AppColors.primaryColor,
                      child: const Icon(Icons.send,color: Colors.white,size: 18,),
                      
                      elevation: 0,
                    ),
                  ],
                  
                ),
              ),
            ),
          ],
               ),
             
           ],
         ),
       )
    );
  }
}
