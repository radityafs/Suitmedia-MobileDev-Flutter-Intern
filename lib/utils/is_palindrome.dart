bool isPalindrome(String str) {
  String reversed = str.split('').reversed.join('');
  return str == reversed;
}