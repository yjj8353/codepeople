package com.jhta.cope.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.UserDao;
import com.jhta.cope.handler.MailHandler;
import com.jhta.cope.vo.Avatar;
import com.jhta.cope.vo.Badge;
import com.jhta.cope.vo.BuyLecture;
import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.Follow;
import com.jhta.cope.vo.LectureHistory;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.TempKey;
import com.jhta.cope.vo.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	@Inject
	JavaMailSender mailSender;
	@Autowired
	PaidLectureService paidLectureService;
	
	@Override
	public void insertUser(User user) throws Exception {

		userDao.insertUser(user);

		User getUser = userDao.getUserByEmail(user.getEmail());
		if (getUser != null) {
			Map<String, Object> map = new HashMap<>();
			String key = new TempKey().getKey(false, 50);
			map.put("email", user.getEmail());
			map.put("key", key);
			MailHandler mailHandler = new MailHandler(mailSender);
			mailHandler.setFrom("ssg3799@gmail.com", "CodePeople");
			mailHandler.setSubject("[CodePeople 이메일 인증]");
			mailHandler.setText(new StringBuffer().append("<h1>메일인증</h1>")
					.append("<a href='http://www.codepeople.com/login/emailConfirm.do?userEmail=").append(user.getEmail())
					.append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
			mailHandler.setTo(user.getEmail());
			mailHandler.send();

			this.insertAvatar(user.getId());
			this.insertUserBadge(user.getNo(), 0);
			userDao.insertUserAuth(map);
		}
	}

	public void insertUser(User user, String from) throws Exception {
		User confirmUser = userDao.getUserById(user.getId());
		if (confirmUser == null) {
			userDao.insertUser(user);
			this.insertAvatar(user.getId());
			this.insertUserBadge(user.getNo(), 0);
		}
	}

	@Override
	public void insertAvatar(String userId) {
		User user = userDao.getUserById(userId);
		if (user != null) {
			Avatar avatar = new Avatar();
			avatar.setUserNo(user.getNo());
			avatar.setNick(user.getName());
			avatar.setBgImg("Default");
			avatar.setImage("Default");
			userDao.insertAvatar(avatar);
		}
	}

	@Override
	public User getUserById(String userId) {
		return userDao.getUserById(userId);
	}

	@Override
	public User getUserByEmail(String userEmail) {
		return userDao.getUserByEmail(userEmail);
	}

	@Override
	public User userAuth(Map<String, Object> map) {
		User user = userDao.getUserByEmail((String) map.get("email"));
		if (user != null) {
			userDao.userAuth(map);
		} else {
			user = null;
		}
		return user;
	}

	@Override
	public List<Badge> notHaveBadge(int userNo) {
		return userDao.notHaveBadge(userNo);
	}

	@Override
	public List<Badge> haveBadge(int userNo) {
		return userDao.haveBadge(userNo);
	}

	@Override
	public void insertUserBadge(int userNo, int badgeNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("badgeNo", badgeNo);
		User user = userDao.getUserByNo(userNo);
		Badge badge = userDao.getBadgeByNo(badgeNo);
		Avatar avatar = user.getAvatar();
		avatar.setExp(badge.getExp());
		this.updateAvatar(avatar);
		userDao.insertUserBadge(map);
	}

	@Override
	public void updateAvatar(Avatar avatar) {
		userDao.updateAvatar(avatar);
	}

	@Override
	public List<Follow> getMyFollowingById(String userId) {
		return userDao.getMyFollowingById(userId);
	}

	@Override
	public List<Follow> getFriends(String userId) {
		return userDao.getFriends(userId);
	}

	@Override
	public Follow myFollowChecking(Follow follow) {
		return userDao.myFollowChecking(follow);
	}

	@Override
	public void insertFollow(Follow follow) {
		userDao.insertFollow(follow);
	}

	@Override
	public List<Follow> getFriendRequest(String userId) {
		return userDao.getFriendRequest(userId);
	}

	@Override
	public List<Follow> getFollowMe(String userId) {
		return userDao.getFollowMe(userId);
	}

	@Override
	public void deleteFollow(Follow follow) {
		userDao.deleteFollow(follow);
	}

	@Override
	public List<LectureHistory> getLectureHistoryByCriteria(Criteria criteria) {
		
		List<LectureHistory> temps = userDao.getLectureHistoryByCriteria(criteria);
		for (LectureHistory temp : temps) {
			
			int p = paidLectureService.completePercent(temp.getBuyLecture());
			temp.getBuyLecture().setPercentage(p);
			System.out.println(p);
		}
		return temps;
	}

	@Override
	public List<PaidLecture> getPaidLectureByRank(String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		return userDao.getPaidLectureByRank(map);
	}
	public List<PaidLecture> getMyComplateLectureByUserNo(int userNo){
		return userDao.getMyComplateLectureByUserNo(userNo);
	};

	public int getHistoryCountByUserNo(int no) {
		return userDao.getHistoryCountByUserNo(no);
	}

	@Override
	public Map<String, Integer> CheckUserBadgeByUserNoAndBadgeNo(int userNo,int badgeNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("badgeNo", badgeNo);
		return userDao.CheckUserBadgeByUserNoAndBadgeNo(map);
	}

	@Override
	public Map<String, Integer> completionCheckMyLecture(int userNo, int lectureNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("lectureNo", lectureNo);
		return userDao.completionCheckMyLecture(map);
	}

	@Override
	public Integer checkTheFirstLecture(int userNo, int detailNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("detailNo", detailNo);
		return userDao.checkTheFirstLecture(map);
	}
	
}
