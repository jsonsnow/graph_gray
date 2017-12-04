//
//  UIImage+TransformToPixel.m
//  graph_gary_algorithm
//
//  Created by chen liang on 2017/12/1.
//  Copyright © 2017年 chen liang. All rights reserved.
//

#import "UIImage+TransformToPixel.h"

@implementation UIImage (TransformToPixel)
- (uint32_t *)imageToPixelData {
    size_t width = CGImageGetWidth(self.CGImage);
    size_t height = CGImageGetHeight(self.CGImage);
    size_t bytesPerPiexl = 4;
    size_t bytesPerRow = bytesPerPiexl * width;
    size_t bitPerComponent = 8;
    uint32_t *piexls = malloc(width * height * bytesPerPiexl);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(piexls, width, height, bitPerComponent, bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
    CGRect rect = CGRectMake(0, 0, width, height);
    CGContextDrawImage(context, rect, self.CGImage);
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    return piexls;
}

+ (UIImage *)pixelToImageData:(uint32_t *)pixels width:(size_t)width height:(size_t)height {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pixels, width, height, 8, width * 4, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    UIImage *result = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return result;
}
@end
