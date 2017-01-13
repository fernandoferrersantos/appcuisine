//
//  DetailViewController.m
//  appcuisineObjC
//
//  Created by Fernando Ferrer Santos on 13/1/17.
//  Copyright © 2017 Fernando Ferrer Santos. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (strong, nonatomic) UIImage *photo;

@end

@implementation DetailViewController

- (instancetype)initWithImage:(UIImage *)image {
    self = [super init];
    if (self) {
        self.photo = image;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIImageView *photoView = [[UIImageView alloc] initWithImage:self.photo];
    UIImageView *photoView = [[UIImageView alloc] initWithFrame:self.view.frame];
    photoView.image = self.photo;
    [self.view addSubview:photoView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
