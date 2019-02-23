package com.jhta.cope.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.CartDao;
import com.jhta.cope.dao.PaidLectureDao;
import com.jhta.cope.dao.UserDao;
import com.jhta.cope.vo.Cart;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.User;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	CartDao cartDao;
	
	@Autowired
	PaidLectureDao paidLectureDao;
	
	@Autowired
	UserDao userDao;

	@Override
	public void insertCart(int userNo, int lectureNo) {
		User user = new User();
		user.setNo(userNo);
		PaidLecture paidLecture = new PaidLecture();
		paidLecture.setNo(lectureNo);
		
		Cart cart = new Cart();
		cart.setUser(user);
		cart.setPaidLecture(paidLecture);
		
		cartDao.insertCart(cart);
	}

	@Override
	public List<Cart> getCartByUserNo(int userNo) {
		
		List<Cart> carts = cartDao.getCartByUserNo(userNo);
		
		for (Cart cart : carts) {
			int lectureNo = cart.getPaidLecture().getNo();
			PaidLecture paidLecture = paidLectureDao.getPaidLectureByNo(lectureNo);
			User user = userDao.getUserByNo(userNo);
			
			cart.setPaidLecture(paidLecture);
			cart.setUser(user);
		}
		
		return carts;
	}

	@Override
	public int getTotalPrice(List<Cart> carts) {
		int total = 0;
		for (Cart cart : carts) {
			total += cart.getPaidLecture().getPrice();
		}
		return total;
	}

	@Override
	public void deleteCartByUserNo(int userNo) {
		cartDao.deleteCartByUserNo(userNo);
	}

	@Override
	public void deleteCartByCartNo(int cartNo) {
		cartDao.deleteCartByCartNo(cartNo);
		
	}

}
