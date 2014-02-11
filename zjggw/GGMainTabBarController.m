//
//  GGMainTabBarController.m
//  zjggw
//
//  Created by yzp on 14-2-10.
//  Copyright (c) 2014年 yzp. All rights reserved.
//

#import "GGMainTabBarController.h"

@interface GGMainTabBarController (){
    UIImageView *_tabBarView;
    GGTabBarButton *_previousBtn;//记录前一次选中的按钮
}

@end

@implementation GGMainTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    self.hidesBottomBarWhenPushed=YES;这句写在子页中
    self.tabBar.hidden=YES;
    CGFloat tabBarViewY=self.view.frame.size.height-49;
    _tabBarView=[[UIImageView alloc]initWithFrame:CGRectMake(0,tabBarViewY, 320, 49)];
    _tabBarView.userInteractionEnabled=YES;
    _tabBarView.image=[UIImage imageNamed:@"my_tabbar_bg"];
//    [_tabBarView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:_tabBarView];
    [self creatButtonWithNormalName:@"icon_bottom_cod_p" andSelectName:@"icon_bottom_cod_c" andTitle:@"商城" andIndex:0];
    [self creatButtonWithNormalName:@"icon_bottom_category_p" andSelectName:@"icon_bottom_category_c" andTitle:@"分类" andIndex:1];
    [self creatButtonWithNormalName:@"icon_bottom_shopcar_p" andSelectName:@"icon_bottom_shopcar_c" andTitle:@"购物车" andIndex:2];
    [self creatButtonWithNormalName:@"icon_bottom_forum_p" andSelectName:@"icon_bottom_forum_c" andTitle:@"交流区" andIndex:3];
    [self creatButtonWithNormalName:@"icon_bottom_my_p" andSelectName:@"icon_bottom_my_c" andTitle:@"个人中心" andIndex:4];
    
    //默认商城选中
    GGTabBarButton *indexBtn=_tabBarView.subviews[0];
    [self changeViewController:indexBtn];
}

//创建按钮tabbar
- (void)creatButtonWithNormalName:(NSString *)normal andSelectName:(NSString *)selected andTitle:(NSString *)title andIndex:(int)index{
    GGTabBarButton *barBtn=[GGTabBarButton buttonWithType:UIButtonTypeCustom];
    barBtn.tag=index;
    CGFloat barBtnW=_tabBarView.frame.size.width/5;
    CGFloat barBtnH=_tabBarView.frame.size.height;
    barBtn.frame=CGRectMake(64*index, 0, barBtnW, barBtnH);
    
    [barBtn setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [barBtn setImage:[UIImage imageNamed:selected] forState:UIControlStateDisabled];
    [barBtn setTitle:title forState:UIControlStateNormal];
//    barBtn.titleLabel.text=title;
    [barBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [barBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateDisabled];
    
    [barBtn addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventTouchDown];
    
    [barBtn addTarget:self action:@selector(changeViewControllerEnd:) forControlEvents:UIControlEventTouchUpInside];
    
    barBtn.imageView.contentMode=UIViewContentModeCenter;//图片居中
    barBtn.titleLabel.textAlignment=NSTextAlignmentCenter;//标题居中
    barBtn.font=[UIFont systemFontOfSize:12];//字体大小
//    barBtn.titleLabel.textColor=[UIColor grayColor];
    
    [_tabBarView addSubview:barBtn];
}

//点击tabbar的事件处理
- (void)changeViewController:(GGTabBarButton *)sender{
    self.selectedIndex=sender.tag;
    sender.enabled=NO;
    if (_previousBtn != sender) {
        _previousBtn.enabled=YES;
        
    }
    _previousBtn=sender;
}

//点击tabbar的事件处理
- (void)changeViewControllerEnd:(GGTabBarButton *)sender{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
