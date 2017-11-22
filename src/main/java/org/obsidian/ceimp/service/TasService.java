package org.obsidian.ceimp.service;

import org.obsidian.ceimp.bean.TasBean;
import org.obsidian.ceimp.entity.Tas;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by BillChen on 2017/11/18.
 */
public interface TasService {
    Tas selectByUserIdAndYearScope(Long userId, Integer yearScope);

    TasBean getTasBeanByUserIdAndYearScope(Long userId, Integer yearScope);

    int insertTas(Long userId,Integer yearScope,TasBean tasBean);

    int updateTas(Long userId,Integer yearScope,TasBean tasBean);

    void getTasWord(TasBean tasBean, HttpServletResponse response) throws IOException;
}
