import 'dart:convert';
import 'package:http/http.dart' as http;
Future sendEmail(
    {required String email,
      required String name,
      required String subject,
      required String status,
      required String message}) async {
  const serviceId = "service_3kqrywp";
  const templateId = "template_8csievp";
  const userId = "user_xu4UnTIpkoZqVophO8pu2";
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  final response = await http.post(
      url,
      headers:{
        // ; charset=UTF-8
        'origin': 'http://localhost',
        'Content-Type':'application/json; charset=UTF-8'
      },
      body: jsonEncode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_subject': subject,
          'user_status': status,
          'user_message': message,
        }
      })
  );

  return response.statusCode;
}