package com.kbstar.controller;

import com.kbstar.dto.Item;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/item")
public class ItemController {
    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());

    String dir = "item/";
    // 위에 /cust 이므로, "" 이렇게만 쳤을 때 127.0.0.1/cust 가 된다
    @RequestMapping("")
    public String main(Model model) {
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"center");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"add");
        return "index";
    }

    @RequestMapping("/all")
    public String all(Model model) {
        List<Item> list = new ArrayList<>();
        list.add(new Item(100, "감자깡", 1000, "a.jpg", new Date()));
        list.add(new Item(101, "새우깡", 2000, "b.jpg", new Date()));
        list.add(new Item(102, "바나나킥", 3000, "c.jpg", new Date()));
        list.add(new Item(103, "양파깡", 4000, "d.jpg", new Date()));
        list.add(new Item(104, "포스틱", 5000, "e.jpg", new Date()));
        model.addAttribute("allitem", list);
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"all");
        return "index";
    }

}