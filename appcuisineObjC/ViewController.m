//
//  ViewController.m
//  appcuisineObjC
//
//  Created by Fernando Ferrer Santos on 13/1/17.
//  Copyright © 2017 Fernando Ferrer Santos. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *resultsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    self.view.
    
    [self callService];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)callService {
    // GCD
    dispatch_async(dispatch_queue_create("search", 0), ^{
        NSURL *url = [NSURL URLWithString:@"https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY"];
        
        NSError *error;
        NSData *jsonData = [NSData dataWithContentsOfURL:url
                                                 options:NSDataReadingUncached
                                                   error:&error];
        
        if (jsonData != nil) {
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            
            self.resultsArray = [jsonDict objectForKey:@"photos"];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        } else {
            [self alertNoResults];
        }
        
    });
}

- (void)alertNoResults {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No results"
                                                                       message:nil
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action)
                                   {
                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                   }];
        
        [alert addAction:okAction];
        
        [self presentViewController:alert
                           animated:YES
                         completion:nil];
        
        
        // Delete results in table
        self.resultsArray = [NSMutableArray array];
        [self.tableView reloadData];
    });
}



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.resultsArray count];
}


#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"cellId";
    //    MarsRoverTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellId];
    //    if (cell == nil) {
    //        cell = [[MarsRoverTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
    //                                             reuseIdentifier:cellId];
    //    }
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellId];
    }
    
    NSDictionary *dict = [self.resultsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [[dict objectForKey:@"camera"] objectForKey:@"full_name"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
