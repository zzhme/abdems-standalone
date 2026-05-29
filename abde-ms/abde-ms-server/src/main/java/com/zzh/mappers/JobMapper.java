package com.zzh.mappers;

import com.zzh.pojo.Job;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface JobMapper {
    @Select("select * from job;")
    List<Job> queryAll();
}
