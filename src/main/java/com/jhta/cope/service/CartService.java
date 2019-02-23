package com.jhta.cope.service;

import java.util.List;

import com.jhta.cope.vo.Cart;

public interface CartService {

	public void insertCart(int userNo, int lectureNo);
	public List<Cart> getCartByUserNo(int userNo);
	public int getTotalPrice(List<Cart> carts);
	public void deleteCartByUserNo(int userNo);
	public void deleteCartByCartNo(int cartNo);

}
