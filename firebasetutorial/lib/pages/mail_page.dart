
/* import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class MailPage extends StatefulWidget {
  const MailPage({super.key});

  @override
  State<MailPage> createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {

 final outlookStmp=
     hotmail(dotenv.env["OUTLOOK_EMAIL"]!, dotenv.env["OUTLOOK_PASSWORD"]!);

  sendMailFromOutlook() async {

    final message = Message()
      ..from = Address(dotenv.env["OUTLOOK_EMAIL"]!, 'Baruwala Om')
      ..recipients.add('fafasik845@padvn.com')
      ..subject = 'This is just a test mail.'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.';
      //..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

    try {
      final sendReport = await send(message, outlookStmp);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Send mail')),
      body: ElevatedButton(child: Text('Send mail from Outlook'), onPressed: (){
        sendMailFromOutlook();
        
      }),
    );
  }
} */

/*import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MailPage(),
  ));
}

class MailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Send Read-Only File'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: (){
              Send_mail();
            },
            child: Text('Send Email'),
          ),
        ),
      ),
    );
  }

  void Send_mail(){
    var
      Service_id='service_l5wlf1i',
      Template_id='template_rmqvqmv',
      User_id='wpU3cAYnvP3KDusRb';
    var s=http.post(Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {
          'origin':'http:localhost',
          'Content-Type':'application/json'
        },
      body: jsonEncode({
        'service_id':Service_id,
        'User_id':User_id,
        'template_id':Template_id,
        'template_param':{
          'name':'Baruwala Om ',
          'message':'This is just test E-mail',
          'sender_email':'ombaruwala3@gmail.com',
        }
      })
    );
  }

  /*Future<void> sendEmailWithAttachment() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/example.txt';

    // Create a read-only file
    final file = File(filePath);
    await file.writeAsString('This is a read-only file.');

    final mailtoLink = Mailto(
      to: ['baruwalaom@gmail.com'],
      subject: 'Subject',
      body: 'Please find the attached read-only file.',
    );

    // Launch the email app with the composed email
    await launchUrl(Uri.parse('$mailtoLink'));

    // Note: To attach files, you'd need to handle this natively or use a different package
  }*/

}*/







