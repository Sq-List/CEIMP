package org.obsidian.ceimp.entity;

import org.obsidian.ceimp.util.TimeUtil;

public class ReviewTime {
    private Integer reviewTimeId;

    private Integer reviewStart;

    private Integer reviewEnd;

    private Integer reviewTypeId;

    private Long createTime;

    @Override
    public String toString() {
        return "ReviewTime{" +
                "reviewTimeId=" + reviewTimeId +
                ", reviewStart=" + reviewStart +
                ", reviewEnd=" + reviewEnd +
                ", reviewTypeId=" + reviewTypeId +
                ", createTime=" + TimeUtil.getInstance().getTime(createTime) +
                '}';
    }

    public ReviewTime() {
        this.createTime = TimeUtil.getInstance().getTimeStamp();
    }

    public ReviewTime(Integer reviewTimeId, Integer reviewStart, Integer reviewEnd, Integer reviewTypeId) {
        this.reviewTimeId = reviewTimeId;
        this.reviewStart = reviewStart;
        this.reviewEnd = reviewEnd;
        this.reviewTypeId = reviewTypeId;
        this.createTime = TimeUtil.getInstance().getTimeStamp();
    }

    public Integer getReviewTimeId() {
        return reviewTimeId;
    }

    public void setReviewTimeId(Integer reviewTimeId) {
        this.reviewTimeId = reviewTimeId;
    }

    public Integer getReviewStart() {
        return reviewStart;
    }

    public void setReviewStart(Integer reviewStart) {
        this.reviewStart = reviewStart;
    }

    public Integer getReviewEnd() {
        return reviewEnd;
    }

    public void setReviewEnd(Integer reviewEnd) {
        this.reviewEnd = reviewEnd;
    }

    public Integer getReviewTypeId() {
        return reviewTypeId;
    }

    public void setReviewTypeId(Integer reviewTypeId) {
        this.reviewTypeId = reviewTypeId;
    }

    public Long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Long createTime) {
        this.createTime = createTime;
    }
}