import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'injection_container.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await Supabase.initialize(
    url: 'https://zxdhbqznhmkxfhyxpguz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp4ZGhicXpuaG1reGZoeXhwZ3V6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY1OTcxMTgsImV4cCI6MjA2MjE3MzExOH0.49v9RyU5afSpS24QiO0u0oDgx-hl1ZDhs0J-06G47bw',
  );

  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  getIt.init();
}
