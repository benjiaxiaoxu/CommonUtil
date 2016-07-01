//
//  MHAsiNetworkUrl.h
//  MHProject
//
//  Created by MengHuan on 15/4/23.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//

#ifndef MHProject_MHAsiNetworkUrl_h
#define MHProject_MHAsiNetworkUrl_h

#define API_HOST @"http://192.168.1.5:8080/newlife/"

//#define API_HOST @"http://yiyoudaojia.syzlzg.com/newlife/"
#define Image_HOST @"http://bbm.fanglinktec.com:8045/"

//      接口路径全拼
#define PATHFile(_path)             [NSString stringWithFormat:@"%@%@", API_HOST,_path]
#define PATH(_path)             [NSString stringWithFormat:_path, API_HOST]
#define UrlPATH(_path)           [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", Image_HOST,_path]]
/**
 *      主页
 */
#define ajax_mainPage         PATH(@"%@app/ajax/mainPage.do")
/**
 *      登录
 **/
#define user_login         PATH(@"%@app/user/login.do")
/**
 *      加盟商审核
 **/
#define user_joinNONCheck         PATH(@"%@app/user/joinNONCheck.do")
/**
 *      加盟商审核详情
 **/
#define user_joinNONCheckDesc         PATH(@"%@app/user/joinNONCheckDesc.do")
/**
 *      加盟商审核
 **/
#define user_checkJoin         PATH(@"%@app/user/checkjoin.do")
/**
 *      加盟商考核
 **/
#define order_kaohe         PATH(@"%@app/order/kaohe.do")
/**
 *      加盟商进货
 **/
#define order_jinhuo         PATH(@"%@app/order/jinhuo.do")
/**
 *      加盟商销货
 **/
#define order_xiaohuo         PATH(@"%@app/order/xiaohuo.do")
/**
 *      添加轨迹
 **/
#define user_checkLBS         PATH(@"%@app/user/checkLBS.do")
/**
 *      添加轨迹
 **/
#define user_checkLBS         PATH(@"%@app/user/checkLBS.do")
/**
 *      查看业务员轨迹
 **/
#define user_getLBSBySelectDate         PATH(@"%@app/user/getLBSBySelectDate.do")
/**
 *      查看业务员订单
 **/
#define order_saleOrder         PATH(@"%@app/order/saleOrder.do")
/**
 *      获取商品类型
 **/
#define product_proType         PATH(@"%@app/product/proType.do")
/**
 *      获取商品
 **/
#define product_pros         PATH(@"%@app/product/pros.do")
/**
 *      获取商品详情
 **/
#define product_prosbyId         PATH(@"%@app/product/prosbyId.do")
/**
 *      添加购物车
 **/
#define cart_addCart         PATH(@"%@app/cart/addCart.do")
/**
 *      购物车
 **/
#define cart_getCartByUserid         PATH(@"%@app/cart/getCartByUserid.do")
/**
 *      修改购物车
 **/
#define cart_updateCartById         PATH(@"%@app/cart/updateCartById.do")

/**
 *      删除购物车
 **/
#define cart_deleteCartById         PATH(@"%@app/cart/deleteCartById.do")

/**
 *      获取加盟商
 **/
#define user_userbySalesMan         PATH(@"%@app/user/userbySalesMan.do")

/**
 *      添加下单
 **/
#define order_addOrder         PATH(@"%@app/order/addOrder.do")
/**
 *      还款
 **/
#define order_huankuanOrder         PATH(@"%@app/order/huankuanOrder.do")

#endif
