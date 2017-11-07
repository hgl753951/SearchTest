//
//  CustomNavigationBar.m
//  CBS
//
//  Created by Hero11223 on 16/6/23.
//  Copyright © 2016年 zyy. All rights reserved.
//

//主色调
#define MainColor    [UIColor colorWithRed:0.0/255.0 green:185.0/255.0 blue:239.0/255.0 alpha:1.0]
#define KscreenW [UIScreen mainScreen].bounds.size.width
#define KscreenH [UIScreen mainScreen].bounds.size.height

#import "CustomNavigationBar.h"

@implementation CustomNavigationBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withLeftBtnHidden:(BOOL)l_hidden withRightBtn:(BOOL)r_hidden
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = MainColor;
        //中间的标题
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(75.0, frame.size.height - 44, KscreenW-75.0*2, 44)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
        self.titleLabel.text = title;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLabel];
        
        //左边的按钮
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton addTarget:self action:@selector(clickLeftBtn:) forControlEvents:UIControlEventTouchUpInside];
        _leftButton.frame = CGRectMake(0, frame.size.height-44, 44, 44);
        [_leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [self addSubview:_leftButton];
        _leftButton.hidden = l_hidden;
        
        //右边的按钮
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton addTarget:self action:@selector(clickRightBtn:) forControlEvents:UIControlEventTouchUpInside];
        _rightButton.frame = CGRectMake(frame.size.width - 57, frame.size.height - 44, 44, 44);
        [_rightButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        _rightButton.hidden = r_hidden;
        [self addSubview:_rightButton];
    };
    return self;
}
-(id)initWithFrametwo:(CGRect)frame withTitle:(NSString *)title withLeftBtnHidden:(BOOL)l_hidden withRightBtn:(BOOL)r_hidden
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = MainColor;
        //中间的标题
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(75.0, frame.size.height - 44, KscreenW-75.0*2, 44)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
        self.titleLabel.text = title;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLabel];
        
        //左边的按钮
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton addTarget:self action:@selector(clickLeftBtn:) forControlEvents:UIControlEventTouchUpInside];
        _leftButton.frame = CGRectMake(30, frame.size.height-44, 44, 44);
//        [_leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [self addSubview:_leftButton];
        _leftButton.hidden = l_hidden;
        
        //右边的按钮
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton addTarget:self action:@selector(clickRightBtn:) forControlEvents:UIControlEventTouchUpInside];
        _rightButton.frame = CGRectMake(frame.size.width - 57, frame.size.height - 44, 44, 44);
        [_rightButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        _rightButton.hidden = r_hidden;
        [self addSubview:_rightButton];
        
        //左边按钮的图片
        _leftImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nav"]];
        _leftImg.frame = CGRectMake(10, frame.size.height-34, 15, 20);
        [self addSubview:_leftImg];
    };
    return self;}
-(void)setIsRightHidden:(BOOL)isRightHidden
{
    if (isRightHidden == YES) {
        CGRect rect = self.titleLabel.frame;
        rect.size.width = KscreenW - 75.0*2;
        self.titleLabel.frame = rect;
    }else
    {
        CGRect rect = self.titleLabel.frame;
        rect.size.width = KscreenW - 75.0-120.0;
        self.titleLabel.frame = rect;
    }
}
-(void)liftBtn:(NSString *)name
{
    [_leftButton setTitle:name forState:UIControlStateNormal];
    [_leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_leftButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    _leftImg.hidden = NO;

}
-(void)setRightBtnType:(RightBtnType)rightBtnType
{
    switch (rightBtnType) {
        case BtnTypeSave://保存
        {
            [_rightButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            [_rightButton setTitle:@"保存" forState:UIControlStateNormal];
            [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [_rightButton setImageEdgeInsets:UIEdgeInsetsMake(12, 16, 12, 4)];
            _rightButton.titleLabel.font = [UIFont systemFontOfSize:17.0];
        }
            break;
        case BtnTypeMore://更多
        {
            [_rightButton setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
            [_rightButton setTitle:@"" forState:UIControlStateNormal];
            [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [_rightButton setImageEdgeInsets:UIEdgeInsetsMake(6, 7, 10, 8)];
            _rightButton.titleLabel.font = [UIFont systemFontOfSize:17.0];
        }
            break;
        case BtnTypeClist://菜单
        {
            CGRect rect = _rightButton.frame;
            rect.origin.x = KscreenW - 57.0;
            rect.size.width = 44.0;
            _rightButton.frame = rect;
            
            [_rightButton setImage:[UIImage imageNamed:@"title_bar_add"] forState:UIControlStateNormal];
            [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [_rightButton setTitle:@"" forState:UIControlStateNormal];
            _rightButton.titleLabel.font = [UIFont systemFontOfSize:17.0];
            
        }
            break;
        case BtnTypeSearch://搜索
        {
            CGRect rect = _rightButton.frame;
            rect.origin.x = KscreenW - 40.0;
            rect.origin.y = 30;
            rect.size.width = 22;
            rect.size.height = 22;
            _rightButton.frame = rect;
            
            [_rightButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
            [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [_rightButton setTitle:@"" forState:UIControlStateNormal];
            _rightButton.titleLabel.font = [UIFont systemFontOfSize:17.0];
            
        }
            break;
        case BtnTypeAdd://添加
        {
            CGRect rect = _rightButton.frame;
            rect.origin.x = KscreenW - 57.0;
            rect.size.width = 30;
            rect.size.height = 50;
            _rightButton.frame = rect;
//            _rightButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
            [_rightButton setImage:[UIImage imageNamed:@"加号3"] forState:UIControlStateNormal];
            [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [_rightButton setTitle:@"" forState:UIControlStateNormal];
            _rightButton.titleLabel.font = [UIFont systemFontOfSize:17.0];
            
        }
            break;
        case BtnTypeCamera://添加动态
        {
            CGRect rect = _rightButton.frame;
            rect.origin.x = KscreenW - 40.0;
            rect.origin.y = 30;
            rect.size.width = 22;
            rect.size.height = 22;
            _rightButton.frame = rect;
            //            _rightButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
            [_rightButton setImage:[UIImage imageNamed:@"相机"] forState:UIControlStateNormal];
            [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [_rightButton setTitle:@"" forState:UIControlStateNormal];
            _rightButton.titleLabel.font = [UIFont systemFontOfSize:17.0];
            
        }
            break;
        case BtnTypeDetail://添加动态
        {
            [_rightButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            [_rightButton setTitle:@"明细" forState:UIControlStateNormal];
            [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [_rightButton setImageEdgeInsets:UIEdgeInsetsMake(12, 16, 12, 4)];
            _rightButton.titleLabel.font = [UIFont systemFontOfSize:17.0];
        }
            break;
        default:
            break;
    }
}

-(void)clickLeftBtn:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(leftBtnAction:)]) {
        [self.delegate leftBtnAction:sender];
    }
}

-(void)clickRightBtn:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(rightBtnAction:)]) {
        [self.delegate rightBtnAction:sender];
    }
}


@end
