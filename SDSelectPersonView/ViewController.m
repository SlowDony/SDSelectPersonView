//
//  ViewController.m
//  SDSelectPersonView
//
//  Created by apple on 2016/12/29.
//  Copyright © 2016年 slowdony. All rights reserved.
//

#import "ViewController.h"
#import "SDSelectPersonView.h"


#define mDeviceWidth [UIScreen mainScreen].bounds.size.width        //屏幕宽
#define mDeviceHeight [UIScreen mainScreen].bounds.size.height      //屏幕高
//color
#define mRGB(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define mHexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define mHexRGBAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]
#define fontHightColor mHexRGB(0x3c3c3c) //字体深色
#define fontNomalColor mHexRGB(0xa0a0a0) //字体浅色
#define bjBlueColor mHexRGB(0x151f41) //主题蓝色
#define bjColor mHexRGB(0xf7f7f7)  //背景深灰色 mHexRGB(0xe4e4e4):浅灰
#define borderCol mHexRGB(0xe4e4e4)    //border颜色
#define mainColor   [UIColor colorWithPatternImage:[UIImage imageNamed:@"mainColor"]]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUI{

    [self addLab:@"选择人" andtextViewTag:1004 andH:250];
    
    //接访添加选择人员按钮
    UIButton *jiefangbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    jiefangbtn.frame = CGRectMake(mDeviceWidth-40, 212.5+50, 25, 25);
    
    [jiefangbtn setImage:[UIImage imageNamed:@"img_addperson"] forState:UIControlStateNormal];
    [jiefangbtn  addTarget:self action:@selector(jiefangbtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: jiefangbtn];
    
}
-(void)jiefangbtn{
    
    NSString *rootStr =[[NSBundle mainBundle]pathForResource:@"selectPersonData" ofType:@"plist"];
    NSDictionary *rootDic =[[NSDictionary alloc]initWithContentsOfFile:rootStr];
    NSLog(@"rootDic:%@",rootDic);
    
    UITextView *StaffNameT =[self.view viewWithTag:1004]; //接访人
    SDSelectPersonView *selectView = [[SDSelectPersonView alloc]initWithFrame:CGRectMake(0, 0, mDeviceWidth , mDeviceHeight) WithDic:rootDic];
    selectView.valueDicBlock =^(NSMutableDictionary *dic){
        
        StaffNameT.text =dic[@"StaffName"];
       
        NSLog(@"dic:%@",dic);
        
    };
    [self.view addSubview:selectView];
}

#pragma mark - 布局label和输入框View
-(void)addLab:(NSString *)leftStr andtextViewTag:(NSInteger) tag andH:(CGFloat )h{
    //
    UILabel *leftlabel = [[UILabel alloc] init];
    leftlabel.frame = CGRectMake(0, h, 100, 50);
    leftlabel.backgroundColor = [UIColor clearColor];
    leftlabel.textColor = fontHightColor;
    leftlabel.text =[NSString stringWithFormat:@"%@:",leftStr];
    leftlabel.textAlignment = NSTextAlignmentRight;
    leftlabel.font = [UIFont systemFontOfSize:15];
    leftlabel.numberOfLines = 0;
    [self.view addSubview:leftlabel];
    
    UITextView *textV =[[UITextView alloc]init];

    textV.frame =CGRectMake(110, h+10, mDeviceWidth-160, 30);
    textV.editable=NO;
    textV.tag=tag;
    
    textV.backgroundColor = [UIColor clearColor];
    textV.textColor = fontHightColor;
    textV.textAlignment = NSTextAlignmentLeft;
    textV.font = [UIFont systemFontOfSize:15];
    textV.layer.cornerRadius=2;
    textV.layer.masksToBounds=YES;
    textV.layer.borderWidth=0.5;
    textV.layer.borderColor=borderCol.CGColor;
    
    [self.view addSubview:textV];
}

@end
