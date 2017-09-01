//
//  FindUserModel.h
//  TestDemo
//
//  Created by dzb on 17/2/5.
//  Copyright © 2017年 蔡凌云. All rights reserved.
//




/*
 
 {
	id : 44,
	sex : 1,
	acttime : 1494346801096,
	width : 0,
	rcuserid : 2017050815523763745838,
	headimgurl : http://tvax4.sinaimg.cn/default/images/default_avatar_male_50.gif,
	actcontent : 文学是不可思议的财富，他能让你在不同的世界里遨游，会让你变得更加理性，会让你学会思考问题；但是，他也会让你变的更加“浪漫”，沉迷于文学的人也是“艺术家”的一类，他们有时孤芳自赏，有时愤世嫉俗，有时异常沉闷，有时精力十足，有时还会神经质，也许就是“不疯魔，不成活”吧。总的来看，热爱文学的人的性格都会相对“闷骚”（不是贬义），但，当他们开始说话时你会发现他们很有思想···最后，请相信，阅读是一种好习惯···,
	photostr : ["20170510001959837.jpg","20170510001959843.jpg","20170510001959547.jpg","20170510002000276.jpg","20170510002000778.jpg","20170510002000614.jpg"],
	height : 0,
	sqlocal : 上海市闵行区,
	commoncount : 0,
	account : wb149422995931pDyG4_95R5UOiywGk57NIA,
	username : 知一道二,
	zancount : 18
 }
 
 */
#import <Foundation/Foundation.h>

@interface FindUserModel : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *headimgurl;
@property (nonatomic, copy) NSString *account;//账号
@property (nonatomic, copy) NSString *actcontent;
@property (nonatomic, assign) NSInteger zancount;
@property (nonatomic, assign) NSInteger commoncount;
@property (nonatomic, copy) NSString *photostr;
@property (nonatomic, copy) NSString *sqlocal;
@property (nonatomic, copy) NSString *acttime;

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, strong) NSArray *photos;
@property (nonatomic, strong) NSArray *thimbimgPhotos;

@property (nonatomic, assign) CGSize photoViewLayotSize;

@property (nonatomic, assign) CGSize photoViewSize;
@property (nonatomic, assign) CGFloat contentLabBottom;

@property (nonatomic, assign) CGFloat cellH;

@property (nonatomic, strong) NSAttributedString *attActcontent;

// 富文本高度
@property (nonatomic, assign) CGFloat contentLabH;

@property (nonatomic, assign) BOOL zan;

@property (nonatomic, assign) NSString *shareUrl;
@property (nonatomic, copy) NSString *rcuserid;

@property (nonatomic, assign) NSInteger index;

- (void)calculate;

@end






