//
//  ViewController.m
//  graph_gary_algorithm
//
//  Created by chen liang on 2017/11/27.
//  Copyright © 2017年 chen liang. All rights reserved.
//

#import "ViewController.h"
#import "graph_gray.h"
#import "graph_threshold.h"
#import "UIImage+TransformToPixel.h"

@interface ViewController ()
{
    UIImageView *_icon;
}
@property (weak, nonatomic) IBOutlet UIImageView *iconOne;
@property (weak, nonatomic) IBOutlet UIImageView *iconTwo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _icon = [UIImageView new];
    UIImage *image = [UIImage imageNamed:@"201052564110453.jpg"];
    float width = CGImageGetWidth(image.CGImage);
    float height = CGImageGetHeight(image.CGImage);
    uint32_t *piexls = [image imageToPixelData];
    uint32_t *grayPiexls;
    uint32_t *thPiexls;
    uint32_t *thrTwo;
    grah_gary_process(piexls, &grayPiexls, width, height, GrayTypeWeight);
    graph_average_threshold(piexls, &thPiexls, width, height);
    graph_average_threshold(grayPiexls, &thrTwo, width, height);
    grah_gary_process(thPiexls, &thPiexls, width, height, GrayTypeWeight);
    UIImage *thImageOne = [UIImage pixelToImageData:thPiexls width:width height:height];
    UIImage *thImageTwo = [UIImage pixelToImageData:thrTwo width:width height:height];
    _iconOne.image = thImageOne;
    _iconTwo.image = thImageTwo;
    free(grayPiexls);
    free(thPiexls);
    free(thrTwo);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
