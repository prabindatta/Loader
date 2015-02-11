//
//  AnimatedLoader.m
//  Loader
//
//  Created by Prabin Kumar Datta on 11/02/15.
//  Copyright (c) 2015 Prabin Kumar Datta. All rights reserved.
//

#import "AnimatedLoader.h"

#define FRAME(origin,point,size) CGRectMake(point.x-origin.x-(size/2), point.y - origin.y - (size/2), size, size)

@interface AnimatedLoader ()
{
    UIImageView *imageView;
    UILabel *lblmsg;
}

@end

@implementation AnimatedLoader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        CGFloat size = (frame.size.width>200)?120:frame.size.width-80;
        imageView = [[UIImageView alloc] initWithFrame:FRAME(self.frame.origin,self.center, size)];
        imageView.image = [UIImage imageNamed:@"loaderimage.png"];
        
        lblmsg = [[UILabel alloc] initWithFrame:CGRectMake(10, frame.origin.y-40, frame.size.width, 10)];
        lblmsg.font = [UIFont systemFontOfSize:12];
        lblmsg.text = @"Loading...";
        
        [self addSubview:lblmsg];
        [self addSubview:imageView];
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)start
{
    
//    imageView.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(1, -1), M_PI*2);
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    imageView.layer.zPosition = 100;
    CATransform3D transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    [animation setToValue:[NSValue valueWithCATransform3D:transform]];
    [animation setDuration:1.0f];
    [animation setAutoreverses:YES];
    [animation setRepeatCount:HUGE_VAL];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [animation setFillMode:kCAFillModeForwards];
    [animation setRemovedOnCompletion:YES];
    [animation setDelegate:self];
    
    [imageView.layer addAnimation:animation forKey:@"test"];
}

- (void)stop
{
    
}

@end
