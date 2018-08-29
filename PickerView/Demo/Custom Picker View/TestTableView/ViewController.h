//
//  ViewController.h
//  TestTableView
//
//  Created by MacBook Pro on 10/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DummyPickerView.h"

@interface ViewController : UIViewController<DummyPickerViewDelegate>
{
    IBOutlet UIView *pickerView;
    DummyPickerView *dummyPickerView;
    NSMutableArray *testData;
    int previousSelectedItem;
    IBOutlet UIView *mainContainer;
}
@property (retain, nonatomic) IBOutlet UILabel *selectedCell;
-(IBAction)viewPickerButtonPressed:(id)sender;
-(IBAction)updateValueButtonPressed:(id)sender;
-(void)mainViewAnimationPickerViewShowMode;
-(void)mainViewAnimationPickerViewHideMode;

@end

