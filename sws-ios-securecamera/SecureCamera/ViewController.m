/*
 * Copyright (c) 2015 BlackBerry Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//  ViewController.m
//  SecureCamera


#import "ViewController.h"
#import "TableViewController.h"


@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UIToolbar *toolBar;


@property (nonatomic) UIImagePickerController *imagePickerController;
@property (nonatomic) NSMutableArray *capturedImages;
@property (nonatomic, strong) NSURL *currentFileURL;

@property(nonatomic,strong) UIDocumentInteractionController *_docController;

- (IBAction)openDocInteraction:(id)sender;

@end


@implementation ViewController

static NSString * const CollectionSegue = @"showCollection";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.capturedImages = [[NSMutableArray alloc] init];
    [self showImagePickerForSourceType:UIImagePickerControllerSourceTypeCamera];
}

- (IBAction)showImagePickerForCamera:(id)sender
{
    [self showImagePickerForSourceType:UIImagePickerControllerSourceTypeCamera];
}

- (void)showImagePickerForSourceType:(UIImagePickerControllerSourceType)sourceType
{
    if (self.imageView.isAnimating)
    {
        [self.imageView stopAnimating];
    }

    if (self.capturedImages.count > 0)
    {
        [self.capturedImages removeAllObjects];
    }

    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    imagePickerController.sourceType = sourceType;
    imagePickerController.delegate = self;
    
    self.imagePickerController = imagePickerController;
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

#pragma mark - UIViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:CollectionSegue])
    {
        //
    }
}

- (void)finishAndUpdate
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    // To be ready to start again, clear the captured images array.
    if ([self.capturedImages count] > 0)
    {
        // To be ready to start again, clear the captured images array.
        [self.capturedImages removeAllObjects];
    }
    
    self.imagePickerController = nil;
}

#pragma mark - UIImagePickerControllerDelegate

// This method is called when an image has been chosen from the library or taken from the camera.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *preview_image = [info valueForKey:UIImagePickerControllerOriginalImage];
    [self.capturedImages addObject:preview_image];
    
    //Save Image
    if ([self.capturedImages count] > 0)
    {
        // Format image filename as "IMG-YYYYMMDD-HHMMSS.png"
        NSString *timestamp;
        NSDate *now = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyMMdd-HHmmss"];
        timestamp = [dateFormatter stringFromDate:now];
        
        NSLog(@"timestamp %@", timestamp);
        
        // Save the image to Documents directory
        NSLog(@"%f,%f",preview_image.size.width, preview_image.size.height);
        
        NSString* imagePath = [NSString stringWithFormat:@"%@/IMG-%@.png",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject], timestamp];
        NSLog(@"path %@", imagePath);

        UIGraphicsBeginImageContext(CGSizeMake(320.0,480.0));
        [preview_image drawInRect:CGRectMake(0, 0, 320, 480)];
        
        UIImage *saved_image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [UIImagePNGRepresentation(saved_image) writeToFile:imagePath atomically:YES];
        
        NSLog(@"%f,%f",saved_image.size.width,saved_image.size.height);
        NSLog(@"saving image done");
        
        //Show it on image view
        self.imageView.image = saved_image;
        self.currentFileURL = [NSURL fileURLWithPath:imagePath];
    }
    [self finishAndUpdate];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)openDocInteraction:(id)sender
{
    
    if(self.currentFileURL.isFileURL)
    {
        //checks if docInteractionController has been initialized with the URL
        if (self._docController == nil)
        {
            self._docController = [UIDocumentInteractionController interactionControllerWithURL:self.currentFileURL];
            self._docController.delegate = self;
        }
        else
        {
            self._docController.URL = self.currentFileURL;
        }
        
        [self._docController presentOptionsMenuFromRect:self.view.frame inView:self.view animated:YES];
    }
}

#pragma mark - File system support

- (NSString *)applicationDocumentsDirectory
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}


@end

