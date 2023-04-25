package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.dto.Marker;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

// 일반적인 컨트롤러는 화면을 리턴시키므로, 서버 시간만 가져오는 컨트롤러를 새로 만들어준 것
@RestController
public class AjaxImplController {
    @RequestMapping("/getservertime")
    public Object getservertime(){
      Date date = new Date();
      return date;
    };

    @RequestMapping("/getdata")
    // DB에 있는 데이터를 json 으로 바꿔서 보냄
    public Object getdata(){
        List<Cust> list = new ArrayList<>();
        list.add(new Cust("id01", "pwd01", "james1"));
        list.add(new Cust("id02", "pwd02", "james2"));
        list.add(new Cust("id03", "pwd03", "james3"));
        list.add(new Cust("id04", "pwd04", "james4"));
        list.add(new Cust("id05", "pwd05", "james5"));

        // Java Object --> JSON
        // JSON(JavaScript Object Notation
        // [{}, {}, {}, ...]
        JSONArray ja = new JSONArray();
        for(Cust obj:list){
            JSONObject jo = new JSONObject();
            Random r = new Random();
            int i = r.nextInt(100)+1;
            jo.put("id", obj.getId());
            jo.put("pwd", obj.getPwd());
            jo.put("name", obj.getName()+i);
            ja.add(jo);
        }
        return ja;
    };

    @RequestMapping("/checkid")
    public Object checkid(String id){
        int result = 0;
        if(id.equals("qqqq")||id.equals("aaaa")||id.equals("ssss")){
            result = 1;
        }
        return result;
    };

    @RequestMapping("/markers")
    public Object markers(String loc){
        List<Marker> list = new ArrayList<>();
        if(loc.equals("s")){
            list.add(new Marker(100, "국밥", "http://www.nate.com", 37.5648049, 126.9753461, "a.jpg", "s"));
            list.add(new Marker(101, "삼겹살", "http://www.nate.com", 37.5628149, 126.9741461, "b.jpg", "s"));
            list.add(new Marker(102, "삼계탕", "http://www.nate.com", 37.5637049, 126.9736461, "c.jpg", "s"));
        }else if(loc.equals("b")){
            list.add(new Marker(103, "국밥", "http://www.nate.com", 35.2111142, 129.0678702, "a.jpg", "b"));
            list.add(new Marker(104, "삼겹살", "http://www.nate.com", 35.2145142, 129.0656702, "b.jpg", "b"));
            list.add(new Marker(105, "삼계탕", "http://www.nate.com", 35.2143442, 129.0678702, "c.jpg", "b"));
        }else if(loc.equals("j")){
            list.add(new Marker(106, "국밥", "http://www.nate.com", 33.3644666, 126.5244666, "a.jpg", "j"));
            list.add(new Marker(107, "삼겹살", "http://www.nate.com", 33.3647866, 126.5222666, "b.jpg", "j"));
            list.add(new Marker(108, "삼계탕", "http://www.nate.com", 33.3623666, 126.5297166, "c.jpg", "j"));
        }

        JSONArray ja = new JSONArray();
        for(Marker obj:list){
            JSONObject jo = new JSONObject();
            jo.put("id", obj.getId());
            jo.put("title", obj.getTitle());
            jo.put("target", obj.getTarget());
            jo.put("lat", obj.getLat());
            jo.put("lng", obj.getLng());
            jo.put("img", obj.getImg());
            jo.put("loc", obj.getLoc());
            ja.add(jo);
        }
        return ja;
    };
}
