//
//  ViewController.m
//  CompressImageDemo
//
//  Created by bjike on 2017/9/4.
//  Copyright © 2017年 来自任性傲娇的女王. All rights reserved.
//

#import "ViewController.h"
#import "ReduceImage.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *compressImageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *compressLabel;
@property (weak, nonatomic) IBOutlet UILabel *realLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageNamed:@"banner2"];
    
    NSData * data = UIImagePNGRepresentation(self.imageView.image);
    NSLog(@"正常图片大小：%.2fKB",data.length/1024.00);
    self.realLabel.text = [NSString stringWithFormat:@"%.2fKB",data.length/1024.00];

}

- (IBAction)getCompressImageClick:(id)sender {
    
    NSData * reduceData = [ReduceImage base64ImageThumbnaiWith:self.imageView.image];
    
    NSLog(@"压缩后获取图片大小：%.2fKB",reduceData.length/1024.00);

    self.compressImageView.image = [UIImage imageWithData:reduceData];
    
    self.compressLabel.text = [NSString stringWithFormat:@"%.2fKB",reduceData.length/1024.00];
    
}




@end
