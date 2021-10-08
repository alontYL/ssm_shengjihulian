package com.hz.ssm.service;

import com.hz.ssm.controller.ProvinceController;
import com.hz.ssm.dao.ProvinceMapper;
import com.hz.ssm.pojo.Province;
import com.hz.ssm.pojo.ProvinceExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PrivoniceServiceImpl implements PrivoniceService{

    @Autowired
    private ProvinceMapper provinceMapper;

    @Override
    public List<Province> loadAllService() {
        ProvinceExample provinceExample = new ProvinceExample();
        ProvinceExample.Criteria criteria = provinceExample.createCriteria();
        List<Province> provinces = provinceMapper.selectByExample(provinceExample);
        System.out.println(provinces);
        return provinces;
    }
}
