//
//  SvrSetViewController.h
//  BreakingNews
//
//  Created by qianmenhui on 14-7-7.
//  Copyright (c) 2014年 qianmenhui. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SvrSetDelegate <NSObject>

- (void)refreshList;

@end

@interface SvrSetViewController : UIViewController <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_svrListSetTable;
}

@property (nonatomic, assign) id <SvrSetDelegate> delegate;
@property (nonatomic, assign) NSMutableDictionary *dicCurrent;
@property (nonatomic, assign) BOOL isModify;    //是否为修改，或添加

@end
