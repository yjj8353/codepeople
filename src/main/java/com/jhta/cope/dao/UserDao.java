package com.jhta.cope.dao;

import java.util.List;
import java.util.Map;

import com.jhta.cope.vo.Avatar;
import com.jhta.cope.vo.Badge;
import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.Follow;
import com.jhta.cope.vo.LectureHistory;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.User;

public interface UserDao {
	public User getUserByNo(int userNo);
	public User getUserById(String userId);
	public User getUserByEmail(String userEmail);
	public List<Follow> getMyFollowingById(String userId);
	public List<Follow> getFriends(String userId);
	public List<Follow> getFriendRequest(String userId);
	public List<Follow> getFollowMe(String userId);
	public Follow myFollowChecking(Follow follow);
	public List<Badge> notHaveBadge(int userNo);
	public List<Badge> haveBadge(int userNo);
	public Badge getBadgeByNo(int badgeNo);
	public void insertUser(User user);
	public void insertAvatar(Avatar avatar);
	public void insertUserAuth(Map<String, Object> map);
	public void insertUserBadge(Map<String, Object> map);
	public void insertFollow(Follow follow);
	public void userAuth(Map<String, Object> map);
	public void updateUser(User user);
	public void updateAvatar(Avatar avatar);
	public void deleteFollow(Follow follow);
	public List<LectureHistory> getLectureHistoryByCriteria(Criteria criteria);
	public Integer checkTheFirstLecture(Map<String, Integer> map);
	public List<PaidLecture> getPaidLectureByRank(Map<String, String> map);
	public List<PaidLecture> getMyComplateLectureByUserNo(int userNo);
	public int getHistoryCountByUserNo(int no);
	public Map<String, Integer> CheckUserBadgeByUserNoAndBadgeNo(Map<String, Integer> map);
	public Map<String, Integer> completionCheckMyLecture(Map<String, Integer> map);
}
