import java.util.Scanner;

class Main {
  public static void main(String[] args) {
    Test.printData(Test.fullName("Kate", "Jones"), 27, 1.6, 50.0);
    Scanner scanner = new Scanner(System.in);

    System.out.println("名前を入力");
    String name = scanner.next();
    System.out.println("あなたは" + name);
  }



}