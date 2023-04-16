//
//  ViewController.m
//  MovieAppObjc
//
//  Created by Christian Quicano on 2/24/22.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpUI];
    
}

- (void) setUpUI {
    UIColor* white = [UIColor whiteColor];
    [self.view setBackgroundColor:white];
}

@end
