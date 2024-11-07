// lib/core/services/translation_service.dart
import 'package:injectable/injectable.dart';
import 'package:simplytranslate/simplytranslate.dart';

@lazySingleton
class TranslationService {
  static final _translator = SimplyTranslator(EngineType.google);

  // Initialize the service with a specific instance
  Future<void> initialize() async {
    _translator.setSimplyInstance = "simplytranslate.pussthecat.org";
    await _translator.fetchInstances();
  }

  // Simple translation
  Future<String> quickTranslate(String text, {String from = 'en', required String to}) async {
    return await _translator.trSimply(text, from, to);
  }

  // Advanced translation with multiple retries and instance switching
  Future<TranslationResult> translateWithRetries(
    String text, {
    String from = 'en',
    required String to,
    int retries = 4,
  }) async {
    final result = await _translator.translateSimply(
      text,
      from: from,
      to: to,
      instanceMode: InstanceMode.Loop,
      retries: retries,
    );
    return TranslationResult(
      text: result.translations.text,
      translations: result.translations.frequencyTranslations,
    );
  }

  // Get available instances
  List<String> get availableInstances => _translator.getSimplyInstances;

  // Get current instance
  String get currentInstance => _translator.getCurrentSimplyInstance;

  // Check if specific instance is working
  Future<bool> isInstanceWorking(String instance) async {
    return await _translator.isSimplyInstanceWorking(instance);
  }
}

// Simple result class to handle translations
class TranslationResult {
  final String text;
  final List<String>? translations;

  TranslationResult({required this.text, this.translations});
}
