//
//  ViewController.m
//  Gestures
//
//  Created by user on 21.06.17.
//  Copyright © 2017 iPodium. All rights reserved.
//

#import "ViewController.h"
#import "MovableView.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIView *containerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)openView:(id)sender {
    MovableView *movableView = [MovableView view];
    CGSize containerSize = self.containerView.frame.size;
    movableView.center = CGPointMake(containerSize.width / 2, containerSize.height / 2);
    [self.containerView addSubview:movableView];
}

@end
