//
//  ViewController.m
//  Loader
//
//  Created by Prabin Kumar Datta on 11/02/15.
//  Copyright (c) 2015 Prabin Kumar Datta. All rights reserved.
//

#import "ViewController.h"
#import "AnimatedLoader.h"
#import <QuartzCore/QuartzCore.h>

#define FRAME(point,size) CGRectMake(point.x-(size/2), point.y - (size/2), size, size+20)

@interface ViewController ()
{
    AnimatedLoader *loaderView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self showLoader];
    [self performSelector:@selector(hideLoader) withObject:nil afterDelay:20.0];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark -

- (void)showLoader
{
    loaderView = [[AnimatedLoader alloc] initWithFrame:FRAME(self.view.center,200)];
    loaderView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    loaderView.layer.borderWidth = 1.0f;
    loaderView.layer.cornerRadius = 10.0f;
    
    [loaderView start];
    [self.view addSubview:loaderView];
}

- (void)hideLoader
{
        [loaderView stop];
    [loaderView removeFromSuperview];
}

@end
