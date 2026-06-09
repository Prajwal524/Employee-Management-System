import java.util.Stack;

class Solution {

    public boolean isValid(String s) {

        // Create a new stack to store the characters.
        Stack<Character> stack = new Stack<>();

        // Convert string into char array and access characters using for-each loop.
        for (char ch : s.toCharArray()) {

            switch (ch) {

                // Open brackets
                case '(':
                case '{':
                case '[':
                    stack.push(ch);
                    break;

                // Closing brackets
                case ')':
                    if (stack.isEmpty() || stack.pop() != '(') {
                        return false;
                    }
                    break;

                case '}':
                    if (stack.isEmpty() || stack.pop() != '{') {
                        return false;
                    }
                    break;

                case ']':
                    if (stack.isEmpty() || stack.pop() != '[') {
                        return false;
                    }
                    break;
            }
        }

        // Return true only if stack is empty
        return stack.isEmpty();
    }

    // Main method
    public static void main(String[] args) {

        Solution sol = new Solution();

        String s1 = "()[]{}";
        String s2 = "(]";
        String s3 = "({[]})";

        System.out.println(s1 + " -> " + sol.isValid(s1));
        System.out.println(s2 + " -> " + sol.isValid(s2));
        System.out.println(s3 + " -> " + sol.isValid(s3));
    }
}