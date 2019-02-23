package com.jhta.cope.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.jhta.cope.vo.Avatar;
import com.jhta.cope.vo.Badge;
import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.Follow;
import com.jhta.cope.vo.LectureHistory;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.User;
@Transactional
public interface UserService {

	public void insertUser(User user)throws Exception;
	public void insertUser(User user, String string)throws Exception;
	public void insertAvatar(String userId);
	public List<Follow> getMyFollowingById(String userId);
	public List<Follow> getFriends(String userId);
	public List<Follow> getFriendRequest(String userId);
	public List<Follow> getFollowMe(String userId);
	public Follow myFollowChecking(Follow follow);
	public List<Badge> notHaveBadge(int userNo);
	public List<Badge> haveBadge(int userNo);
	public User getUserById(String userId);
	public User userAuth(Map<String, Object> map);
	public User getUserByEmail(String userEmail);
	public void insertUserBadge(int userNo,int badgeNo);
	public void insertFollow(Follow follow);
	public void updateAvatar(Avatar avatar);
	public void deleteFollow(Follow follow);
	public List<LectureHistory> getLectureHistoryByCriteria(Criteria criteria);
	public Integer checkTheFirstLecture(int UserNo,int detailNo);
	public List<PaidLecture> getPaidLectureByRank(String keyword);
	public List<PaidLecture> getMyComplateLectureByUserNo(int userNo);
	public int getHistoryCountByUserNo(int no);
	public Map<String, Integer> CheckUserBadgeByUserNoAndBadgeNo(int userNo,int badgeNo);
	public Map<String,Integer> completionCheckMyLecture(int userNo,int lectureNo);
}
