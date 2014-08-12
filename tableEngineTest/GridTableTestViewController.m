//
//  GridTableTestViewController.m
//  tableEngineTest
//
//  Created by 张奇 on 14-8-8.
//  Copyright (c) 2014年 com.ebest. All rights reserved.
//

#import "GridTableTestViewController.h"

#import "ZZGridTableFlowLayout.h"


#define TABLE_COLUMNS       ([_tasksArr count]+1)
#define TABLE_ROWS          ([_productsArr count]+1)

#define FIRST_COLUMN_WIDTH    200
#define OTHER_COLUMN_WIDTH    100
#define TABLE_COLUMN_HEIGHT     35


@interface GridTableTestViewController ()

@property (nonatomic, strong) NSMutableArray            *tasksArr;
@property (nonatomic, strong) NSMutableArray            *productsArr;
@property (nonatomic, strong) UIScrollView              *bgScrollView;
@property (nonatomic, strong) UITextField               *currentTF;
@property (nonatomic, assign) NSInteger                 currentRow;

@end

@implementation GridTableTestViewController

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
    
    _tasksArr = [[NSMutableArray alloc] initWithObjects:@"Distribution",@"Price",@"Promotion",@"Stock",@"Suggest Order23123124124",@"SoS",@"2nd Display",@"Cooler", nil];
    _productsArr = [[NSMutableArray alloc] initWithObjects:@"cocoa1.5l*2444",@"2222",@"3333",@"444",@"2222112", nil];
    
    
    if ((FIRST_COLUMN_WIDTH+[_tasksArr count]*OTHER_COLUMN_WIDTH)<1024)
    {
        CGFloat orgainX = (1024 - (FIRST_COLUMN_WIDTH+[_tasksArr count]*OTHER_COLUMN_WIDTH))/2;
        _bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(orgainX, 0, FIRST_COLUMN_WIDTH+[_tasksArr count]*OTHER_COLUMN_WIDTH, 768)];
    }
    else
    {
        _bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,1024, 768)];
    }
    _bgScrollView.contentSize = CGSizeMake(FIRST_COLUMN_WIDTH+[_tasksArr count]*OTHER_COLUMN_WIDTH, TABLE_COLUMN_HEIGHT*([_productsArr count]+1));
    [self.view addSubview:_bgScrollView];
    
    
    _gridTableCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0,FIRST_COLUMN_WIDTH+[_tasksArr count]*OTHER_COLUMN_WIDTH , 768-66) collectionViewLayout:[ZZGridTableFlowLayout new]];
    _gridTableCollectionView.delegate = self;
    _gridTableCollectionView.dataSource = self;
    [self.bgScrollView addSubview:_gridTableCollectionView];
    
    //布局....全部布局....个性布局(局部布局)需要使用delegate来实现
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    [flowLayout setItemSize:CGSizeMake(140, 30)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.minimumInteritemSpacing = 0.0f;
    flowLayout.minimumLineSpacing = 0.0f;
    [self.gridTableCollectionView setCollectionViewLayout:flowLayout];
    
    //注册Cell
    [self.gridTableCollectionView registerClass:[ZZGridTableCell class] forCellWithReuseIdentifier:@"simpleCell"];
    
    self.gridTableCollectionView.backgroundColor=[UIColor whiteColor];

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return TABLE_COLUMNS *TABLE_ROWS;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    static NSString *cellIdentifier = @"simpleCell";
    ZZGridTableCell *cell = [_gridTableCollectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    //加载第一列的数据(即产品的名字)
    if (indexPath.row%TABLE_COLUMNS == 0)
    {
        if (indexPath.row == 0)
        {
            [cell.headerLbl setFont:[UIFont systemFontOfSize:13.0]];
            cell.headerLbl.text = @"Product Name";
        }
        else
        {
            NSString    *product = [_productsArr objectAtIndex:indexPath.row/TABLE_COLUMNS-1];
            NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:17.0]};
            CGSize size = [product boundingRectWithSize:CGSizeMake(200, 0) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
            if (size.width>FIRST_COLUMN_WIDTH)
            {
                cell.headerLbl.font = [UIFont systemFontOfSize:14.0];
                cell.headerLbl.lineBreakMode = NSLineBreakByCharWrapping;
                cell.headerLbl.numberOfLines = 2;
            }
            cell.headerLbl.text = product;
            cell.backgroundColor = [UIColor orangeColor];
        }
        
    }
    //加载第一行的数据(即task 的名字)
    else if(indexPath.row<TABLE_COLUMNS)
    {
        if (indexPath.row == 0)
        {
            [cell.headerLbl setFont:[UIFont systemFontOfSize:13.0]];
            cell.headerLbl.text = @"Product Name";
        }
        else
        {
            NSString    *task = [_tasksArr objectAtIndex:indexPath.row-1];
            NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:17.0]};
            CGSize size = [task boundingRectWithSize:CGSizeMake(200, 0) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
            if (size.width>OTHER_COLUMN_WIDTH)
            {
                cell.headerLbl.font = [UIFont systemFontOfSize:13.0];
                cell.headerLbl.lineBreakMode = NSLineBreakByCharWrapping;
                cell.headerLbl.numberOfLines = 2;
            }
            cell.headerLbl.text = task;
            cell.backgroundColor = [UIColor orangeColor];
        }
    }
    //其他单元格的加载，只是输入
    else
    {
        [cell initTextField];
        
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark - UICollectionView Delegate FlowLayout


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row%TABLE_COLUMNS == 0)
    {
        return CGSizeMake(FIRST_COLUMN_WIDTH, TABLE_COLUMN_HEIGHT);
    }
    else
        return CGSizeMake(OTHER_COLUMN_WIDTH, TABLE_COLUMN_HEIGHT);
}

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(0, 0, 0, 0);
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 0.0f;
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 0.0f;
//}

#pragma mark - Cell Delegate

- (void)theCellTextField:(UITextField *)tf
{
    UICollectionViewCell *cell = [self getCellFromView:tf];
    
    NSIndexPath *indexPath = [_gridTableCollectionView indexPathForCell:cell];
    
    //开始编辑时，就获取当前的 textField 和 Row
    _currentTF = tf;
    _currentRow = indexPath.row;
}

- (void)theCellTextFieldEndEditing:(UITextField *)tf
{
    UICollectionViewCell *cell = [self getCellFromView:tf];
    
    [(ZZGridTableCell *)cell setTextFieldBackgroundColor:[UIColor yellowColor]];
    
    NSIndexPath *indexPath = [_gridTableCollectionView indexPathForCell:cell];
    
    NSLog(@"indexPath.row:%d  tf.text:%@   currentTF:%@",indexPath.row,tf.text,_currentTF.text);
}

-(UICollectionViewCell*)getCellFromView:(UIView*)v
{
    UICollectionViewCell *cell=nil;
    while (true) {
        v=v.superview;
        if([v isKindOfClass:[UICollectionViewCell class]])
        {
            cell=(UICollectionViewCell*)v;
        }
        else if(v==nil)
        {
            break;
        }
    }
    return cell;
}




@end
