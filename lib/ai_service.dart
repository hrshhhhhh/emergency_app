import 'package:google_generative_ai/google_generative_ai.dart';

class AiService {
  // Paste your Gemini key inside these quotes:
  static const String _apiKey = 'AQ.Ab8RN6KVM-Gts5yyl5k_lgAwyWp9IK1v_SBdXq7B-DU3RDp1_w';

  static Future<String> getDirective(String emergencyType, String notes) async {
    try {
      final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: _apiKey);
      final prompt = 'Emergency type: $emergencyType. Victim note: "$notes". '
          'Give a strict 10-word instruction telling civilian first responders what to do immediately upon arrival.';
      final response = await model.generateContent([Content.text(prompt)]);
      return response.text?.trim() ?? 'Proceed with caution and assess the situation.';
    } catch (e) {
      return 'Ensure personal safety first and check vitals.';
    }
  }
}