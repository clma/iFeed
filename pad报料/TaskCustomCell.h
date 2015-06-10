//
//  TaskCustomCell.h
//  BreakingNews
//
//  Created by qianmenhui on 14-6-23.
//  Copyright (c) 2014年 钱门慧. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskCustomCell : UITableViewCell
{
    UIDeviceOrientation _preOrientation;
}

@property (nonatomic, strong) UILabel *labelNum;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UILabel *labelDesp;
//@property (nonatomic, strong) UILabel *labelDate;
//@property (nonatomic, strong) UILabel *labelLoc;
@property (nonatomic, strong) UILabel *labelStatus;
@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) UITextField *textSvrInfo;

- (void)cellOrientationChanged;

@end
