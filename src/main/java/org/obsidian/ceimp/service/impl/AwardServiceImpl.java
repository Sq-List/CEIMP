package org.obsidian.ceimp.service.impl;

import org.obsidian.ceimp.bean.AwardBean;
import org.obsidian.ceimp.bean.ScholarshipFormBean;
import org.obsidian.ceimp.dao.AwardMapper;
import org.obsidian.ceimp.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by BillChen on 2017/11/14.
 */
@Service
public class AwardServiceImpl implements AwardService {

    @Autowired
    private AwardMapper awardMapper;

    @Transactional
    @Override
    public List<AwardBean> selectAllByUserIdAndYearScope(Long userId, Integer yearScope) {
        return awardMapper.selectAllByUserIdAndYearScope(userId,yearScope);
    }

    @Transactional
    @Override
    public List<ScholarshipFormBean> selectAllBySubNameAndYearScope(String subName, Integer yearScope,String grade) {
        return awardMapper.selectAllBySubNameAndYearScope(subName,yearScope,grade);
    }

    @Transactional
    @Override
    public Long selectAwardIdByUserIdSubNameAndYearScope(Long userId,String subName, Integer yearScope) {
        return awardMapper.selectAwardIdByUserIdSubNameAndYearScope(userId,subName,yearScope);
    }

    @Transactional
    @Override
    public int updateIsFilledByUserIdAndYearScopeAndSubName(Long userId, Integer yearScope,String subName) {
        return awardMapper.updateIsFilledByUserIdAndYearScopeAndSubName(userId,yearScope,subName);
    }
}
