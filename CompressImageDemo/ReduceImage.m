//
//  ReduceImage.m
//  ISSP
//
//  Created by bjike on 16/9/13.
//  Copyright © 2016年 bjike. All rights reserved.
//

#import "ReduceImage.h"

@implementation ReduceImage

typedef NS_ENUM(NSInteger,CompressType){
     session = 800,
     timeline = 1280
};
//生成缩略图
+(NSData *)base64ImageThumbnaiWith:(UIImage *)image{
    
    UIImage * nImage = nil;
    //CGSizeMake(100, 100)
    ReduceImage * reduce = [ReduceImage new];
    CGSize size = [reduce imageSize:image.size andType:timeline];
   
    if (image == nil) {
        
        nImage = nil;
        
    }else{
        
        UIGraphicsBeginImageContext(size);
        
        [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        
        nImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
    }
    
    UIImage *baseImage = nImage;
    
    NSData * data = UIImageJPEGRepresentation(baseImage, 0.5);
    return data;
}
-(CGSize)imageSize:(CGSize)size andType:(CompressType)type{
    //计算大小
    CGFloat boundary = 1280;
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    if (width <= boundary || height <= boundary) {
        return CGSizeMake(width, height);
    }
    int proportion = MAX(width, height)/MIN(width, height);
    if (proportion <= 2) {
        int x = MAX(width, height)/boundary;
        if (width > height) {
            width = boundary;
            height = height/x;
        }else{
            width = width/x;
            height = boundary;
        }
    }else{
        if (MIN(width, height)>=boundary) {
            boundary = type == session?800:1280;
            int x = MIN(width, height)/boundary;
            if (width<height) {
                width = boundary;
                height = height/x;
            }else{
                width = width/x;
                height = boundary;
            }
        }
    }
    return CGSizeMake(width, height);

}
@end
