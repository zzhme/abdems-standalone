package com.zzh.web.controller;

import com.zzh.pojo.Result;
import com.zzh.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/jobs")
public class JobController {
    @Autowired
    private JobService jobService;


    @GetMapping
    public Result queryAll() {
        return Result.success(jobService.queryAll());
    }
}
