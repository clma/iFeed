//
//  TaskEditViewController.h
//  BreakingNews
//
//  Created by qianmenhui on 14-7-4.
//  Copyright (c) 2014年 qianmenhui. All rights reserved.
//
#import <CoreLocation/CoreLocation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <UIKit/UIKit.h>
#import "TaskSourceView.h"
#import "ELCImagePickerController.h"
#import "DatePickerViewController.h"
#import "SvrShowViewController.h"
#import "LocSetViewController.h"
#import "PhoneSetViewController.h"
#import "PopActionSheet.h"

@interface TaskEditViewController : UIViewController <TaskSourceViewDelegate, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate, UIActionSheetDelegate, ELCImagePickerControllerDelegate, DatePickerDelegate, SvrShowDelegate, LocSetViewDelegate, UIScrollViewDelegate, UIAlertViewDelegate, UIImagePickerControllerDelegate, PhoneSetDelegate, CLLocationManagerDelegate, PopActionSheetDelegate>
{
    NSMutableArray *_itemDicList;
    NSMutableDictionary *_itemDate;
    NSMutableDictionary *_itemTarget;
    NSMutableDictionary *_itemPhone;
    NSMutableDictionary *_itemLocation;
    
//    UILabel     *_sendDateLabel;
//    UITextField *_sendDateTextField;
//    UILabel     *_sendTargetLabel;
//    UITextField *_sendTargetTextField;
//    UILabel     *_phoneNumLabel;
//    UITextField *_phoneNumTextField;
//    UILabel     *_curLocationLabel;
//    UITextField *_curLocationTextField;
//    
//    UIButton    *_saveTaskBtn;
//    UIButton    *_sendTaskBtn;
    
    UIDeviceOrientation _preOrientation;
    
    //UILabel *_textPlaceholder;
    UIView *_backgroundView;
    UIScrollView *_myScrollView;
    UIPageControl *_pageCtrl;
    UIActivityIndicatorView *indicator;
    CLLocationManager *_locationManager;
    NSInteger   _indexLongPress;
    MPMoviePlayerController *_movPlay;
    
    NSInteger   _queryLocTime;          //解析地理信息次数限制，即解析了_queryLocTime后如果还没解析出来就停止解析
    
    UIPopoverController *_popoverCtrl;
}

@property (nonatomic, strong) DatePickerViewController *dataPicker;
@property (nonatomic, strong) NSMutableArray *selectImgArray;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *titleTextField;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UITextView *textDespView;
@property (nonatomic, strong) TaskSourceView *imgView;
@property (nonatomic, strong) UITableView *tableItemList;
@property (nonatomic, strong) SvrShowViewController *svrShow;
//@property (nonatomic, strong) LocSetViewController *LocSet;
@property (nonatomic, strong) PhoneSetViewController *phoneSet;
@property (nonatomic, strong) PopActionSheet *popCtrl;

@end
