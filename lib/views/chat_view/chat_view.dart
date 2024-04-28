import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

import 'package:pdms/consts/consts.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final _openAI = OpenAI.instance.build(
    token: OPENAI_API_KEY,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(
        seconds: 5,
      ),
    ),
    enableLog: true,
  );

  final ChatUser _currentUser =
      ChatUser(id: '1', firstName: 'Hussain', lastName: 'Mustafa');

  final ChatUser _gptChatUser =
      ChatUser(id: '2', firstName: 'CareLink', lastName: 'GPT' , profileImage: "https://cdn.pfizer.com/pfizercom/screen_shot_2020-02-20_at_1.06.10_pm.png",);

  List<ChatMessage> _messages = <ChatMessage>[];
  List<ChatUser> _typingUsers = <ChatUser>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'CareLink ',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: DashChat(
          currentUser: _currentUser,
          typingUsers: _typingUsers,
          messageOptions:  MessageOptions(
            currentUserContainerColor: Colors.black,
            containerColor: AppColors.primaryColor,
            textColor: Colors.white,
          ),
          onSend: (ChatMessage m) {
            getChatResponse(m);
          },
          messages: _messages),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {
  setState(() {
    _messages.insert(0, m);
    _typingUsers.add(_gptChatUser);
  });
  List  <Messages> _messagesHistory = _messages.reversed.map((m) {
    if (m.user == _currentUser) {
      return Messages(role: Role.user, content: m.text);
    } else {
      return Messages(role: Role.assistant, content: m.text);
    }
  }).toList();

  final request = ChatCompleteText(
    model: GptTurbo0301ChatModel(),
    messages: _messagesHistory,
    maxToken: 200,
  );
  final response = await _openAI.onChatCompletion(request: request);
  for (var element in response!.choices) {
    if (element.message != null) {
      // Check if the response contains health care or disease-related keywords
      if (containsHealthKeywords(element.message!.content)) {
        setState(() {
          _messages.insert(
            0,
            ChatMessage(
              user: _gptChatUser,
              createdAt: DateTime.now(),
              text: element.message!.content,
            ),
          );
        });
      }
      else{
         setState(() {
          _messages.insert(
            0,
            ChatMessage(
              user: _gptChatUser,
              createdAt: DateTime.now(),
              text: "I'm sorry. I am not for genreal chit chat. I am here to help you with your health. Please ask me a health related question.",
            ),
          );
        });
      }
    }
  }
  setState(() {
    _typingUsers.remove(_gptChatUser);
  });
}

bool containsHealthKeywords(String text) {
  // Define a list of health care and disease-related keywords
  List<String> healthKeywords = [
    'hi',
    'health',
    'disease',
    'heachache',
    'fever',
    'cough',
    'cold',
    'flu',
    'cancer',
    'diabetes',
    'hypertension',
    'heart attack',
    'stroke',
    'asthma',
    'allergy',
    'arthritis',
    'back pain',
    'obesity',
    'depression',
  ];
  
  // Check if any of the keywords are present in the text
  for (var keyword in healthKeywords) {
    if (text.toLowerCase().contains(keyword)) {
      return true;
    }
  }
  return false;
}
}
