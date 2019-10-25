

# EL表达式的使用



```xml
 <dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>jstl</artifactId>
    <version>1.2</version>
</dependency>
```

**如果要在jsp中使用 Expression Language   即EL表达式，一定要设置 isELIgnored="false"**

```xml
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table class="tab" >
    <tr >
        <th>user_id</th>
        <th>locale</th>
        <th>birthyear</th>
        <th>gender</th>
        <th>joinedAt</th>
        <th>location</th>
        <th>timezone</th>
    </tr>
    <c:forEach items="${info}" var="users" >
        <tr align="center">

            <td>${users.user_id}</td>
            <td>${users.locale}</td>
            <td>${users.birthyear}</td>
            <td>${users.gender}</td>
            <td>${users.joinedAt}</td>
            <td>${users.location}</td>
            <td>${users.timezone}</td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
```

![image-20191025152740626](D:\笔记\ELerror.png)

![image-20191025152918414](D:\笔记\Elcorrect.png)