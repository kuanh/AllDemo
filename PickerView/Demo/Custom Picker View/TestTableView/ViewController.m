
#import "ViewController.h"
#import "DummyPickerView.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize selectedCell;

#define DEFAULT_TICK_IMAGE_TAG 1000

- (void)viewDidLoad
{
    [super viewDidLoad];
    previousSelectedItem=0;
    dummyPickerView = [[DummyPickerView alloc]init ];
    testData = [[NSMutableArray alloc]init];
    for (int i=1; i<=100; i++) {
        [testData addObject:[NSString stringWithFormat:@"Value-%d",i]];
    }
    [self SetPickerView];
}
-(void)SetPickerView
{
    [self.view addSubview:[dummyPickerView initWithFrame:testData]];
    dummyPickerView.dummyPickerViewDelegate=self;
}


-(IBAction)viewPickerButtonPressed:(id)sender
{
    [self mainViewAnimationPickerViewShowMode];
    UIView *pickerView1 =(UIView*) [self.view viewWithTag:1234];
    pickerView1.hidden=NO;
    [self pickerTransitionForShow:pickerView1];
    
}
-(IBAction)updateValueButtonPressed:(id)sender
{
    [testData removeAllObjects];
    for (int i=10; i>=0; i--) {
        [testData addObject:[NSString stringWithFormat:@"Updated Value - %d",i]];
        [dummyPickerView updateTableData:testData];
    }
}

-(void)GetSelectedValue:(int)_selectedIndex
{
    selectedCell.text=[NSString stringWithFormat:@"%@",[testData objectAtIndex:_selectedIndex]];
    if (previousSelectedItem!=0) {
       UIImageView *previousImg = (UIImageView*)[self.view viewWithTag:previousSelectedItem]; 
        previousImg.hidden=YES;
    }
    UIImageView *img = (UIImageView*)[self.view viewWithTag:DEFAULT_TICK_IMAGE_TAG+_selectedIndex];
    img.hidden=FALSE;
    previousSelectedItem=DEFAULT_TICK_IMAGE_TAG+_selectedIndex;
}

-(void)HidePickerView
{
    UIView *pickerView1 =(UIView*) [self.view viewWithTag:1234];
    pickerView1.hidden=YES;
    [self pickerTransitionForShow:pickerView1];
    [self mainViewAnimationPickerViewHideMode];
}

//for creating Animation
-(void)pickerTransitionForShow:(UIView*)pickerView_
{
    CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setDuration:.5f];
    [animation setType:kCATransitionPush];
    [animation setSubtype: kCATransitionFromTop];
    [pickerView_.layer addAnimation:animation forKey:@"anyValue"];				
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.33f];
    [UIView commitAnimations];
}

-(void)pickerTransitionForHide:(UIView*)pickerView_
{
    CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setDuration:.5f];
    [animation setType:kCATransitionPush];
    [animation setSubtype: kCATransitionFromBottom];
    [pickerView_.layer addAnimation:animation forKey:@"anyValue"];				
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.22f];
    [UIView commitAnimations];
}

-(void)mainViewAnimationPickerViewShowMode
{
    mainContainer.userInteractionEnabled=NO;
    [UIView animateWithDuration:0.3 animations:^{
        CALayer *layer = mainContainer.layer;
        layer.zPosition = -4000;
        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform.m34 = 1.0 / -300;
        layer.transform = CATransform3DRotate(rotationAndPerspectiveTransform, 0.0f, 0.0f, 0.0f,0.0f);
        mainContainer.alpha = 0.75;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
        mainContainer.transform = CGAffineTransformMakeScale(0.8, 0.8);
        }];
    }];
}

-(void)mainViewAnimationPickerViewHideMode
{
    mainContainer.userInteractionEnabled=YES;
    UIView *pickerView1 =(UIView*) [self.view viewWithTag:1234];
    pickerView1.hidden=TRUE;
    [self pickerTransitionForHide:pickerView1];
    [UIView animateWithDuration:0.3 animations:^{
        CALayer *layer = mainContainer.layer;
        layer.zPosition = -4000;
        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform.m34 = 1.0 / 300;
        layer.transform = CATransform3DRotate(rotationAndPerspectiveTransform, 0.0f, 0.0f, 0.0f,0.0f);
        mainContainer.alpha = 1.00;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            mainContainer.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    }];
}

- (void)viewDidUnload
{
    [self setSelectedCell:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)dealloc {
    [selectedCell release];
    [dummyPickerView release];
    [super dealloc];
}
@end
