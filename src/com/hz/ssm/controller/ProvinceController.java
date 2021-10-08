package com.hz.ssm.controller;


import com.google.gson.Gson;
import com.hz.ssm.pojo.Province;
import com.hz.ssm.service.PrivoniceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.List;

@Controller
@RequestMapping("/province")
public class ProvinceController {
    //注入service
    @Autowired
    private PrivoniceService privoniceService;

    //注入jedis
    @Autowired
    private JedisPool jedisPool;

    @ResponseBody
    @RequestMapping("/loadAll")
    public String/*List<Province>*/ loadAll(){
        //从jiedisPool中获取jedis
        Jedis jedis = jedisPool.getResource();
        //第一次 从redis中获取数据 为空null
        String provinceData = jedis.get("provinceListInfo") ;
        //如果为空，查询数据库
        if(provinceData == null){
            //去关系型数据库中获取数据
            List<Province> prolist = privoniceService.loadAllService();
            //创建json的转换工具
            Gson gson = new Gson();
            //把转换后的数据重新设置到provinceData
            String jsonValue = gson.toJson(prolist);
            //把查询的数据设置
            jedis.set("provinceListInfo",provinceData);
        };

        /*List<Province> provinceList =privoniceService.loadAllService();*/
        return provinceData/*provinceList*/;
    }

}
