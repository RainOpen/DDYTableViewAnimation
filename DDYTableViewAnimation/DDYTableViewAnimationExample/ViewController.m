#import "ViewController.h"
#import "DDYTestTableViewController.h"

#ifndef DDYTopH
#define DDYTopH (self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height)
#endif

#ifndef DDYScreenW
#define DDYScreenW [UIScreen mainScreen].bounds.size.width
#endif

#ifndef DDYScreenH
#define DDYScreenH [UIScreen mainScreen].bounds.size.height
#endif

@interface ViewController ()

@end

@implementation ViewController

- (UIButton *)btnY:(CGFloat)y tag:(NSUInteger)tag title:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor lightGrayColor]];
    [button setFrame:CGRectMake(10, DDYTopH + y, DDYScreenW-20, 30)];
    [button setTag:tag];
    [button addTarget:self action:@selector(handleBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    return button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:[self btnY: 10 tag:100 title:@"示例01"]];
    [self.view addSubview:[self btnY: 50 tag:101 title:@"示例02"]];
    [self.view addSubview:[self btnY: 90 tag:102 title:@"示例03"]];
    [self.view addSubview:[self btnY:130 tag:103 title:@"示例04"]];
    [self.view addSubview:[self btnY:170 tag:104 title:@"示例05"]];
    [self.view addSubview:[self btnY:210 tag:105 title:@"示例06"]];
    [self.view addSubview:[self btnY:250 tag:106 title:@"示例07"]];
    [self.view addSubview:[self btnY:290 tag:107 title:@"示例08"]];
    [self.view addSubview:[self btnY:330 tag:108 title:@"示例09"]];
    [self.view addSubview:[self btnY:370 tag:109 title:@"示例10"]];
    [self.view addSubview:[self btnY:410 tag:110 title:@"示例11"]];
}

- (void)handleBtn:(UIButton *)sender {
    DDYTestTableViewController *testVC = [[DDYTestTableViewController alloc] init];
    testVC.animationType = (DDYTableViewAnimationType)(sender.tag-100);
    [self.navigationController pushViewController:testVC animated:YES];
}

@end
