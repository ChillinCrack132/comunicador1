// En lib/auth/auth_codes.dart
class AppAccessCodes {
  static const Map<String, UserRole> _roleCodes = {
    '1234': UserRole.child,       // Código para niño
    '7890': UserRole.therapist,   // Código para psicólogo
  };

  static UserRole? verifyCode(String code) {
    return _roleCodes[code];
  }
}

enum UserRole { child, therapist, admin }