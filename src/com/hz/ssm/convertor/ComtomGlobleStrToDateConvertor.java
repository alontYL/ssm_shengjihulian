package com.hz.ssm.convertor;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/*自定义str转日期的转换类
    S source 源数据
    T target 目标
 */
public class ComtomGlobleStrToDateConvertor implements Converter<String, Date> {
    @Override
    public Date convert(String source) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat();

        try {
            if(source != null && source.length()>0){
             return simpleDateFormat.parse(source);
            }

        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}
