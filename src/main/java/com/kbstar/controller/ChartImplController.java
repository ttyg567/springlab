package com.kbstar.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@RestController
public class ChartImplController {
    @RequestMapping("/chart02")
    public Object chart02(){
        //[456,456,45,54,2,4,23] 이번엔 이렇게 생김
        //[{},{},{},{}, ...] 이렇게 생기면 얘기가 달라.
        //{category : [], ;datas : []} 두개의 배열을 만들어서 객체로 만들어 보낼것이다.
        JSONObject jo = new JSONObject();

        JSONArray jaCnt = new JSONArray();
        for(int i = 1 ; i <= 12 ; i++){
            Random r = new Random();
            int cnt = r.nextInt(100) + 1;
            jaCnt.add(cnt);
        }
        JSONArray jaYear = new JSONArray();
        for(int i = 2011; i <= 2022 ; i++){
            jaYear.add(i);
        }
        jo.put("category", jaYear);
        jo.put("datas" , jaCnt);
        return jo;
    }

    @RequestMapping("/chart0301")
    public Object chart0301(){
        //[[],[],...]로 데이터를 보내야 한다.
        JSONArray ja = new JSONArray();
        for (int i = 1; i <= 5; i++){
            Random r = new Random();
            int num = r.nextInt(20) + 1;
            JSONArray jadata = new JSONArray();
            jadata.add("data" + num);//이름인데 임의로 지정한 것.
            jadata.add(num);
            ja.add(jadata);
        }
        return ja;
    }
    @RequestMapping("/chart0302")
    public Object chart0302(){
        //[[],[],...]로 데이터를 보내야 한다.
        JSONArray ja = new JSONArray();
        for (int i = 0; i <= 50; i++){
            Random r = new Random();
            int num1= r.nextInt(10) ;
            int num2= r.nextInt(10) ;
            int num3= r.nextInt(10) ;
            JSONArray jadata = new JSONArray();
            jadata.add(num1);
            jadata.add(num2);
            jadata.add(num3);
            ja.add(jadata);
        }
        return ja;
    }
    @RequestMapping("/chart0303")
    public Object chart0303(){
        //[, , , ,]로 데이터를 보내야 한다.
        JSONObject jo = new JSONObject();
        JSONArray jaCategory = new JSONArray();
        JSONArray jadata = new JSONArray();
        for (int i = 0; i < 12; i++){
            Random r = new Random();
            int num= r.nextInt(10000) + 1000 ;
            jaCategory.add("data" + num);
            jadata.add(num);
        }
        jo.put("category", jaCategory);
        jo.put("data", jadata);
        return jo;
    }
    @RequestMapping("/chart0304")
    public Object chart0304(){
        //[, , , ,]로 데이터를 보내야 한다.
        JSONObject jo = new JSONObject();
        JSONArray ja1 = new JSONArray();
        JSONArray ja2 = new JSONArray();
        JSONArray ja3 = new JSONArray();
        for (int i = 0; i < 12; i++){
            Random r = new Random();
            int num= r.nextInt(10000) + 1000 ;
            JSONArray ja0 = new JSONArray();
            ja0.add("data" + num);
            ja0.add(num);
            ja1.add(ja0);
        }
        for (int i = 0; i < 12; i++){
            Random r = new Random();
            int num= r.nextInt(10000) + 1000 ;
            JSONArray ja0 = new JSONArray();
            ja0.add("data" + num);
            ja0.add(num);
            ja2.add(ja0);
        }
        for (int i = 0; i < 12; i++){
            Random r = new Random();
            int num= r.nextInt(10000) + 1000 ;
            JSONArray ja0 = new JSONArray();
            ja0.add("data" + num);
            ja0.add(num);
            ja3.add(ja0);
        }
        jo.put("ja1", ja1);
        jo.put("ja2", ja2);
        jo.put("ja3", ja3);
        return jo;
    }
    @RequestMapping("/chart05")
    public Object chart05(String year){
        JSONArray ja = new JSONArray();
        for (int i = 0; i < 12; i++){
            Random r = new Random();
            int num = r.nextInt(100)+1;
            ja.add(num);
        }
        return ja;

//        JSONArray ja = new JSONArray();
//        //select * from * where year = inputyear //실제 DB에서 데이터를 가져온다 하면 이렇게 쿼리문을 쓴다.
//        return ja;
    }
}
