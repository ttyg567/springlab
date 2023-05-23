package com.kbstar.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.kbstar.dto.Cust;
import com.kbstar.dto.Item;
import com.kbstar.frame.KBMapper;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.CustMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

//컨테이너 위에서 동작시키게 하기 위해서, 어노테이션에 이름을 부여함.
@Service
@Slf4j
public class CustService implements KBService<String, Cust> {
    @Autowired
    CustMapper mapper;

    @Override
    public void register(Cust cust) throws Exception {
        mapper.insert(cust);
        log.info("send mail........."+cust.getId());
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Cust cust) throws Exception {
        mapper.update(cust);
    }

    @Override
    public Cust get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Cust> get() throws Exception {
        return mapper.selectall();
    }
    public Page<Cust> getPage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 2); // 3: 한화면에 출력되는 개수
        return mapper.getpage();
    }
}
