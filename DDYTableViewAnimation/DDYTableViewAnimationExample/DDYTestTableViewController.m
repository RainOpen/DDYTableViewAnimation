#import "DDYTestTableViewController.h"

@interface DDYTestTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *testDataArray;

@end

@implementation DDYTestTableViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
        _tableView.tableHeaderView = [UIView new];
    }
    return _tableView;
}

- (NSMutableArray *)testDataArray {
    if (!_testDataArray) {
        _testDataArray = [NSMutableArray array];
    }
    return _testDataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.tableView];
    [self performSelector:@selector(loadTestDate) withObject:nil afterDelay:0.5];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.testDataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *testCellID = @"testCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:testCellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:testCellID];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(15, 5, [[UIScreen mainScreen] bounds].size.width-30, 70)];
        view.backgroundColor = indexPath.row%2==0 ? [UIColor blueColor] : [UIColor greenColor];
        view.layer.masksToBounds = YES;
        view.layer.cornerRadius = 6.0;
        [cell.contentView addSubview:view];
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    return cell;
}

- (void)loadTestDate {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 100; i++) {
            [self.testDataArray addObject:[NSString stringWithFormat:@"%d", i]];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.tableView ddy_cellAnimationWithType:(DDYTableViewAnimationType)self.animationType];
        });
    });
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    CATransform3D transform = CATransform3DIdentity;
//    transform = CATransform3DRotate(transform, 0, 0, 0, 1);
//    transform = CATransform3DTranslate(transform, -200, 0, 0);
//    transform = CATransform3DScale(transform, 0, 0, 0);
//    cell.layer.transform = transform;
//    cell.layer.opacity = 0.0;
//    [UIView animateWithDuration:0.6 animations:^{
//        cell.layer.transform = CATransform3DIdentity;
//        cell.layer.opacity = 1;
//    }];
//}

@end
