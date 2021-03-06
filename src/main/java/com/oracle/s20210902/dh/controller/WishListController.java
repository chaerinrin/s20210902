package com.oracle.s20210902.dh.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.s20210902.dh.service.Order1Paging;
import com.oracle.s20210902.dh.service.WishListService;
import com.oracle.s20210902.model.WishList;

@Controller
public class WishListController {
	
	private static final Logger logger = LoggerFactory.getLogger(WishListController.class);
	
	@Autowired
	private WishListService wls;
	
	/*
	 * @RequestMapping(value = "wishDummy") public String wishDummy() {
	 * System.out.println("wishDummy start"); return "dh/wishDummy"; }
	 */
	
	// p_code
	@RequestMapping(value = "wishListInsert")
	@ResponseBody
	public String wishListInsert(Model model, WishList wishlist, HttpServletRequest request) {
		System.out.println("WishListController wishList start");
		String mem_id = (String) request.getSession().getAttribute("mem_id");
		wishlist.setMem_id(mem_id);
		System.out.println("WishListController wishList mem_id-->"+mem_id);
		int test1 = wishlist.getP_code();
		System.out.println("test1 test1 test1 -> "+ test1);
		int result = 0;
		result = wls.selectWish(wishlist);
		if(result == 0) {
			result = wls.insert(wishlist);
			model.addAttribute("result", result);
		}else {
			result = 0;
		}
		String result2 = result+"";
		System.out.println("WishListController wishList result2-->"+result2);
		return result2;
		//return "dh/wishListPro";
	}
	
	@RequestMapping(value = "wishList")
	public String wishList(Model model, WishList wishlist, String currentPage, HttpServletRequest request) {
		System.out.println("WishListController wishList() start...");
		String mem_id = (String) request.getSession().getAttribute("mem_id");
		wishlist.setMem_id(mem_id);
		System.out.println("wishlist.setMem_id() -> " + wishlist.getMem_id());
		
		int total = wls.total(wishlist);								// DB??? ?????? ????????? ??????
		System.out.println("WishListController total->"+total);
		System.out.println("WishListController currentPage->"+currentPage);
		
		Order1Paging pg = new Order1Paging(total, currentPage);			// ??? ????????? ??????, ?????????????????? ?????????
		System.out.println("WishListController pg->"+pg);
		wishlist.setStart(pg.getStart());								// DB????????? ?????? rn???
		wishlist.setEnd(pg.getEnd());									// DB????????? ??? rn???
		
		List<WishList> wishList = wls.listWish(wishlist);				// Order1 ???????????? ????????? list??? ????????? ?????????
		System.out.println("Order1Controller order1List ->"+wishList);
		
		model.addAttribute("total", total);
		model.addAttribute("wishList", wishList);
		model.addAttribute("pg", pg);
		
		return "dh/wishList";
	}
	
	@RequestMapping(value = "wishListDelete")
	public String wishListDelete(Model model, WishList wishlist, HttpServletRequest request) {
		System.out.println("WishListController cartDelete() start...");
		String mem_id = (String) request.getSession().getAttribute("mem_id");
		wishlist.setMem_id(mem_id);
		int p_code = wishlist.getP_code();
		int result = wls.delete(wishlist);
		
		model.addAttribute("result", result);
		model.addAttribute("p_code", p_code);
		return "dh/wishListDeletePro";
	}
	
	
}
