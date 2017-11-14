package org.obsidian.ceimp.service.impl;

import org.obsidian.ceimp.dao.UserBasicMapper;
import org.obsidian.ceimp.entity.UserBasic;
import org.obsidian.ceimp.entity.UserBasicExample;
import org.obsidian.ceimp.service.UserBasicService;
import org.obsidian.ceimp.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

/**
 * Created by BillChen on 2017/11/13.
 */
@Service
public class UserBasicServiceImpl implements UserBasicService {

    @Autowired
    private UserBasicMapper userBasicMapper;

    @Transactional
    @Override
    public int insertUserBasic(UserBasic userBasic) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        userBasic.setPassword(MD5Util.getInstance().EncoderByMd5(userBasic.getPassword()));
        return userBasicMapper.insertSelective(userBasic);
    }

    @Transactional
    @Override
    public int updateUserBasic(UserBasic userBasic) {
        UserBasicExample example = new UserBasicExample();
        example.or().andUserIdEqualTo(userBasic.getUserId());
        return userBasicMapper.updateByExampleSelective(userBasic,example);
    }

    @Transactional
    @Override
    public int deleteUserBasic(Long userId) {
        UserBasicExample example = new UserBasicExample();
        example.or().andUserIdEqualTo(userId);
        return userBasicMapper.deleteByExample(example);
    }

    @Transactional
    @Override
    public UserBasic selectByUserId(Long userId) {
        UserBasicExample example = new UserBasicExample();
        example.or().andUserIdEqualTo(userId);
        return userBasicMapper.selectByExample(example).get(0);
    }

    @Transactional
    @Override
    public UserBasic selectByAccount(String account) {
        return null;
    }
}