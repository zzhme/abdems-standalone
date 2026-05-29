package com.zzh.service;

import com.zzh.pojo.Job;

import java.util.List;

public interface JobService {
    /**
     * 多条件分页查询
     */
    List<Job> queryAll();
}