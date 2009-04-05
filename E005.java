public class E005 {
  public static long product(int from, int to) {
    long result = 1;
    for (int i = from; i < to; i++) {
      result *= i;
    }
    return result;
  }

  public static boolean isDivisibleBy(long number, int[] divisors) {
    for (int divisor: divisors) {
      if ((number % divisor) != 0) {
        return false;
      }
    }
    return true;
  }

  public static void main(String[] args) {
    long min = 1;
    long max = product(2, 20);
    int[] divisors = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20};

    for (long i = min; i <= max; i++) {
      if (isDivisibleBy(i, divisors)) {
        System.out.println(i);
        break;
      }
    }
  }
}
