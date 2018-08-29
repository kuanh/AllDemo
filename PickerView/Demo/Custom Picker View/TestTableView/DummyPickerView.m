

#import "DummyPickerView.h"

@implementation DummyPickerView

@synthesize dummyPickerViewDelegate=_dummyPickerViewDelegate;

#define DEFAULT_NORMAL_FONT @"HelveticaNeue-Condensed"
#define DEFAULT_BOLD_FONT @"HelveticaNeue-CondensedBold"
#define DEFAULT_PICKER_HEADER @"Choose your Option..."
#define DEFAULT_TICK_IMAGE_TAG 1000


-(UIView*)initWithFrame:(NSMutableArray*)_arr_Data
{
    UIView *view = [[[UIView alloc]initWithFrame:CGRectMake(0, 200, 320, 260)]autorelease];
    view.tag=1234;
    arr_Data = [[NSMutableArray alloc]initWithArray:_arr_Data];
    
    //for top header view
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0,0,320,50)];
    UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(-3, -3, 330, 50)];
    bgImageView.image=[UIImage imageNamed:@"bg2.png"];
    [headerView addSubview:bgImageView];
    [bgImageView release];
    
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 3, 220, 40)];
    textLabel.text=DEFAULT_PICKER_HEADER;
    textLabel.font=[UIFont fontWithName:DEFAULT_BOLD_FONT size:16.0];
    textLabel.textColor = [UIColor whiteColor];
    textLabel.backgroundColor=[UIColor clearColor];
    [headerView addSubview:textLabel];
    [textLabel release];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(DoneButtonPressed) forControlEvents:UIControlEventTouchDown];
    [button setImage:[UIImage imageNamed:@"btn_Done.png"] forState:UIControlStateNormal];
    button.frame = CGRectMake(260, 7.0, 50.0, 30.0);
    [headerView addSubview:button];
    [view addSubview:headerView];
    
    mytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 48, 320, 215) style:UITableViewStylePlain];
    mytableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    mytableView.dataSource=self;
    mytableView.delegate=self;
    [view addSubview:mytableView];
    [mytableView release];
    
    view.hidden=TRUE;
    
    return view;
}

-(void)updateTableData:(NSMutableArray*)_arr_Data
{
    if (arr_Data != nil) {
        [arr_Data removeAllObjects];
    }
    arr_Data=[_arr_Data mutableCopy];
    [mytableView reloadData];
}

-(void)DoneButtonPressed
{
    [self.dummyPickerViewDelegate HidePickerView];
}

-(void)dealloc
{
    [arr_Data release];
    [super dealloc];
}

#pragma mark -- Table Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return [arr_Data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CountryCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSArray *viewsToRemove = [cell subviews];
    if (viewsToRemove != nil) {
        for (UIView *v in viewsToRemove) {
            [v removeFromSuperview];
        }
    }
    UIImageView *cellBgImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 43, 320, 1)];
    cellBgImg.image = [UIImage imageNamed:@"line-divider-productpage.png"];
    cellBgImg.alpha = 0.6;
    [cell addSubview:cellBgImg];
    [cellBgImg release];
    
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(50, 14, 200, 15)];
    lbl.text=[NSString stringWithFormat:@"%@",[arr_Data objectAtIndex:indexPath.row]];
    lbl.font=[UIFont fontWithName:DEFAULT_NORMAL_FONT size:14.0];
    lbl.textColor = [UIColor blackColor];
    [cell addSubview:lbl];
    [lbl release];
    
    UIImageView *tickImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 15, 15)];
    tickImage.image = [UIImage imageNamed:@"tick.jpeg"];
    tickImage.tag=DEFAULT_TICK_IMAGE_TAG+indexPath.row;
    if (previousSelectedItem-DEFAULT_TICK_IMAGE_TAG==indexPath.row) {
        tickImage.hidden=FALSE;
    }
    else {
        tickImage.hidden=TRUE;
    }
    [cell addSubview:tickImage];
    [tickImage release];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    previousSelectedItem=DEFAULT_TICK_IMAGE_TAG+indexPath.row;
    [self.dummyPickerViewDelegate GetSelectedValue:indexPath.row];
    
}

@end
