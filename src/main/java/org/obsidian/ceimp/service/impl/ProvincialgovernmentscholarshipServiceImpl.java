package org.obsidian.ceimp.service.impl;

import org.obsidian.ceimp.dao.ProvincialgovernmentscholarshipMapper;
import org.obsidian.ceimp.entity.Provincialgovernmentscholarship;
import org.obsidian.ceimp.entity.ProvincialgovernmentscholarshipExample;
import org.obsidian.ceimp.service.ProvincialgovernmentscholarshipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by BillChen on 2017/10/14.
 */
@Service
public class ProvincialgovernmentscholarshipServiceImpl implements ProvincialgovernmentscholarshipService {

    @Autowired
    private ProvincialgovernmentscholarshipMapper provincialgovernmentscholarshipMapper;

    @Transactional
    @Override
    public int insertProvincialgovernmentscholarship(String userId, String date1, String award1, String unit1, String date2, String award2, String unit2, String date3, String award3, String unit3, String date4, String award4, String unit4, String applyReason, String recommendReason, String opinion) {
        return 0;
    }

    @Transactional
    @Override
    public int updateProvincialgovernmentscholarship(String userId, String date1, String award1, String unit1, String date2, String award2, String unit2, String date3, String award3, String unit3, String date4, String award4, String unit4, String applyReason, String recommendReason, String opinion) {
        return 0;
    }

    @Transactional
    @Override
    public int deleteProvincialgovernmentscholarship(String userId) {
        return 0;
    }

    @Transactional
    @Override
    public Provincialgovernmentscholarship selectByUserId(String userId) {
        ProvincialgovernmentscholarshipExample example = new ProvincialgovernmentscholarshipExample();
        example.or().andUseridEqualTo(userId);
        List<Provincialgovernmentscholarship> list = provincialgovernmentscholarshipMapper.selectByExample(example);
        if(list.isEmpty()){
            return null;
        }
        return list.get(0);
    }
}
