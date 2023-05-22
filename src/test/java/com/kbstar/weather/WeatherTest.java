package com.kbstar.weather;

import com.kbstar.util.WeatherUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Calendar;

@Slf4j
@SpringBootTest
class  Weathertest {
    @Test
    void contextLoads() throws Exception {
        JSONObject result = null;
        result = (JSONObject)WeatherUtil.getWeather3("108");
        log.info(result.toJSONString());

    }
}