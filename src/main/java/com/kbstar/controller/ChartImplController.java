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
        // {'category':[], 'datas':[]}
        JSONObject jo = new JSONObject();

        JSONArray jaCnt = new JSONArray();
        for(int i=0; i<=12; i++){
            Random r = new Random();
            int cnt = r.nextInt(10000)+1;
            jaCnt.add(cnt);
        }
        JSONArray jaYear = new JSONArray();
        for(int i=2011; i<=2023; i++){
            jaYear.add(i);
        }

        jo.put("category", jaYear);
        jo.put("datas", jaCnt);

        return jo;
    }

    @RequestMapping("/chart0301")
    public Object chart0301(){
        // [ [], [] ,,, ] - 배열 안에 배열이 있는 구조
        JSONArray ja = new JSONArray();
        for(int i = 1; i<=5; i++){
            Random r = new Random();
            int num = r.nextInt(20)+1;
            JSONArray jadata = new JSONArray();
            jadata.add("data:"+num);
            jadata.add(num);
            ja.add(jadata);
        }
        return ja;

    }

    @RequestMapping("/chart0302")
    public Object chart0302(){
        // {'weight':[], 'BMI':[]}
        JSONObject jo = new JSONObject();

        JSONArray jaWeight = new JSONArray();
        for(int i=0; i<=4; i++){
            Random r = new Random();
            int weight = r.nextInt(100)+1;
            jaWeight.add(weight);
        }
        JSONArray jaBmi = new JSONArray();
        for(int i=0; i<=4; i++){
            Random r = new Random();
            int bmi = r.nextInt(30)+1;
            jaBmi.add(bmi);
        }

        jo.put("weight", jaWeight);
        jo.put("bmi", jaBmi);

        return jo;
    }

    @RequestMapping("/chart0303")
    public Object chart0303(){
        // [ [], [] ,,, ] - 배열 안에 배열이 있는 구조
        JSONArray ja = new JSONArray();
        for(int i = 1; i<=5; i++){
            Random r = new Random();
            int num = r.nextInt(20)+1;
            JSONArray jadata = new JSONArray();
            jadata.add("data:"+num);
            jadata.add(num);
            ja.add(jadata);
        }
        return ja;

    }

    @RequestMapping("/chart05")
    public Object chart05(String year){
        JSONArray ja = new JSONArray();
        for(int i=1; i<=12; i++){
            Random r = new Random();
            int num = r.nextInt(100)+1;
            ja.add(num);
        }
        return ja;
    };
}
