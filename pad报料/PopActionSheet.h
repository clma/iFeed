//
//  PopActionSheet.h
//  pad报料
//
//  Created by qianmenhui on 14-8-25.
//  Copyright (c) 2014年 qianmenhui. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopActionSheetDelegate;

@interface PopActionSheet : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_actionTableView;

}

@property (nonatomic, strong) id <PopActionSheetDelegate> delegate;

@end


@protocol PopActionSheetDelegate <NSObject>

- (void)selectCameraClicked;
- (void)selectAlbumClicked;

@end