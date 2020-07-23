package com.mvc.cb.biz;

import java.util.List;

import com.mvc.cb.model.dto.MentorReviewDto;

public interface MentorReviewBiz {

	public List<MentorReviewDto> selectList(int mentor_No);

	public MentorReviewDto selectOne(int mentor_No);

	public List<MentorReviewDto> review(int mentor_No);

	public int insert(MentorReviewDto rdto);

}
