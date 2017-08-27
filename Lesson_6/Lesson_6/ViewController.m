//
//  ViewController.m
//  Lesson_6
//
//  Created by Denis on 25.08.17.
//  Copyright © 2017 Denis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *PushMeButton;
@property (nonatomic, strong) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIView *LoaderView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *LoaderWidthConstraint;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [self.PushMeButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [self.PushMeButton setTitleColor:[UIColor greenColor] forState: UIControlStateHighlighted];
    [self.PushMeButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    self.LoaderWidthConstraint.constant = 0.0f;
    [self.PushMeButton setTitle:@"Приготовление" forState:UIControlStateDisabled];
    
    
}



- (NSTimer*)timer
{
    if (!_timer)
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval: 0.2  target:self selector:@selector(TimeIsOver) userInfo:nil repeats:YES];
    }
    return _timer;
}


-(void) TimeIsOver
{
    self.LoaderWidthConstraint.constant += 20;
    
    if (self.LoaderWidthConstraint.constant > 300)
    {
        [self.timer invalidate];
        self.timer = nil;
        
        self.LoaderView.backgroundColor = [UIColor clearColor];
        self.LoaderWidthConstraint.constant = 0.0f;
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Push:(UIButton *)sender
{
    self.LoaderView.backgroundColor = [UIColor redColor];
    [self timer];
    self.PushMeButton.enabled = NO;
    
}

#pragma mark - Text Field Delegate

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.text.length + string.length > 5)
    {
        [self.PushMeButton setTitle:@"Max lenght must be 5" forState:UIControlStateNormal];
        return NO;
        
    }
    
    return YES;
}

@end
