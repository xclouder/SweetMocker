//
//  XCDocument.m
//  SweetMocker
//
//  Created by 云轩 on 13-10-22.
//  Copyright (c) 2013年 xClouder. All rights reserved.
//

#import "XCDocument.h"
#import "XCMockConfig.h"
#import "XCMockData.h"
#import "XCOneMock.h"

@interface XCDocument () <NSTableViewDataSource, NSTableViewDelegate, NSComboBoxDataSource, NSComboBoxDelegate, NSTextFieldDelegate, NSTextViewDelegate>

@property (nonatomic, strong) XCMockConfig *mockConfig;
@property (weak) IBOutlet NSTableView *urlTableView;
@property (weak) IBOutlet NSTableView *responseTableView;
@property (weak) IBOutlet NSTextField *urlText;
@property (unsafe_unretained) IBOutlet NSTextView *contentTextView;
@property (weak) IBOutlet NSComboBox *comboBox;

@property (nonatomic, strong) XCMockData *editingMock;
@property (nonatomic, strong) XCOneMock *editingOneMock;

@end

@implementation XCDocument

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"XCDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
    
//    [self setUndoManager:nil];
    self.contentTextView.automaticQuoteSubstitutionEnabled = NO;
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    NSDictionary *dict = [self.mockConfig dataDictionary];
    NSError *err = nil;
    if (dict) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&err];
        
        if (data && !err) {
            return data;
        }
        else
        {
            NSLog(@"write config failed");
            return nil;
        }
    }
    
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    NSError *err = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
    if ([dict isKindOfClass:[NSDictionary class]]) {
        XCMockConfig *cfg = [XCMockConfig parseFromDictionary:dict];
        if (cfg) {
            self.mockConfig = cfg;
        }
        else
        {
            NSLog(@"mock config parse error");
            return NO;
        }
    }
    else
    {
        NSLog(@"error, file content is not a dictionary json");
        return NO;
    }
    
//    NSArray *mocks = self.mockConfig.mocksArrayForEdit;
    [self refreshUI];
    
    return YES;
}

#pragma mark - Private Methods
- (void)refreshUI
{
    
    [self.urlTableView reloadData];
    
    [self.responseTableView reloadData];
}

- (NSInteger)indexOfMockData:(XCMockData *)mock
{
    return [self.mockConfig.mocksArrayForEdit indexOfObject:mock];
}

- (XCMockData *)mockDataAtIndex:(NSInteger)row
{
    NSArray *arr = self.mockConfig.mocksArrayForEdit;
    if (row < arr.count) {
        XCMockData *m = arr[row];
        return m;
    }
    else
    {
        NSLog(@"out of range > mockData AtIndex");
        
        return nil;
    }
}

- (XCOneMock *)oneMockForMockData:(XCMockData *)mock atIndex:(NSInteger)index
{
    if (!mock) {
        return nil;
    }
    
    if (index < mock.oneMocksForEdit.count) {
        return mock.oneMocksForEdit[index];
    }
    else
    {
        NSLog(@"out of range > one mock");
        return nil;
    }
}

- (NSInteger)indexForSelectedResponseKeyWithMockData:(XCMockData *)mock
{
    if (!mock) {
        return 0;
    }
    else
    {
        NSArray *oneMocks = mock.oneMocksForEdit;
        NSInteger i = 0;
        for (XCOneMock *m in oneMocks) {
            if ([m.key isEqualToString:mock.valueKey])
            {
                return i;
            }
            i++;
        }
        
        return 0;
    }
}

- (void)markDirty
{
//    [self. setDocumentEdited:YES];
    [self updateChangeCount:1];
}

- (void)resetDetailData
{

    [self.responseTableView reloadData];
    
    [self.comboBox reloadData];
    
    self.comboBox.stringValue = @"";

    self.contentTextView.string = @"";
    self.urlText.stringValue = @"";
}

- (void)refreshDetailData
{
    [self.responseTableView reloadData];
    
    [self.comboBox reloadData];
    
    //自动选中comboBox
    NSInteger index = [self indexForSelectedResponseKeyWithMockData:self.editingMock];
    if (index >=0 && index < self.editingMock.oneMocksForEdit.count) {
        [self.comboBox selectItemAtIndex:index];
    }
    
    //取消选中responseTable
    [self.responseTableView deselectAll:nil];
    self.editingOneMock = nil;
    self.contentTextView.string = @"";
}

