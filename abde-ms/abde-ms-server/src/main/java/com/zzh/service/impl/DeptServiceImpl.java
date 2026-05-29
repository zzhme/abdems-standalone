package com.zzh.service.impl;

import com.zzh.mappers.DeptMapper;
import com.zzh.pojo.Dept;
import com.zzh.service.DeptService;
import com.zzh.web.exception.DeptException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * 部门管理业务层接口实现类
 */
@Service
public class DeptServiceImpl implements DeptService {
    @Autowired
    private DeptMapper deptMapper;
    @Autowired
    private RedisTemplate<String,Object> redisTemplate;
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    public final String ALL_DEPT_KEY = "dept:all";

    /**
     * 查询所有
     *
     * @return
     */
    @Override
    public List<Dept> selectAll() {
        ValueOperations<String, Object> ops = redisTemplate.opsForValue();
        List<Dept> deptList = (List<Dept>) ops.get(ALL_DEPT_KEY);
        if (deptList!=null && !deptList.isEmpty()) {
            return deptList;
        }
        //调用持久层接口方法
        deptList = deptMapper.selectAll();
        if (deptList!=null && !deptList.isEmpty()) {
            ops.set(ALL_DEPT_KEY,deptList, 60L, TimeUnit.SECONDS);
        }
        return deptList;
    }

    /**
     * 新增
     *
     * @param dept
     */
    @Override
    //控制事务
    @Transactional
    public void insert(Dept dept) {
        // 数据校验
        if (dept == null) {
            throw new DeptException("新增部门错误！\n数据不能为空！");
        }
        // 获取部门名称
        String name = dept.getName();
        if (name == null || name.trim().isEmpty()) {
            throw new DeptException("新增部门错误！\n部门名称不能为空！");
        }
        Dept existedDept = deptMapper.selectByName(name);
        if (existedDept != null) {
            throw new DeptException("新增部门错误！\n部门名称已存在！");
        }

        LocalDateTime now = LocalDateTime.now();
        //设置创建时间
        dept.setCreateTime(now);
        //设置修改时间
        dept.setUpdateTime(now);
        //调用持久层接口方法
        deptMapper.insert(dept);
        //删除缓存
        redisTemplate.delete(ALL_DEPT_KEY);
    }

    /**
     * 根据id查询
     *
     * @param id
     * @return
     */
    @Override
    public Dept selectById(Integer id) {
        //调用持久层接口方法
        Dept dept = deptMapper.selectById(id);
        return dept;
    }



    /**
     * 根据id修改
     *
     * @param dept
     */
    @Override
    @Transactional
    public void update(Dept dept) {
        //设置修改时间
        dept.setUpdateTime(LocalDateTime.now());
        //调用持久层接口方法
        deptMapper.update(dept);
        //删除缓存
        redisTemplate.delete(ALL_DEPT_KEY);
    }

    /**
     * 根据id删除
     *
     * @param id
     */
    @Override
    @Transactional
    public void deleteById(Integer id) {
        deptMapper.deleteById(id);
        //删除缓存
        redisTemplate.delete(ALL_DEPT_KEY);
    }
}
