//
//  RMYouTubeExtractorDemoTableViewController.m
//  RMYouTubeExtractorDemo
//
//  Created by Rune Madsen on 2014-04-26.
//  Copyright (c) 2014 The App Boutique. All rights reserved.
//

#import "RMYouTubeExtractorDemoTableViewController.h"
#import "RMYouTubeExtractor.h"
@import MediaPlayer;

@interface RMYouTubeExtractorDemoTableViewController ()

@property (nonatomic, strong) NSArray *videoArray;
@property (nonatomic, strong) MPMoviePlayerController *moviePlayerController;

@end

@implementation RMYouTubeExtractorDemoTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

static NSString *CellIdentifier = @"CellIdentifier";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"RMYouTubeExtractor Demo"];
    
    self.moviePlayerController = [[MPMoviePlayerController alloc] init];
    [self.moviePlayerController.view setFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), ((CGRectGetWidth(self.tableView.frame) / 16) * 9))];
    self.moviePlayerController.movieSourceType = MPMovieSourceTypeFile;
    [self.moviePlayerController setAllowsAirPlay:YES];
    [self.tableView setTableHeaderView:self.moviePlayerController.view];
    
    self.videoArray = [[NSArray alloc] init];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
    [[RMYouTubeExtractor sharedInstance] extractVideoForIdentifier:@"MVt32qoyhi0"
                                                        completion:^(NSDictionary *videoDictionary, NSError *error) {
                                                            if (!error) {
                                                                NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:[[videoDictionary allKeys] count]];
                                                                for (NSString *key in videoDictionary) {
                                                                    if (videoDictionary[key] != [NSNull null]) {
                                                                        [mutableArray addObject:@{ @"quality" : key, @"url" : videoDictionary[key] }];
                                                                    }
                                                                }
                                                                self.videoArray = [mutableArray copy];
                                                                [self.tableView reloadData];
                                                            } else {
                                                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"An Error Occurred"
                                                                                                                    message:[error localizedFailureReason]
                                                                                                                   delegate:nil
                                                                                                          cancelButtonTitle:nil
                                                                                                          otherButtonTitles:@"OK", nil];
                                                                [alertView show];
                                                            }
                                                        }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.videoArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSNumber *quality = self.videoArray[indexPath.row][@"quality"];
    [cell.textLabel setText:[self qualityStringForQuality:quality]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.moviePlayerController setContentURL:self.videoArray[indexPath.row][@"url"]];
    [self.moviePlayerController play];
}

-(NSString*)qualityStringForQuality:(NSNumber*)quality {
    switch ([quality longValue]) {
        case RMYouTubeExtractorVideoQualitySmall240:
            return @"Small 240p";
            break;
        case RMYouTubeExtractorVideoQualityMedium360:
            return @"Medium 360p";
            break;
        case RMYouTubeExtractorVideoQualityHD720:
            return @"HD 720p";
            break;
        case RMYouTubeExtractorVideoQualityHD1080:
            return @"HD 1080p";
            break;
        default:
            return @"Unknown";
            break;
    }
}

@end
