//
//  tabViewController.h
//  InstaEmail
//
//  Created by Jun Seki on 06/03/2013.
//  Copyright (c) 2013 com.junseki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface tabViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate,MFMailComposeViewControllerDelegate>
{
    NSArray *activities;
    NSArray *feelings;
    UIPickerView *emailPicker;
    UITextField *notesField;

}
@property(nonatomic,retain) IBOutlet UIPickerView *emailPicker;
@property(nonatomic,retain) IBOutlet UITextField *notesField;

-(IBAction) sendEmailbutton:(id)sender;
-(IBAction)textFieldDoneEditing:(id)sender;

@end
