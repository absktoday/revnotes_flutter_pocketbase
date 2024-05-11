import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revnotes_flutter_pocketbase/src/controllers/auth_controller.dart';

final authProvider = ChangeNotifierProvider((ref) => AuthController());
