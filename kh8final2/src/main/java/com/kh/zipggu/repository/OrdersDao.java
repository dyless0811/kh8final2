package com.kh.zipggu.repository;

import java.util.List;

import com.kh.zipggu.entity.OrdersDto;
<<<<<<< HEAD
import com.kh.zipggu.vo.OrderListVO;
import com.kh.zipggu.vo.OrderSearchVO;
=======
import com.kh.zipggu.vo.ReviewListVO;
>>>>>>> refs/remotes/origin/main

public interface OrdersDao {
	int sequence();
	void insert(OrdersDto ordersDto);
	OrdersDto get(int no);
	List<OrdersDto> list();
	void refresh(int OrderNo);
<<<<<<< HEAD
	List<OrderListVO> listBySearchVO(OrderSearchVO orderSearchVO);
=======
	//리뷰 작성시 구매한 목록 출력
	List<ReviewListVO> reviewList(int memberNo);
>>>>>>> refs/remotes/origin/main
}