#pragma mark - IBActions
- (IBAction)addMockData:(id)sender {
    XCMockData *newMock = [[XCMockData alloc] init];
    newMock.url = @"new url";
    
    newMock.oneMocksForEdit = [NSMutableArray array];
    NSAssert(newMock.oneMocksForEdit!=nil, @"isnil");
    XCOneMock *defOneMock = [[XCOneMock alloc] init];
    defOneMock.key = @"success";
    defOneMock.value = @"response json here";
    [newMock.oneMocksForEdit addObject:defOneMock];
    newMock.valueKey = defOneMock.key;
    
    if (self.mockConfig == nil) {
        self.mockConfig = [[XCMockConfig alloc] init];
        self.mockConfig.mocksArrayForEdit = [NSMutableArray array];
    }
    
    NSAssert(self.mockConfig.mocksArrayForEdit!=nil, @"isnil");
    [self.mockConfig.mocksArrayForEdit addObject:newMock];
    
    //add row
    [self.urlTableView beginUpdates];
    [self.urlTableView insertRowsAtIndexes:[NSIndexSet indexSetWithIndex:self.mockConfig.mocksArrayForEdit.count - 1] withAnimation:NSTableViewAnimationEffectNone];
    [self.urlTableView endUpdates];
    
    [self markDirty];
}
- (IBAction)removeMockData:(id)sender {
    NSInteger row = [self.urlTableView selectedRow];
    if (row >=0 && row < self.mockConfig.mocksArrayForEdit.count) {
        
        [self.mockConfig.mocksArrayForEdit removeObjectAtIndex:row];
        
        [self.urlTableView beginUpdates];
        [self.urlTableView removeRowsAtIndexes:[NSIndexSet indexSetWithIndex:row] withAnimation:NSTableViewAnimationEffectNone];
        [self.urlTableView endUpdates];
        
        self.editingMock = nil;
        self.editingOneMock = nil;
        [self resetDetailData];
        
        [self markDirty];
    }
    else
    {
        NSLog(@"out of range > remove Mock");
    }
}
- (IBAction)addResponse:(id)sender {
    if (self.editingMock) {
        XCOneMock *oneMock = [[XCOneMock alloc] init];
        oneMock.key = @"new mock";
        oneMock.value = @"mock text";
        
        [self.editingMock.oneMocksForEdit addObject:oneMock];
        
        [self.responseTableView beginUpdates];
        
        [self.responseTableView insertRowsAtIndexes:[NSIndexSet indexSetWithIndex:self.editingMock.oneMocksForEdit.count - 1] withAnimation:NSTableViewAnimationEffectNone];
        
        [self.responseTableView endUpdates];
        
        [self markDirty];
    }
    else
    {
        NSLog(@"no mock data selected");
    }
}
- (IBAction)removeResponse:(id)sender {
    
    NSInteger row = [self.responseTableView selectedRow];

    if (row >=0 && row < self.editingMock.oneMocksForEdit.count) {

        if ([self.editingOneMock.key isEqualToString:self.editingMock.valueKey])
        {
            self.editingMock.valueKey = @"";
        }
        
        [self.editingMock.oneMocksForEdit removeObjectAtIndex:row];
        
        [self.responseTableView reloadData];
        
        self.editingOneMock = nil;
        self.contentTextView.string = @"";
        [self.comboBox reloadData];

    }
}

- (IBAction)formatJson:(id)sender {
    NSString *str = self.contentTextView.string;
    if (str.length > 0) {
        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err = nil;
        
        id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        if (obj && !err) {
            NSData *formattedData = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:&err];
            NSString *formatted = [[NSString alloc] initWithData:formattedData encoding:NSUTF8StringEncoding];
            if (!err) {
                self.contentTextView.string = formatted;
                self.editingOneMock.value = formatted;
                
                [self markDirty];
            }
        }
        else
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert addButtonWithTitle:@"确定"];
            [alert setMessageText:@"提示"];
            [alert setInformativeText:@"json格式错误"];
            [alert setShowsHelp:NO];
            [alert setAlertStyle:NSWarningAlertStyle];
            alert.showsSuppressionButton = YES;
            
            [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow modalDelegate:self didEndSelector:nil contextInfo:nil];
        }
    }
}

#pragma mark - Table View DataSource & Delegate
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    if (tableView == self.urlTableView)
    {
        return self.mockConfig.mocksArrayForEdit.count;
    }
    else
    {
        return self.editingMock.oneMocksForEdit.count;
    }
}

- (void)tableViewSelectionDidChange: (NSNotification *) notification
{
    
}

