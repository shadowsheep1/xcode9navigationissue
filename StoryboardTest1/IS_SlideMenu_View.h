//
//  IS_SlideMenu_View.h
//  StoryboardTest1
//
//  Created by Fabio Bombardi on 27/09/2017.
//  Copyright © 2017 Fabio Bombardi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IS_SlideMenu_View : UIView <UIGestureRecognizerDelegate>
{
    UIView* transparentBgView;
    BOOL hidden;
    int lastOrientation;
}

@property (strong, nonatomic) UIView *menuContainerV;

+ (id)sharedInstance;

- (BOOL)isShown;
- (void)hideSlideMenu;
- (void)showSlideMenu;

@end
