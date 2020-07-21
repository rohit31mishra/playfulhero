// Wrapper class for my custom exception data
public class MyException extends Exception  {
    public String name;
    public String message;
    public Integer code;

    public MyException (String name, String message, Integer code) {
        this.name = name;
        this.message = message;
        this.code = code;
    }
}