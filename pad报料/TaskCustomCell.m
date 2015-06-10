//
//  TaskCustomCell.m
//  BreakingNews
//
//  Created by qianmenhui on 14-6-23.
//  Copyright (c) 2014年 钱门慧. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "TaskCustomCell.h"

@implementation TaskCustomCell

@synthesize labelNum;
@synthesize labelTitle;
@synthesize labelDesp;
//@synthesize labelDate;
//@synthesize labelLoc;
@synthesize labelStatus;
@synthesize progressView;
@synthesize textSvrInfo;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _preOrientation = [[UIDevice currentDevice] orientation];
        
        float nCellWidth = [[UIScreen mainScreen] bounds].size.width;
        if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight || ([[UIDevice currentDevice] orientation] == UIDeviceOrientationFaceUp && (_preOrientation == UIDeviceOrientationLandscapeLeft || _preOrientation == UIDeviceOrientationLandscapeRight))){
            nCellWidth = [[UIScreen mainScreen] bounds].size.height;
        }
        
        if (style == UITableViewCellStyleDefault) {   //服务器设置的cell
            [self setFrame:CGRectMake(0, 0, nCellWidth, 50)];
            
            //cell中的事件描述
            labelDesp = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 70, 50)];
            labelDesp.text = @"描述";
            labelDesp.textAlignment = NSTextAlignmentLeft;
            labelDesp.font = [UIFont systemFontOfSize:16];
            [self.contentView addSubview:labelDesp];
            
            textSvrInfo = [[UITextField alloc] initWithFrame:CGRectMake(81, 0, nCellWidth - 95, 50)];
            textSvrInfo.backgroundColor = [UIColor whiteColor];
            textSvrInfo.font = [UIFont systemFontOfSize:16];
            //textSvrInfo.delegate = self;
            textSvrInfo.autocapitalizationType = UITextAutocapitalizationTypeNone;
            [self.contentView addSubview:textSvrInfo];
            
        }
        else     //上传的cell显示信息
        {
            [self setFrame:CGRectMake(0, 0, nCellWidth, 80)];
            
            //序号显示标签
            labelNum = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 80)];
            labelNum.text = @"序号";
            labelNum.textAlignment = NSTextAlignmentCenter;
            labelNum.backgroundColor = [UIColor cyanColor];
            labelNum.layer.cornerRadius = 4.0f;
            [self.contentView addSubview:labelNum];
            
            //cell中的事件描述
            labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(labelNum.frame.size.width + labelNum.frame.origin.x, 0, (nCellWidth/3) + 50, 80)];
            labelTitle.text = @"标题";
            labelTitle.textAlignment = NSTextAlignmentLeft;
            labelTitle.font = [UIFont systemFontOfSize:22];
            [self.contentView addSubview:labelTitle];
            
            //cell中的时间
//            labelDate = [[UILabel alloc] initWithFrame:CGRectMake(labelNum.frame.size.width + labelNum.frame.origin.x, labelTitle.frame.origin.y + labelTitle.frame.size.height, nCellWidth/2, 40)];
//            labelDate.text = @"创建时间";
//            labelDate.textAlignment = NSTextAlignmentLeft;
//            labelDate.font = [UIFont systemFontOfSize:16];
//            [self.contentView addSubview:labelDate];
            
            labelStatus = [[UILabel alloc] initWithFrame:CGRectMake(labelTitle.frame.origin.x + labelTitle.frame.size.width, 0, (nCellWidth*2/3) - labelNum.frame.size.width - 50, 40)];
            labelStatus.text = @"0%";
            labelStatus.textAlignment = NSTextAlignmentCenter;
            labelStatus.font = [UIFont systemFontOfSize:18];
            [self.contentView addSubview:labelStatus];
            
            //cell中的进度
            progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(labelStatus.frame.origin.x, labelStatus.frame.origin.y + labelStatus.frame.size.height, labelStatus.frame.size.width, 40)];
            progressView.progressViewStyle = UIProgressViewStyleDefault;
            progressView.progressTintColor = [UIColor blueColor];
            progressView.trackTintColor = [UIColor lightGrayColor];
            progressView.progress = 0.0;
            //progressView.transform = CGAffineTransformMakeScale(1.0f,2.0f);
            [self.contentView addSubview:progressView];
        }
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)cellOrientationChanged
{
    if ([[UIDevice currentDevice] orientation] != UIDeviceOrientationFaceUp && [[UIDevice currentDevice] orientation] != UIDeviceOrientationFaceDown) {
        _preOrientation = [[UIDevice currentDevice] orientation];
    }
    
    float nCellWidth = [[UIScreen mainScreen] bounds].size.width;
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight || ([[UIDevice currentDevice] orientation] == UIDeviceOrientationFaceUp && (_preOrientation == UIDeviceOrientationLandscapeLeft || _preOrientation == UIDeviceOrientationLandscapeRight))){
        nCellWidth = [[UIScreen mainScreen] bounds].size.height;
    }
    
    if ([self.reuseIdentifier isEqualToString:@"svrShowCell"]) {
        [self setFrame:CGRectMake(0, 0, nCellWidth, 50)];
        
        labelDesp.frame = CGRectMake(10, 0, 70, 50);
        textSvrInfo.frame = CGRectMake(81, 0, nCellWidth - 95, 50);
    }
    else if ([self.reuseIdentifier isEqualToString:@"listCell"])
    {
        [self setFrame:CGRectMake(0, 0, nCellWidth, 80)];
        
        labelNum.frame = CGRectMake(0, 0, 30, 80);
        labelTitle.frame = CGRectMake(labelNum.frame.size.width + labelNum.frame.origin.x, 0, (nCellWidth/3) + 50, 80);
        labelStatus.frame = CGRectMake(labelTitle.frame.origin.x + labelTitle.frame.size.width, 0, (nCellWidth*2/3) - labelNum.frame.size.width - 50, 40);
        progressView.frame = CGRectMake(labelStatus.frame.origin.x, labelStatus.frame.origin.y + labelStatus.frame.size.height, labelStatus.frame.size.width, 40);
        //progressView.transform = CGAffineTransformMakeScale(1.0f,2.0f);
    }
    
}




@end
