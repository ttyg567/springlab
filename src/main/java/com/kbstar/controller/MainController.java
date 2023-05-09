package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.service.CartService;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
public class MainController {

    @Autowired
    CustService custService;
    @Autowired
    CartService cartService;

    @Autowired
    private BCryptPasswordEncoder encoder;

    @RequestMapping("/")
    public String main(){
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model){
        model.addAttribute("center", "login");//{center}에 login을 뿌려줘라.
        return "index";
    }

    @RequestMapping("/pic")
    public String pic(Model model){
        model.addAttribute("center", "pic");
        return "index";
    }


    @RequestMapping("/custinfo")
    public String custinfo(Model model, String id) throws Exception {
        Cust cust = null;
        try {
            cust = custService.get(id);
        } catch (Exception e) {
            throw new Exception("시스템장애 custinfo 호출 오류");
        }
        model.addAttribute("custinfo", cust);//화면에 뿌릴 정보를 준비
        model.addAttribute("center", "custinfo");//화면에 정보를 뿌림
        return "index";
    }
    @RequestMapping("/custinfoimpl")
    public String custinfoimpl(Model model, Cust cust) throws Exception {
        try {
            log.info("===================="+cust.getPwd());
            cust.setPwd(encoder.encode(cust.getPwd()));
            log.info("===================="+cust.getPwd());
            custService.modify(cust);
        } catch (Exception e) {
            throw new Exception("시스템장애 custinfo 호출 오류");
        }
        return "redirect:/custinfo?id="+cust.getId();
    }

    @RequestMapping("/logouts")
    public String logouts(Model model, HttpSession session){
        if(session != null){
            session.invalidate();
        }
        return "index";
    }
    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, String id, String pwd, HttpSession session) throws Exception {
        log.info("--------------------------"+id+" "+pwd);
        Cust cust = null;
        String nextPage = "loginfail";
        try {
            cust = custService.get(id);
            if (cust != null && encoder.matches(pwd,cust.getPwd())){
                nextPage = "loginok";
                session.setMaxInactiveInterval(1000000);
                session.setAttribute("logincust",cust);
                //session에 넣어둔 정보도, model에서 꺼내는 것 처럼 꺼내서 쓸수있다.
            }
        } catch (Exception e) {
            throw new Exception("시스템 장애. 잠시후 다시 로그인 시도하세요. loginimpl");
        }
        model.addAttribute("center", nextPage);//{center}에 login을 뿌려줘라.
        return "index";
    }
    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("center", "register");
        return "index";
    }
    @RequestMapping("/registerimpl")
    public String registerimpl(Model model, Cust cust, HttpSession session) throws Exception {
        try {
            cust.setPwd(encoder.encode(cust.getPwd()));
            custService.register(cust);
            session.setMaxInactiveInterval(1000000);
            session.setAttribute("logincust", cust);
        } catch (Exception e) {
            throw new Exception("시스템에러 : maincontroller registerimpl");
        }
        model.addAttribute("rcust", cust);
        model.addAttribute("center", "registerok");
        return "index";
    }
    // /quics?page=bs01
    @RequestMapping("/quics")
    public String quics(String page){//page선언하지 않고도 이게 돼? 컨테이너에서 해줘
        return page;
    }

    @RequestMapping("/websocket")
    public String websocket(Model model){
        model.addAttribute("center", "websocket");
        return "index";
    }
    @RequestMapping("/delcart")
    public String delcart(Model model, int id, HttpSession session) throws Exception {
        cartService.remove(id);
        if(session != null){
            Cust cust = (Cust) session.getAttribute("logincust");
            return "redirect:/item/allcart?id=" + cust.getId();
        } else {
            return "redirect:/";
        }
    }

}
