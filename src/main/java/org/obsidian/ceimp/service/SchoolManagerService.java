package org.obsidian.ceimp.service;

import org.obsidian.ceimp.entity.SchoolManager;

import java.util.List;

/**
 * Created by BillChen on 2017/8/13.
 */
public interface SchoolManagerService {

    int insertSchoolManager(String schoolManagerId,String password,int schoolId);

    int updateSchoolManager(String schoolManagerId,String password,int schoolId);

    int deleteSchoolManager(String schoolManagerId);

    SchoolManager selectBySchoolManagerId(String schoolManagerId);

    List<SchoolManager> selectAllBySchoolId(int schoolId);
}
