//
//  ViewController.m
//  planetario
//
//  Created by Patricia Muñoz Quiros on 18/11/13.
//  Copyright (c) 2013 Israel Diaz Ortiz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize capa;
@synthesize tierra;
@synthesize nave;


- (void)viewDidLoad
{
    [super viewDidLoad];


    capa = [CALayer layer];
    capa.bounds = CGRectMake(0, 0, 200, 200);
    capa.position = self.view.center;
    //capa.backgroundColor = [UIColor whiteColor].CGColor;
    capa.cornerRadius =100;
    capa.borderWidth = 1.5;
    capa.borderColor = [UIColor whiteColor].CGColor;
    
    
    tierra = [CALayer layer];
    tierra.bounds = CGRectMake(0, 0, 50, 50);
    tierra.position = CGPointMake(100, 0);
    tierra.backgroundColor = [UIColor blueColor].CGColor;
    tierra.cornerRadius = 25;
    
    
    nave = [CALayer layer];
    //capa.backgroundColor = [UIColor whiteColor].CGColor;
    nave.contents = (id) [UIImage imageNamed:@"nave"].CGImage;
    nave.bounds = CGRectMake(0, 0, 350, 150);
    nave.position = CGPointMake(-150, 400);
    
    
    
    CALayer *luna = [CALayer layer];
    luna.bounds = CGRectMake(0, 0, 10, 10);
    luna.position = CGPointMake(5, -25);
    luna.backgroundColor = [UIColor grayColor].CGColor;
    luna.cornerRadius = 5;
    


    [self.view.layer addSublayer:capa];
    [capa addSublayer:tierra];
    [tierra addSublayer:luna];
    
    //[capa addSublayer:nave];
     [self.view.layer addSublayer:nave];
    


}


- (IBAction)animar:(id)sender {
    
    CABasicAnimation * rotationanimation =[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    float angulo = 3*360*M_PI/180;
    rotationanimation.toValue = [NSNumber numberWithFloat:angulo];
    rotationanimation.duration  = 10.0;
    
    [tierra addAnimation:rotationanimation forKey:@"animacion"];
    [capa addAnimation:rotationanimation forKey:@"animacion"];
    
    CABasicAnimation * thenaveanimation = [CABasicAnimation animationWithKeyPath:@"transform.translation"];

    
    thenaveanimation.duration= 10.0;
    thenaveanimation.toValue = [NSNumber numberWithFloat:700];
    

    [nave addAnimation:thenaveanimation forKey:@"animacionlayer"];
    
    
    }








- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
