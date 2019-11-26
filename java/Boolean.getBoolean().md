# Boolean.getBoolean()

```java
public class SimpleQuestion{
    static boolean yesOrNo(String s){
        s = s.toLowerCase();
        if(s.equals("yes")||s.equals("y")||s.equals("t")){
            s = "true";
        }
        return Boolean.getBoolean(s);
    }
    
    public static void main(String[] args){
        System.out.println(yesOrNo("true")+ " "+ yesOrNo("Yes"));
    }
}
```

结果是什么呢？ 两个结果都是false。

我们看一下getBoolean()方法的源码，可以看到用了`System.getProperty`说明用的是系统属性，而不是转换方法。

```java
  public static boolean getBoolean(String name) {
        boolean result = false;
        try {
            result = parseBoolean(System.getProperty(name));
        } catch (IllegalArgumentException | NullPointerException e) {
        }
        return result;
```

那转换的方法是什么呢？

```java
Boolean result = Boolean.valueOf("true").booleanValue();
//或者
Boolean result2 = Boolean.parseBoolean("true")
```

打开两个方法的源码，我们可以看到，parseBoolean() 在 valueOf() 中也用到了。parseBoolean()是在jdk1.5以后推出的

```java
public static Boolean valueOf(String s) {
        return parseBoolean(s) ? TRUE : FALSE;
    }
```

```java
public static boolean parseBoolean(String s) {
        return ((s != null) && s.equalsIgnoreCase("true"));
    }
```

