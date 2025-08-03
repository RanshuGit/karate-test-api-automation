package utils;

public class RandomDataGenerator {
    public static int generateRandomId() {
        return (int) Math.floor(Math.random() * 1000) + 1;
    }
}
