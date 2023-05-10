package com.kbstar;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Slf4j
@SpringBootTest
class Web13ApplicationTests {

    @Autowired
    private BCryptPasswordEncoder encoder;
    //pom.xml에 시큐리티 라이브러리를 넣어놨음.

    @Test
    void contextLoads() {
        String rawPassword = "pwd01";
        String encPassword = encoder.encode(rawPassword);
        log.info("-------------------------------------------------------------------------------");
        log.info(rawPassword);
        log.info("암호화 된 비번" + encPassword);
        boolean result = encoder.matches(rawPassword,encPassword);
        log.info(result+"");
    }
}
