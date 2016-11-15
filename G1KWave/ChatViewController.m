//
//  ChatViewController.m
//  G1KWave
//
//  Created by Sobf Leo on 16/11/11.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "ChatViewController.h"
#import "TempView.h"
@interface ChatViewController ()

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    TempView * bi =[[TempView alloc]init];
    bi.backgroundColor = [UIColor whiteColor];
    bi.frame = self.view.bounds;
    [self.view addSubview:bi];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
