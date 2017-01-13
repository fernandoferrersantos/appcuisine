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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
