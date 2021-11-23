# web-application
Sample of simple JavaEE Web API on embedded Tomcat 7 server and migration to Spring Web MVC

## Configure application to use Spring MVC

- add Spring MVC Framework dependency
 ```
<dependency>
   <groupId>org.springframework</groupId>
   <artifactId>spring-webmvc</artifactId>
   <version>5.3.10</version>
</dependency>
 ```
- Spring MVC uses Front Controller Pattern -> Dispatcher Servlet. 

Add Dispatcher Servlet to web.xml
 ```
<servlet>
   <servlet-name>dispatcher</servlet-name>
    <servlet-class>
       org.springframework.web.servlet.DispatcherServlet
    </servlet-class>
    <init-param>
       <param-name>contextConfigLocation</param-name>
       <param-value>/WEB-INF/servlet.xml</param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>
</servlet>

<servlet-mapping>
    servlet-name>dispatcher</servlet-name>
    <url-pattern>/login/*</url-pattern>
</servlet-mapping>
 ```
- DispatcherServlet needs an Spring Application Context to launch. 

Add Spring Context (/WEB-INF/servlet.xml)
```
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
	                       http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc.xsd
	                       http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd">

    <context:component-scan base-package="com.web" />

    <bean
            class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix">
            <value>/WEB-INF/views/</value>
        </property>
        <property name="suffix">
            <value>.jsp</value>
        </property>
    </bean>

    <mvc:annotation-driven />

</beans>
```
run application
 ```
./mvn tomcat7:run
 ```
