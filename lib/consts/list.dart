import 'package:pdms/consts/consts.dart';

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}class Doctor {
  String name;
  String specialty;

  Doctor(this.name, this.specialty);
}

List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  ChatMessage(
      messageContent: "Hey Kriss, I am doing fine dude. wbu?",
      messageType: "sender"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(
      messageContent: "Is there any thing wrong?", messageType: "sender"),
];

var iconlist = [
  AppIcons.body,
  AppIcons.ear,
  AppIcons.eye,
  AppIcons.heart,
  AppIcons.kidney,
  AppIcons.liver,
  AppIcons.lungs,
  AppIcons.stomach,
  AppIcons.tooth
];

var categorylist = [
  AppCategory.body,
  AppCategory.ear,
  AppCategory.eye,
  AppCategory.heart,
  AppCategory.kidney,
  AppCategory.liver,
  AppCategory.lungs,
  AppCategory.stomach,
  AppCategory.tooth
];

 List<Doctor> doctors = [
    Doctor("Dr. Smith", "Cardiologist"),
    Doctor("Dr. Johnson", "Pediatrician"),
    Doctor("Dr. Williams", "Dermatologist"),
    Doctor("Dr. Brown", "Oncologist"),
    Doctor("Dr. Miller", "Neurologist"),
  ];