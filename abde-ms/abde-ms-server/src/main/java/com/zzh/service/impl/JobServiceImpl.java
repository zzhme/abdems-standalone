package com.zzh.service.impl;

import com.zzh.mappers.JobMapper;
import com.zzh.pojo.Job;
import com.zzh.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.TimeUnit;

@Service
public class JobServiceImpl implements JobService {
    @Autowired
    private JobMapper jobMapper;
    @Autowired
    private RedisTemplate<String,Object> redisTemplate;

    public final String ALL_JOB = "job:all";

    /**
     * 多条件分页查询
     */
    @Override
    public List<Job> queryAll() {
        //查redis缓存
        ValueOperations<String, Object> ops = redisTemplate.opsForValue();
        List<Job> jobList = (List<Job>) ops.get(ALL_JOB);
        //缓存命中
        if (jobList != null && !jobList.isEmpty()) {
            return jobList;
        }
        //未命中
        jobList = jobMapper.queryAll();
        ops.set(ALL_JOB,jobList,60L, TimeUnit.SECONDS);

        return jobList;
    }
}
