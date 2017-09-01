
//  FindViewCell.m
//  TestDemo
//
//  Created by dzb on 17/2/5.
//  Copyright © 2017年 蔡凌云. All rights reserved.
//

#import "FindViewCell.h"
#import "CYPictureView.h"
#import "FindToolBar.h"
#import "TimeTool.h"
#import "StatusCellTextView.h"
#import "DTShowHudView.h"

@interface FindViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *timeLab;

@property (weak, nonatomic) IBOutlet UIImageView *headerImage;

@property (weak, nonatomic) IBOutlet UILabel *userName;

@property (nonatomic, strong)  StatusCellTextView *contentLabel;

@property (nonatomic, strong) FindToolBar *toolBar;

@property (nonatomic, strong) CYPictureView *pictureView;

@property (nonatomic, assign) CGSize photoSize;

@property (weak, nonatomic) IBOutlet UIImageView *sexImageView;

@property (weak, nonatomic) IBOutlet UIButton *arrowLab;

@property (weak, nonatomic) IBOutlet UIView *shareView;

@end

@implementation FindViewCell

- (FindToolBar *)toolBar {
    if (!_toolBar) {
        _toolBar = [[FindToolBar alloc] initWithFrame:FRAME(0, 0, CDRViewWidth, 50)];
        [self.contentView addSubview:_toolBar];
    }
    return _toolBar;
}

- (CYPictureView *)pictureView {
    if (!_pictureView) {
        _pictureView = [[CYPictureView alloc] init];
        _pictureView.backgroundColor = [UIColor  redColor];
        [self.contentView addSubview:_pictureView];
    }
    return _pictureView;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    self.headerImage.layer.cornerRadius = 4;
    self.headerImage.clipsToBounds = YES;
    self.headerImage.userInteractionEnabled = YES;
    //图像添加手势
    [self.headerImage addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headerImageClick)]];
    
    /** 正文 */
    StatusCellTextView *contentLabel = [[StatusCellTextView alloc] init];
    contentLabel.font = FONT_SIZE(15);
    contentLabel.textColor = NineColor;
    [self.contentView addSubview:contentLabel];
    self.contentLabel = contentLabel;
    self.contentLabel.frame = FRAME(10, 70, CDRViewWidth-20, 15);
    
    self.arrowLab.transform = CGAffineTransformMakeRotation(AngleRadion(90));
    //右边下拉按钮
    [self.shareView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shareSQ)]];
}


- (void)headerImageClick {
    NSLog(@"点击图像block传值");
    if (self.headerBlock) {
        self.headerBlock(self.userModel.account);
    }
}


- (void)shareSQ {
    NSLog(@"分享按钮block传值");

    if (self.shareBlock) {
        self.shareBlock(self.userModel);
    }
    
}

- (void)setUserModel:(FindUserModel *)userModel {
    
    _userModel = userModel;
    
    [self.headerImage sd_setImageWithURL:[NSURL URLWithString:userModel.headimgurl] placeholderImage:[UIImage imageNamed:@"HomeAlertContentView_movie_text"]];
    
    self.userName.text = userModel.username;
    
    //内容高度
    self.contentLabel.height = self.userModel.contentLabH;
    
    //具体内容
    self.contentLabel.attributedText = userModel.attActcontent;
    
    //时间
    self.timeLab.text = userModel.acttime;
    
    //性别图片
    [self.sexImageView setImage:[UIImage imageNamed:userModel.sex.integerValue == 1 ? @"daylogWater_boy" : @"daylogWater_girl"]];
    
    self.toolBar.userModel = userModel;
    
    //图片
    if (self.userModel.thimbimgPhotos.count > 0) {
        self.pictureView.hidden = NO;
        [self.pictureView setupPhotoViewLayout:self.userModel.photoViewLayotSize];
        self.pictureView.frame = FRAME(10, self.contentLabel.bottom + 10, self.userModel.photoViewSize.width,self.userModel.photoViewSize.height);
        self.pictureView.picModel = self.userModel.thimbimgPhotos;//图片数组
        self.pictureView.bigImageArray = self.userModel.photos;
        self.toolBar.y = self.pictureView.bottom;
        userModel.cellH = self.toolBar.bottom;
    } else {
        self.pictureView.hidden = YES;
        self.toolBar.y = self.contentLabel.bottom;
        userModel.cellH = self.toolBar.bottom;
    }
    
}

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

- (void)setFrame:(CGRect)frame
{
    frame.size.height -= 10;
    [super setFrame:frame];
}



@end