- (void)tableView:(NSTableView *)tableView setObjectValue:(id)anObject forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    if (tableView == self.urlTableView) {
        if ([tableColumn.identifier isEqualToString:@"enable"]) {
            [self mockDataAtIndex:row].isEnabled = [anObject boolValue];
            [self markDirty];
        }
    }
    else
    {
        if (self.editingOneMock) {
            self.editingOneMock.key = [anObject description];
        }
        else
        {
            NSLog(@"no editing onemock");
        }
    }
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    if (tableView == self.urlTableView) {
        XCMockData *mock = [self mockDataAtIndex:row];
        if ([tableColumn.identifier isEqualToString:@"enable"]) {
            return @(mock.isEnabled);
        }
        
        if ([tableColumn.identifier isEqualToString:@"url"]) {
            return mock.url;
        }
    }
    else
    {
        XCOneMock *oneMock = [self oneMockForMockData:self.editingMock atIndex:row];
        return oneMock.key;
    }
    
    return nil;
}

- (BOOL)tableView:(NSTableView *)tableView shouldEditTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    if (tableView == self.urlTableView) {
        self.urlText.value = [self mockDataAtIndex:row].url;
        return NO;
    }
    else
    {
        
        return YES;
    }

}

- (BOOL)tableView:(NSTableView *)tableView shouldSelectTableColumn:(NSTableColumn *)tableColumn
{
    return NO;
}

- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row
{
    if (tableView == self.urlTableView) {
        //----选择一行后，显示相应数据
        XCMockData *mock = [self mockDataAtIndex:row];
        self.urlText.stringValue = mock.url;
        
        NSLog(@"selected url:%@", mock.url);

        self.editingMock = mock;
        
        [self refreshDetailData];
    }
    else
    {
        XCOneMock *oneMock = [self oneMockForMockData:self.editingMock atIndex:row];
        NSLog(@"selected key:%@;its val:%@; obj:%@", oneMock.key, oneMock.value, oneMock);
        
        self.editingOneMock = oneMock;
        self.contentTextView.string = oneMock.value;
        
//        NSLog(@"data:\n%@", [self.mockConfig dataDictionary]);
    }
    
    return YES;
}

#pragma mark - ComboBox
- (NSInteger)numberOfItemsInComboBox:(NSComboBox *)aComboBox
{
    return self.editingMock.oneMocksForEdit.count;
}

- (id)comboBox:(NSComboBox *)aComboBox objectValueForItemAtIndex:(NSInteger)index
{
    return [self oneMockForMockData:self.editingMock atIndex:index].key;
}

- (void)comboBoxSelectionDidChange:(NSNotification *)notification
{
    NSComboBox *comboBox = notification.object;
    
    NSInteger index = [comboBox indexOfSelectedItem];
    if (index >= 0) {
        NSString *val = [self oneMockForMockData:self.editingMock atIndex:index].key;
        if (val.length > 0) {
//            NSLog(@"key:%@", val);
            if (![self.editingMock.valueKey isEqualToString:val])
            {
                self.editingMock.valueKey = val;
                [self markDirty];
            }
        }
    }

}

#pragma mark - TextField Delegate
- (void)controlTextDidEndEditing:(NSNotification *)obj
{
    id sender = obj.object;
    if (sender == self.urlText) {
        NSString *val = [sender stringValue];
        if (val.length > 0) {
            if (![val isEqualToString:self.editingMock.url]) {
                self.editingMock.url = val;
                
                NSInteger index = [self indexOfMockData:self.editingMock];
                if (index >= 0) {
                    [self.urlTableView reloadDataForRowIndexes:[NSIndexSet indexSetWithIndex:index] columnIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 2)]];
                }
                [self markDirty];
            }
        }
    }
}

//- (void)textDidEndEditing:(NSNotification *)notification
//{
//    id sender = notification.object;
//    if (sender == self.contentTextView) {
//        if (self.editingOneMock) {
//            NSString *val = self.contentTextView.string;
//            if (val == nil) {
//                val = @"";
//            }
//            self.editingOneMock.value = val;
//            
//            [self markDirty];
//        }
//    }
//}

- (void)textDidChange:(NSNotification *)notification
{
    id sender = notification.object;
    if (sender == self.contentTextView) {
        if (self.editingOneMock) {
            NSString *val = [self.contentTextView.string copy];
            if (val == nil) {
                val = @"";
            }
            self.editingOneMock.value = val;
            NSLog(@"textView.text:%@", val);
            
            [self markDirty];
            
//            NSLog(@"data:\n%@", [self.mockConfig dataDictionary]);
        }
    }
}



@end
