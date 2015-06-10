//
//  PopActionSheet.m
//  pad报料
//
//  Created by qianmenhui on 14-8-25.
//  Copyright (c) 2014年 qianmenhui. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "PopActionSheet.h"

@interface PopActionSheet ()

@end

@implementation PopActionSheet

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.view.backgroundColor = [UIColor lightGrayColor];
    
//    UIButton *btnCamera = [UIButton buttonWithType:UIButtonTypeCustom];
//    btnCamera.frame = CGRectMake(0, 0, 240, 80);
//    [btnCamera setTitle:@"拍摄" forState:UIControlStateNormal];
//    btnCamera.titleLabel.font = [UIFont systemFontOfSize:25];
//    btnCamera.titleLabel.backgroundColor = [UIColor whiteColor];
//    btnCamera.titleLabel.textColor = [UIColor blueColor];
//    btnCamera.backgroundColor = [UIColor whiteColor];
//    [btnCamera addTarget:self action:@selector(btnCameraClicked) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btnCamera];
//    
//    UIButton *btnAlbum = [UIButton buttonWithType:UIButtonTypeCustom];
//    btnAlbum.frame = CGRectMake(0, 81, 240, 80);
//    [btnAlbum setTitle:@"从相册选取" forState:UIControlStateNormal];
//    btnAlbum.titleLabel.font = [UIFont systemFontOfSize:25];
//    btnAlbum.titleLabel.backgroundColor = [UIColor whiteColor];
//    btnAlbum.titleLabel.textColor = [UIColor blueColor];
//    btnAlbum.backgroundColor = [UIColor whiteColor];
//    btnAlbum.layer.borderWidth = 1.0f;
//    [btnAlbum addTarget:self action:@selector(btnAlbumClicked) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btnAlbum];
    
    _actionTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 240, 160) style:UITableViewStylePlain];
    _actionTableView.delegate = self;
    _actionTableView.dataSource = self;
    _actionTableView.scrollEnabled = NO;
    _actionTableView.rowHeight = 80.0f;
    [self.view addSubview:_actionTableView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnCameraClicked
{
    NSLog(@"btnCameraClicked");
}

- (void)btnAlbumClicked
{
    NSLog(@"btnAlbumClicked");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark UITableview delegate

//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

//是否分组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//是否可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

//编辑模式，删除或插入或none
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        if (delegate && [delegate respondsToSelector:@selector(selectCameraClicked)]) {
            [delegate selectCameraClicked];
        }
    }
    
    if (indexPath.row == 1) {
        if (delegate && [delegate respondsToSelector:@selector(selectAlbumClicked)]) {
            [delegate selectAlbumClicked];
        }
    }

    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
}

//绑定数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellAction";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.textLabel.textColor = [UIColor redColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.font = [UIFont systemFontOfSize:25];
        //1cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"拍摄";
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"从相册选取";
    }
    
    return cell;
}



@end
