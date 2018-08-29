
#import <Foundation/Foundation.h>

@protocol DummyPickerViewDelegate <NSObject>

-(void)GetSelectedValue:(int)_selectedIndex;
-(void)HidePickerView;

@end

@interface DummyPickerView : NSObject <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *mytableView;
    NSMutableArray* arr_Data;
    int previousSelectedItem;
    
}
@property(nonatomic,assign)id<DummyPickerViewDelegate>dummyPickerViewDelegate;

-(UIView*)initWithFrame:(NSMutableArray*)_arr_Data;
-(void)updateTableData:(NSMutableArray*)_arr_Data;

@end
