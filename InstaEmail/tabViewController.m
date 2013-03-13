//
//  tabViewController.m
//  InstaEmail
//
//  Created by Jun Seki on 06/03/2013.
//  Copyright (c) 2013 com.junseki. All rights reserved.
//

#import "tabViewController.h"

@interface tabViewController ()

@end

@implementation tabViewController
@synthesize emailPicker;
@synthesize notesField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    activities = [[NSArray alloc]initWithObjects:@"sleeping",@"eating",@"working",@"thinking",@"crying",@"begging",@"leaving",@"shopping",@"hello worlding", nil];
    feelings=[[NSArray alloc]initWithObjects:@"awesome",@"sad",@"happy",@"ambivalent",@"nauseous",@"psyched",@"confused",@"hopeful",@"anxious",nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Picker Datasource Protocol

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component==0)
    {
        return [activities count];
    }
    else
    {
        return [feelings count];
    }
}

#pragma mark -
#pragma mark Picker Delegate Protocol

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component==0)
    {
        return [activities objectAtIndex:row];
    
    }
    else
    {
        return [feelings objectAtIndex:row];
    }
    return nil;
}

-(IBAction)sendEmailbutton:(id)sender
{
    NSString *notes = ([notesField.text length])?(notesField.text):@"hello";
    NSString *notes1 = ([notesField.text length]==0)?@"hello":notesField.text;
    NSLog(@"notes: %@",notes);
     NSLog(@"notes: %@",notes1);
         
    
    NSString *theMsg =[NSString stringWithFormat:@"%@ I'm %@ and feeling %@ about it.",notes,
                       [activities objectAtIndex:[emailPicker selectedRowInComponent:0]],
                       [feelings objectAtIndex:[emailPicker selectedRowInComponent:1]]];
    NSLog(@"%@",theMsg);
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailController=[[MFMailComposeViewController alloc] init];
        mailController.mailComposeDelegate=self;
        [mailController setSubject:@"Hello "];
        [mailController setMessageBody:theMsg isHTML:NO];
       [self presentModalViewController:mailController animated:YES];
    }
    else
    {
        NSLog(@"Sorry, you need to setup eamil first!");
    }
}

-(IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}

#pragma mark -
#pragma mark Mail composer delegate method

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
   [self dismissModalViewControllerAnimated:YES];
}


@end
