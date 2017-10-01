//
//  IS_SlideMenu_View.m
//  StoryboardTest1
//
//  Created by Fabio Bombardi on 27/09/2017.
//  Copyright © 2017 Fabio Bombardi. All rights reserved.
//
// Slide menù taken from here:
// https://stackoverflow.com/questions/37045208/how-to-create-custom-slide-menu-without-third-party-library/37047366
#import "IS_SlideMenu_View.h"

@implementation IS_SlideMenu_View

+ (id)sharedInstance
{
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[[self class] alloc] init];
    });
    
    return _sharedInstance;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    frame = [[[UIApplication sharedApplication] delegate] window].frame;
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        transparentBgView = [[UIView alloc] initWithFrame:frame];
        [transparentBgView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6]];
        [transparentBgView setAlpha:0];
        transparentBgView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        //*
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecognized:)];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecognized:)];
        [transparentBgView addGestureRecognizer:tap];
        [transparentBgView addGestureRecognizer:pan];
        //*/
        
        [self addSubview:transparentBgView];
        
        frame.size.width = 280;
        self.menuContainerV = [[UIView alloc] initWithFrame:frame];
        CALayer *l = self.menuContainerV.layer;
        l.shadowColor = [UIColor blackColor].CGColor;
        l.shadowOffset = CGSizeMake(10, 0);
        l.shadowOpacity = 1;
        l.masksToBounds = NO;
        l.shadowRadius = 10;
        self.menuContainerV.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        
        [self addSubview: self.menuContainerV];
        hidden = YES;
    }
    
    //----- SETUP DEVICE ORIENTATION CHANGE NOTIFICATION -----
    UIDevice *device = [UIDevice currentDevice];
    [device beginGeneratingDeviceOrientationNotifications];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:device];
    
    lastOrientation = [[UIDevice currentDevice] orientation];
    
    return self;
}

//********** ORIENTATION CHANGED **********
- (void)orientationChanged:(NSNotification *)note
{
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    if(orientation == UIDeviceOrientationPortrait || orientation == UIDeviceOrientationLandscapeLeft || orientation == UIDeviceOrientationLandscapeRight){
        NSLog(@"%ld",(long)orientation);
        if(!hidden && lastOrientation != orientation){
            [self hideSlideMenu];
            hidden = YES;
            lastOrientation = orientation;
        }
    }
}

- (void)showSlideMenu {
    UIWindow* window = [[[UIApplication sharedApplication] delegate] window];
    self.frame = CGRectMake(0, 0, window.frame.size.width, window.frame.size.height);
    
    [self.menuContainerV setTransform:CGAffineTransformMakeTranslation(-window.frame.size.width, 0)];
    
    [window addSubview:self];
    //    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.menuContainerV setTransform:CGAffineTransformIdentity];
        [transparentBgView setAlpha:1];
    } completion:^(BOOL finished) {
        NSLog(@"Show complete!");
        hidden = NO;
    }];
}

- (void)gestureRecognized:(UIGestureRecognizer *)recognizer
{
    if ([recognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        [self hideSlideMenu];
    } else if ([recognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        static CGFloat startX;
        if (recognizer.state == UIGestureRecognizerStateBegan) {
            startX = [recognizer locationInView:self.window].x;
        } else
            if (recognizer.state == UIGestureRecognizerStateChanged) {
                CGFloat touchLocX = [recognizer locationInView:self.window].x;
                if (touchLocX < startX) {
                    [self.menuContainerV setTransform:CGAffineTransformMakeTranslation(touchLocX - startX, 0)];
                }
            } else
                if (recognizer.state == UIGestureRecognizerStateEnded) {
                    [self hideSlideMenu];
                }
    }
}

- (void)hideSlideMenu
{
    UIWindow* window = [[[UIApplication sharedApplication] delegate] window];
    window.backgroundColor = [UIColor clearColor];
    [UIView animateWithDuration:0.5 animations:^{
        [self.menuContainerV setTransform:CGAffineTransformMakeTranslation(-self.window.frame.size.width, 0)];
        [transparentBgView setAlpha:0];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.menuContainerV setTransform:CGAffineTransformIdentity];
        
        //        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        hidden = YES;
        NSLog(@"Hide complete!");
    }];
}

- (BOOL)isShown
{
    return !hidden;
}

@end
