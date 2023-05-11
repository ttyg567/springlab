package com.kbstar.controller;
//일반적인 controller는 요청이 들어오면 화면이 리턴됨.
//여기서는 부분만 바꿔주기 위해 따로 컨트롤러를 만듦.

import com.kbstar.dto.Cart;
import com.kbstar.dto.Cust;
import com.kbstar.dto.Item;
import com.kbstar.dto.Marker;
import com.kbstar.service.CartService;
import com.kbstar.service.CustService;
import com.kbstar.service.MarkerService;
import com.kbstar.util.FileUploadUtil;
import com.kbstar.util.WeatherUtil;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@RestController
public class AjaxImplController {

    @Autowired
    MarkerService markerService;
    @Autowired
    CustService custService;
    @Autowired
    CartService cartService;

    @Value("${uploadimgdir}")
    String imgdir;

    @RequestMapping("/saveimg")
    public String saveimg(MultipartFile file){
        String filename = file.getOriginalFilename();
        FileUploadUtil.saveFile(file, imgdir);
        return filename;
    }

    @RequestMapping("/getservertime")
    public Object getservertime(){
        Date date = new Date();
        return date;
    }
    @RequestMapping("/checkid")
    public Object checkid(String id) throws Exception {
        int result = 0;//중복 아니면 0 보낸다고 가정
        Cust cust = null;
        cust = custService.get(id);
        if(cust != null){
            result = 1;
        }
        return result;
    }
    @RequestMapping("/getdata")//db에 있는 데이터를 가져와서 json으로 바꿔서 보내줄것.
    public Object getdata(){
        List<Cust> list = new ArrayList<>();
        list.add(new Cust("id01","pwd01","james1"));
        list.add(new Cust("id02","pwd02","james2"));
        list.add(new Cust("id03","pwd03","james3"));
        list.add(new Cust("id04","pwd04","james4"));
        list.add(new Cust("id05","pwd05","james5"));

        //Java Object --------> JSON
        //JSON(JavaScript Object Notation)//자바스크립트로 오브젝트를 표현하는 방식
        //[{},{},{},...]
        JSONArray ja = new JSONArray();
        for(Cust obj:list){
            JSONObject jo = new JSONObject();
            Random r = new Random();
            int i = r.nextInt(100) +1 ;
            jo.put("id",obj.getId());
            jo.put("pwd",obj.getPwd());
            jo.put("name",obj.getName()+i);
            ja.add(jo);
        }
        return ja;
    }
    @RequestMapping("/markers")
    public Object markers(String loc) throws Exception {
        List<Marker> list = null;
        try {
            list = markerService.getLoc(loc);
        } catch (Exception e) {
            throw new Exception("시스템에러 : ER0003 : ajaximplcontroller에서 작성됨");
        }

        JSONArray ja = new JSONArray();
        for (Marker obj:list) {
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
    }

    @RequestMapping("/addcart")
    public Object addcart(Cart cart) throws Exception {
        cartService.register(cart);
        return "";
    }

    @RequestMapping("/weather2")
    public Object weather2() throws Exception {
        return WeatherUtil.getWeather3("108");
    }



}
