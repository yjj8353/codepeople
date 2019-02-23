package com.jhta.cope.dao;

import java.util.List;

import com.jhta.cope.vo.Cart;
import com.jhta.cope.vo.User;

public interface CartDao {
	
	public void insertCart(Cart cart);
	public List<Cart> getCartByUserNo(int no);
	public void deleteCartByUserNo(int userNo);
	public void deleteCartByCartNo(int cartNo);
	
}