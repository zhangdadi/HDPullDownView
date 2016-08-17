//
//  YMPullItemView.m
//  YMPhone
//
//  Created by zhangdadi.
//  Copyright (c) 2015年 张达棣. All rights reserved.
//
//  GitHub:https://github.com/zhangdadi/HDPullDownView
//  email: z_dadi@163.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


#import "YMPullItemView.h"
#import "UIView+HDCore.h"
#import "HDUtilsMacro.h"
#import "SDAutoLayout.h"
#import "YMColorMacro.h"

@interface YMPullItemView ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *lineLabel;
@property (nonatomic, strong) UIButton *bgView;
@end

@implementation YMPullItemView

#pragma mark - 生命周期方法

- (instancetype)init {
    self = [YMPullItemView HDViewFromXib];
    [self creatView];
    return self;
}

- (void)awakeFromNib {
     [self creatView];
}

#pragma mark - 外部方法

#pragma makr - 消息

#pragma mark - 系统委托

#pragma mark - 自定义委托

#pragma mark - 响应方法
- (IBAction)itemButtonClick:(id)sender {
    if (_selectBlock) {
        _selectBlock(self);
    }
}

- (void)bgButtonClick {
    self.isHighlight = NO;
}

#pragma mark - 私有方法

- (void)creatView {
    _bgView = [UIButton buttonWithType:UIButtonTypeCustom];
    _bgView.backgroundColor = HDColorFromRGBA(0, 0, 0, 0.5);
    [_bgView addTarget:self action:@selector(bgButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - get/set方法

- (void)setModel:(YMPullViewModel *)model {
    _model = model;
    _titleLabel.text = model.title;

    [_bgView HDRemoveAllChildren];
    if (model.view != nil) {
        [_bgView addSubview:model.view];
        
        model.view.sd_layout.leftSpaceToView(_bgView, 0).topSpaceToView(_bgView, 0).rightSpaceToView(_bgView, 0).heightIs(model.view.HDHeight);
    }
}

/**
 *  显示和隐藏
 *
 */
- (void)setIsHighlight:(BOOL)isHighlight {
    _isHighlight = isHighlight;
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    CGRect windowRect = [self convertRect:self.frame toView:keyWindow];

    if (isHighlight) { //高亮状态
        _titleLabel.textColor = KYMColorForGreen;
        _iconImageView.image = [UIImage imageNamed:@"a1-三角形"];
        if (!_isLineNoneHighlight) {
            _lineLabel.hidden = NO;
        }
        
        
        [[UIApplication sharedApplication].keyWindow addSubview:_bgView];
        _bgView.alpha = 0;
        [UIView animateWithDuration:0.3 animations:^{
            _iconImageView.transform = CGAffineTransformMakeRotation(-M_PI);
            _bgView.alpha = 1;
        }];
        
        _bgView.sd_resetLayout.leftSpaceToView(keyWindow, 0).topSpaceToView(keyWindow, windowRect.origin.y + windowRect.size.height).rightSpaceToView(keyWindow, 0).bottomSpaceToView(keyWindow, 0);
        
    } else { //非高亮状态
        _titleLabel.textColor = KYMColorForBlack;
        _lineLabel.hidden = YES;
        _iconImageView.image = [UIImage imageNamed:@"a1-三角形-默认"];
        [UIView animateWithDuration:0.2 animations:^{
            _iconImageView.transform = CGAffineTransformMakeRotation(2 * M_PI);
        }];
        
        [UIView animateWithDuration:.3 animations:^{
            _bgView.alpha = 0;
        } completion:^(BOOL finished) {
            [_bgView removeFromSuperviewAndClearAutoLayoutSettings];
        }];
        
    }
}

- (void)setItemWidth:(CGFloat)itemWidth {
    _itemWidth = itemWidth;
    _titleLabel.sd_layout.centerXEqualToView(self).centerYEqualToView(self).heightIs(21);
    [_titleLabel setSingleLineAutoResizeWithMaxWidth:itemWidth - 12];
    _iconImageView.sd_layout.leftSpaceToView(_titleLabel, 3).topSpaceToView(self, 11).widthIs(8).heightIs(8);

}

@end
