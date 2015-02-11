//
//  AnimatedLoader.h
//  Loader
//
//  Created by Prabin Kumar Datta on 11/02/15.
//  Copyright (c) 2015 Prabin Kumar Datta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimatedLoader : UIView

- (instancetype)initWithFrame:(CGRect)frame;

-(void)start;
-(void)stop;

@end
