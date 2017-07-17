//
//  MovableView.m
//  Gestures
//
//  Created by user on 21.06.17.
//  Copyright © 2017 iPodium. All rights reserved.
//

#import "MovableView.h"

@interface MovableView ()

@property (nonatomic, assign) CGAffineTransform beginTransform;

@end

@implementation MovableView

+ (MovableView *)view {
    MovableView *view = [[MovableView alloc] initWithFrame:CGRectMake(0, 0, 80, 120)];
    view.backgroundColor = [UIColor whiteColor];
    
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self addGestureRecognizers];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    [self addGestureRecognizers];
    
    return self;
}

- (void)addGestureRecognizers {
    [self addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(didLongTap:)]];
    [self addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didPan:)]];
}

- (void)didLongTap:(UILongPressGestureRecognizer *)gestureRecognizer {
    [self removeFromSuperview];
}

- (void)didPan:(UIPanGestureRecognizer *)gestureRecognizer {
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            self.beginTransform = self.transform;
            break;
        case UIGestureRecognizerStateChanged: {
            CGPoint translation = [gestureRecognizer translationInView:self];
            [self transformWithTranslation:translation];
        }
            break;
        default:
            break;
    }
}

- (void)transformWithTranslation:(CGPoint)translation {
    self.transform = CGAffineTransformTranslate(self.transform, translation.x, translation.y);
}

@end
