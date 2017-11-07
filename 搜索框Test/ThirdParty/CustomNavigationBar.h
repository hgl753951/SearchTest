//
//  CustomNavigationBar.h
//  CBS
//
//  Created by Hero11223 on 16/6/23.
//  Copyright © 2016年 zyy. All rights reserved.
//

#import <UIKit/UIKit.h>

//这里设个枚举
typedef enum:NSUInteger
{
    BtnTypeSave,//保存
    BtnTypeMore,//更多
    BtnTypeClist,//菜单
    BtnTypeSearch,//搜索
    BtnTypeAdd,//添加
    BtnTypeCamera,//添加动态
    BtnTypeDetail
    
}RightBtnType;

@protocol  CustomNavigationBarDelegate<NSObject>

@optional
-(void)leftBtnAction:(id)sender;
-(void)rightBtnAction:(id)sender;

@end

@interface CustomNavigationBar : UIView

@property(nonatomic,strong)UILabel *titleLabel;//标题
@property(nonatomic,strong)UIButton *leftButton;//左边的按钮
@property(nonatomic,strong)UIButton *rightButton;//右边的按钮
@property(nonatomic,assign)RightBtnType rightBtnType;
@property(nonatomic,assign)BOOL isRightHidden;
@property(nonatomic,strong)UIImageView *leftImg;//左边的图片
@property(nonatomic,strong)id<CustomNavigationBarDelegate>delegate;//声明代理

//声明两个方法
-(id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withLeftBtnHidden:(BOOL)l_hidden withRightBtn:(BOOL)r_hidden;
//-(id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withLeftBtnHidden:(BOOL)l_hidden withRightBtn:(BOOL)r_hidden leftWidth:(CGFloat)l_width rightWidth:(CGFloat)r_width;
-(id)initWithFrametwo:(CGRect)frame withTitle:(NSString *)title withLeftBtnHidden:(BOOL)l_hidden withRightBtn:(BOOL)r_hidden;
-(void)liftBtn:(NSString *)name;
@end
