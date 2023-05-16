package com.kbstar.ncp;

import com.kbstar.util.OCR2Util;
import com.kbstar.util.OCRUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.Map;

@Slf4j
@SpringBootTest
class OCRTest {


    @Value("${uploadimgdir}")
    String imgpath;

    @Test
    void contextLoads() {
        JSONObject jo = null;
        jo = (JSONObject) OCR2Util.getResult(imgpath, "ocrtest2.png");
        //log.info(jo.toJSONString());
        Map map = OCR2Util.getData(jo);
        log.info(map.values().toString());
    }
}
