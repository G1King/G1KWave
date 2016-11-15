//
//  ViewController.m
//  G1KWave
//
//  Created by Sobf Leo on 16/11/4.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "ViewController.h"
#import "G1KWaveView.h"
#import <objc/runtime.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) G1KWaveView * wave;

@end
static char * falg= "ss";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];

    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 245)];
    headerView.backgroundColor = [UIColor colorWithRed:164/255.f green:174/255.f blue:246/255.f alpha:1];
    self.tableView.tableHeaderView = headerView;
    [self swich];
    
    
  //
}
-(void)swich{
    Method originMethod = class_getInstanceMethod([self class], @selector(viewWillAppear:));
    Method swizzledMethod  = class_getInstanceMethod([self class], @selector(Kv_WillAppear:));
    BOOL isSw = class_addMethod([self class], @selector(viewWillAppear:), method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (isSw) {
        class_replaceMethod([self class], @selector(Kv_WillAppear:), method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    }else{
        method_exchangeImplementations(originMethod, swizzledMethod);
    }
}

-(void)Kv_WillAppear:(BOOL)animated{
     NSLog(@"ffjfff");
    [self Kv_WillAppear:animated];
   
}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    if (!self.wave) {
        self.wave = [G1KWaveView addView:self.tableView.tableHeaderView rect:CGRectMake(0, CGRectGetHeight(self.tableView.tableHeaderView.frame) - 4.5, CGRectGetWidth(self.tableView.frame), 5)];
        
    }
    
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if ([self.wave wave]) {
        
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"g1k"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"g1k"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd行",indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Class class =  NSClassFromString(@"ChatViewController");
    [self presentViewController:[class new] animated:YES completion:nil];
}
-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
