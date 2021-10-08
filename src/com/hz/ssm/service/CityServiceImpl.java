package com.hz.ssm.service;

import com.hz.ssm.dao.CityMapper;
import com.hz.ssm.pojo.City;
import com.hz.ssm.pojo.CityExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CityServiceImpl implements CityService  {

    @Autowired
    private CityMapper cityMapper;

    @Override
    public List<City> cityAllService(Integer cityId) {
        CityExample cityExample = new CityExample();
        CityExample.Criteria criteria = cityExample.createCriteria();
        //添加省份Id值作为查询的条件
        criteria.andProvinceidEqualTo(cityId);
        List<City> cityList = cityMapper.selectByExample(cityExample);
        System.out.println("huahuahuauhuahuhhuhuhua");
        return cityList;
    }
}
