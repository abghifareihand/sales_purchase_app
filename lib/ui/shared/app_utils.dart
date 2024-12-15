class AppUtils {
  static String getRoleString(int role) {
    switch (role) {
      case 1:
        return 'SALES';
      case 2:
        return 'PURCHASING';
      default:
        return 'ADMIN';
    }
  }
}
