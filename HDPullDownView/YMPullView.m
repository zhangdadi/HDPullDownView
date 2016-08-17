//
//  YMPullView.m
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


#import "YMPullView.h"
#import "YMPullItemView.h"
#import "UIView+HDCore.h"
#import "HDUtilsMacro.h"
#import "SDAutoLayout.h"
#import "YMColorMacro.h"


@interface YMPullView ()
@property (nonatomic, strong) NSArray *pullItemViewArray;
@end

@implementation YMPullView

#pragma mark - 生命周期方法

- (instancetype)init {
    self = [super init];
    if (self) {
        [self creatView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self creatView];
    }
    return self;
}

- (void)awakeFromNib {
    [self creatView];
}

- (void)dealloc {
    [self hideAllItemView];
}

#pragma mark - 外部方法

- (void)setTitle:(NSString *)title atIndex:(NSUInteger)index {
    if (index >= _itemArray.count) {
        return;
    }
    if (index >= _pullItemViewArray.count) {
        return;
    }
    
    YMPullViewModel *model = _itemArray[index];
    model.title = title;
    
    YMPullItemView *view = _pullItemViewArray[index];
    view.model = model;
}

- (void)hideAllItemView {
    for (YMPullItemView *itemView in _pullItemViewArray) {
        itemView.isHighlight = NO;
    }
}

#pragma makr - 消息

#pragma mark - 系统委托

#pragma mark - 自定义委托

#pragma mark - 响应方法

#pragma mark - 私有方法

- (void)creatView {
    self.backgroundColor = [UIColor whiteColor];
}

#pragma mark - get/set方法

- (void)setItemArray:(NSArray<YMPullViewModel> *)itemArray {
    _itemArray = itemArray;
    
    static YMPullItemView *lastSelectView = nil;
    
    NSMutableArray *temp = [NSMutableArray new];
    
    for (YMPullViewModel *itemModel in itemArray) {
        YMPullItemView *itemView = [[YMPullItemView alloc] init];
        itemView.itemWidth = HDScreenWidth / itemArray.count;
        itemView.model = itemModel;
        [self addSubview:itemView];
        itemView.sd_layout.heightIs(35);
        [temp addObject:itemView];
        
        if (itemArray.count == 1) {
            itemView.isLineNoneHighlight = YES;
        }
        
        itemView.selectBlock = ^(YMPullItemView *view) {
            view.isHighlight = !view.isHighlight;
            if (lastSelectView != view) {
                lastSelectView.isHighlight = NO;
                lastSelectView = view;
            }
        };
    }
    
     [self setupAutoWidthFlowItems:[temp copy]  withPerRowItemsCount:temp.count verticalMargin:0 horizontalMargin:0 verticalEdgeInset:0 horizontalEdgeInset:0];
    _pullItemViewArray = temp;
}

@end


@implementation YMPullViewModel


@end