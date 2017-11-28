//
//  ViewController.m
//  graph_gary_algorithm
//
//  Created by chen liang on 2017/11/27.
//  Copyright © 2017年 chen liang. All rights reserved.
//

#import "ViewController.h"
#import "graph_gray.h"

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
    CGDataProviderRef
    UIImage *image = [UIImage imageNamed:@"201052564110453.jpg"];
    float width = CGImageGetWidth(image.CGImage);
    float height = CGImageGetHeight(image.CGImage);
    uint32_t *inputPixls = (uint32_t *)calloc(width * height, sizeof(uint32_t));
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGContextRef contextRef = CGBitmapContextCreate(inputPixls, width, height, 8, width  * 4, colorSpaceRef, kCGBitmapByteOrderDefault|kCGImageAlphaPremultipliedLast);
    CGContextDrawImage(contextRef, CGRectMake(0, 0, width, height), image.CGImage);
    grah_gary_process(inputPixls, width, height, GrayTypeWeight);
    CGImageRef newImageRef = CGBitmapContextCreateImage(contextRef);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    CGColorSpaceRelease(colorSpaceRef);
    CGContextRelease(contextRef);
    CGImageRelease(newImageRef);
    free(inputPixls);
    _iconOne.image = newImage;
    _iconTwo.image = [UIImage imageNamed:@"201052564110453.jpg"];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
