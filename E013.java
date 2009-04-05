import java.io.IOException;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.File;
import java.math.BigInteger;
import java.util.ArrayList;

public class E013 {
  public static BigInteger sumOf(Iterable<BigInteger> numbers) {
    BigInteger sum = new BigInteger("0");

    for (BigInteger number: numbers) {
      sum = sum.add(number);
    }
    return sum;
  }

  public static void main(String[] args) throws IOException {
    BufferedReader reader = new BufferedReader(new FileReader(new File("013.txt")));
    String line;

    ArrayList<BigInteger> numbers = new ArrayList<BigInteger>();
    while ((line = reader.readLine()) != null) {
      numbers.add(new BigInteger(line));
    }
    BigInteger sum = sumOf(numbers);
    System.out.println(sum.toString().substring(0, 10));
  }
}
