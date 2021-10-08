package com.hz.ssm.controller;

import com.hz.ssm.pojo.City;
import com.hz.ssm.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.List;

@Controller
@RequestMapping("/city")
public class CityController {
    //注入service
    @Autowired
    private CityService cityService;
    //注入jedis
    @Autowired
    private JedisPool jedisPool;

    //加载省份信息
    @ResponseBody
    @RequestMapping("/cityAllController")
    public  List<City> cityAllController(Integer cityId){

        List<City> cityList = cityService.cityAllService(cityId);
        return cityList;
    }
}
