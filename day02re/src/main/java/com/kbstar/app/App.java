package com.kbstar.app;

import com.kbstar.frame.*;
import com.kbstar.tv.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
    public static void main(String[] args) {
        ApplicationContext factory =
                new ClassPathXmlApplicationContext("spring.xml");

        TV tv=(TV) factory.getBean("stv");
        // new 로 객체 생성 없이 컨테이너를 통해 조종?함
        // TV tv1 = new STV(); -> 이렇게 안해도 됨
        tv.turnOn();

    }
}
