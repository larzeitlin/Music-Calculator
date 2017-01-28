
#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface AppController : NSObject
{
@private
    int noteVal;
 

    IBOutlet NSTextField *octLabel;
    IBOutlet NSSlider *octSlider;
    IBOutlet NSSegmentedControl *noteSelector;
    IBOutlet NSTextField *MIDIVal;
    IBOutlet NSTextField *freqField;
    IBOutlet NSTextField *tuningField;
    IBOutlet NSTextField *BPMField;
    
}

- (IBAction)octSliderChange:(id)sender;
- (IBAction)noteChange:(id)sender;
- (IBAction)MIDIChange:(id)sender;
- (IBAction)tuningChange:(id)sender;
- (IBAction)BPMDivTwo:(id)sender;
- (IBAction)BPMTimesTwo:(id)sender;



- (void)updateOct;
- (void)updateNote;
- (void)updateMIDI;
- (void)updateFreq;
- (void)updateBPM;





@end
