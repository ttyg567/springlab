package com.kbstar.Cust;
import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Cust;
import com.kbstar.dto.Item;
import com.kbstar.service.CustService;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class SelectPageTest {
    @Autowired
    CustService service;

    @Test
    void contextLoads(){
        PageInfo<Cust> pageInfo;
        try {
            pageInfo = new PageInfo<>(service.getPage(1), 5); // 5:하단 네비게이션 개수
        } catch (Exception e) {
            log.info("에러...");
            e.printStackTrace();
        }
    }
}
