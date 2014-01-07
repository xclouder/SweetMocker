//
//  XCDemoWindowController.m
//  SweetMocker
//
//  Created by 云轩 on 14-1-7.
//  Copyright (c) 2014年 xClouder. All rights reserved.
//

#import "XCDemoWindowController.h"
#import "XCDemoPrinter.h"

@interface XCDemoWindowController ()
@property (unsafe_unretained) IBOutlet NSTextView *demoTextView;

@end

@implementation XCDemoWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    self.demoTextView.string = [self createDemoForData:self.sourceData];
    
    id a= @{
            @"code" : @(0),
            @"process" : @[
  @[
      @(1),
      @(0),
      @(1),
      @(1),
      @(2613),
      @(105),
      @(1),
      @(0),
      @(8),
  @[
  @[
      @(0),
      @(215),
      @(1),
      @(1),
      @(0),
      @(37),
      @(163),
      @(200),
      @(200),
      @"A1 (普通)攻击 B1 37点,还剩163点",
      ],
  @[
      @(0),
      @(2),
      @(2),
      @(1),
      @(0),
      @(33),
      @(367),
      @(400),
      @(400),
      @"A1 (普通)攻击 B2 33点,还剩367点",
      ],
  @[
      @(0),
      @(3),
      @(3),
      @(1),
      @(0),
      @(31),
      @(369),
      @(400),
      @(400),
      @"A1 (普通)攻击 B3 31点,还剩369点",
      ],
  ],
      @(1),
      ],
  @[
      @(1),
      @(0),
      @(2),
      @(9),
      @(2611),
      @(19),
      @(2),
      @(0),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(2),
      @(0),
      @(-1),
      @(0),
      @(367),
      @(367),
      @(400),
      @"A2 没命中 B2",
      ],
  ],
      @(1),
      ],
  @[
      @(1),
      @(1),
      @(3),
      @(10),
      @(2612),
      @(53),
      @(3),
      @(0),
      @(7),
  @[
  @[
      @(2613),
      @(105),
      @(1),
      @(1),
      @(0),
      @(49),
      @(408),
      @(408),
      @(408),
      @"A3 (一般)治疗 A1 49点,还剩408点",
      ],
  ],
      @(1),
      ],
  @[
      @(1),
      @(0),
      @(4),
      @(9),
      @(7),
      @(1),
      @(5),
      @(0),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(2),
      @(1),
      @(0),
      @(440),
      @(0),
      @(367),
      @(400),
      @"A5 (普通)攻击 B2 440点,还剩0点",
      ],
  ],
      @(1),
      ],
  @[
      @(0),
      @(1),
      @(1),
      @(10),
      @(0),
      @(215),
      @(1),
      @(0),
      @(7),
  @[
  @[
      @(0),
      @(215),
      @(1),
      @(1),
      @(1),
      @(71),
      @(200),
      @(163),
      @(200),
      @"B1 (暴击)治疗 B1 71点,还剩200点",
      ],
  ],
      @(1),
      ],
  @[
      @(0),
      @(0),
      @(2),
      @(9),
      @(0),
      @(3),
      @(3),
      @(0),
      @(1),
  @[
  @[
      @(2612),
      @(53),
      @(3),
      @(1),
      @(0),
      @(13),
      @(599),
      @(612),
      @(612),
      @"B3 (普通)攻击 A3 13点,还剩599点",
      ],
  ],
      @(1),
      ],
  @[
      @(0),
      @(0),
      @(3),
      @(1),
      @(0),
      @(2),
      @(5),
      @(0),
      @(2),
  @[
  @[
      @(2613),
      @(105),
      @(1),
      @(1),
      @(0),
      @(160),
      @(248),
      @(408),
      @(408),
      @"B5 (普通)攻击 A1 160点,还剩248点",
      ],
  @[
      @(2611),
      @(19),
      @(2),
      @(1),
      @(0),
      @(135),
      @(1089),
      @(1224),
      @(1224),
      @"B5 (普通)攻击 A2 135点,还剩1089点",
      ],
  @[
      @(2612),
      @(53),
      @(3),
      @(1),
      @(0),
      @(142),
      @(457),
      @(599),
      @(612),
      @"B5 (普通)攻击 A3 142点,还剩457点",
      ],
  ],
      @(1),
      ],
  @[
      @(1),
      @(0),
      @(5),
      @(1),
      @(2613),
      @(105),
      @(1),
      @(0),
      @(8),
  @[
  @[
      @(0),
      @(215),
      @(1),
      @(1),
      @(0),
      @(36),
      @(164),
      @(200),
      @(200),
      @"A1 (普通)攻击 B1 36点,还剩164点",
      ],
  @[
      @(0),
      @(3),
      @(3),
      @(1),
      @(0),
      @(32),
      @(337),
      @(369),
      @(400),
      @"A1 (普通)攻击 B3 32点,还剩337点",
      ],
  ],
      @(2),
      ],
  @[
      @(1),
      @(0),
      @(6),
      @(9),
      @(2611),
      @(19),
      @(2),
      @(0),
      @(1),
  @[
  @[
      @(0),
      @(215),
      @(1),
      @(1),
      @(0),
      @(62),
      @(102),
      @(164),
      @(200),
      @"A2 (普通)攻击 B1 62点,还剩102点",
      ],
  ],
      @(2),
      ],
  @[
      @(1),
      @(1),
      @(7),
      @(10),
      @(2612),
      @(53),
      @(3),
      @(0),
      @(7),
  @[
  @[
      @(2613),
      @(105),
      @(1),
      @(1),
      @(0),
      @(47),
      @(295),
      @(248),
      @(408),
      @"A3 (一般)治疗 A1 47点,还剩295点",
      ],
  ],
      @(2),
      ],
  @[
      @(1),
      @(0),
      @(8),
      @(9),
      @(7),
      @(1),
      @(5),
      @(0),
      @(1),
  @[
  @[
      @(0),
      @(215),
      @(1),
      @(1),
      @(0),
      @(434),
      @(0),
      @(102),
      @(200),
      @"A5 (普通)攻击 B1 434点,还剩0点",
      ],
  ],
      @(2),
      ],
  @[
      @(0),
      @(0),
      @(4),
      @(9),
      @(0),
      @(3),
      @(3),
      @(0),
      @(1),
  @[
  @[
      @(2612),
      @(53),
      @(3),
      @(1),
      @(0),
      @(13),
      @(444),
      @(457),
      @(612),
      @"B3 (普通)攻击 A3 13点,还剩444点",
      ],
  ],
      @(2),
      ],
  @[
      @(0),
      @(0),
      @(5),
      @(1),
      @(0),
      @(2),
      @(5),
      @(0),
      @(2),
  @[
  @[
      @(2613),
      @(105),
      @(1),
      @(1),
      @(0),
      @(168),
      @(127),
      @(295),
      @(408),
      @"B5 (普通)攻击 A1 168点,还剩127点",
      ],
  @[
      @(2611),
      @(19),
      @(2),
      @(1),
      @(0),
      @(133),
      @(956),
      @(1089),
      @(1224),
      @"B5 (普通)攻击 A2 133点,还剩956点",
      ],
  @[
      @(2612),
      @(53),
      @(3),
      @(1),
      @(0),
      @(148),
      @(296),
      @(444),
      @(612),
      @"B5 (普通)攻击 A3 148点,还剩296点",
      ],
  ],
      @(2),
      ],
  @[
      @(1),
      @(0),
      @(9),
      @(9),
      @(2613),
      @(105),
      @(1),
      @(1),
      @(8),
  @[
  @[
      @(0),
      @(3),
      @(3),
      @(1),
      @(0),
      @(109),
      @(228),
      @(337),
      @(400),
      @"A1 (技能)攻击 B3 109点,还剩228点",
      ],
  ],
      @(3),
      ],
  @[
      @(1),
      @(0),
      @(10),
      @(4),
      @(2611),
      @(19),
      @(2),
      @(1),
      @(1),
  @[
  @[
      @(0),
      @(3),
      @(3),
      @(1),
      @(0),
      @(81),
      @(147),
      @(228),
      @(400),
      @"A2 (技能)攻击 B3 81点,还剩147点",
      ],
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(1),
      @(2960),
      @(2961),
      @(2961),
      @"A2 (技能)攻击 B5 1点,还剩2960点",
      ],
  ],
      @(3),
      ],
  @[
      @(1),
      @(1),
      @(11),
      @(11),
      @(2612),
      @(53),
      @(3),
      @(1),
      @(7),
  @[
  @[
      @(2613),
      @(105),
      @(1),
      @(1),
      @(0),
      @(76),
      @(203),
      @(127),
      @(408),
      @"A3 (一般)治疗 A1 76点,还剩203点",
      ],
  @[
      @(2611),
      @(19),
      @(2),
      @(1),
      @(0),
      @(80),
      @(1036),
      @(956),
      @(1224),
      @"A3 (一般)治疗 A2 80点,还剩1036点",
      ],
  @[
      @(2612),
      @(53),
      @(3),
      @(1),
      @(0),
      @(76),
      @(372),
      @(296),
      @(612),
      @"A3 (一般)治疗 A3 76点,还剩372点",
      ],
  ],
      @(3),
      ],
  @[
      @(1),
      @(0),
      @(12),
      @(4),
      @(7),
      @(1),
      @(5),
      @(1),
      @(1),
  @[
  @[
      @(0),
      @(3),
      @(3),
      @(1),
      @(0),
      @(464),
      @(0),
      @(147),
      @(400),
      @"A5 (技能)攻击 B3 464点,还剩0点",
      ],
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(296),
      @(2664),
      @(2960),
      @(2961),
      @"A5 (技能)攻击 B5 296点,还剩2664点",
      ],
  ],
      @(3),
      ],
  @[
      @(0),
      @(0),
      @(6),
      @(4),
      @(0),
      @(2),
      @(5),
      @(1),
      @(2),
  @[
  @[
      @(2613),
      @(105),
      @(1),
      @(1),
      @(0),
      @(153),
      @(50),
      @(203),
      @(408),
      @"B5 (技能)攻击 A1 153点,还剩50点",
      ],
  @[
      @(2611),
      @(19),
      @(2),
      @(1),
      @(0),
      @(122),
      @(914),
      @(1036),
      @(1224),
      @"B5 (技能)攻击 A2 122点,还剩914点",
      ],
  @[
      @(2612),
      @(53),
      @(3),
      @(1),
      @(0),
      @(138),
      @(234),
      @(372),
      @(612),
      @"B5 (技能)攻击 A3 138点,还剩234点",
      ],
  @[
      @(7),
      @(1),
      @(5),
      @(1),
      @(0),
      @(1),
      @(12443),
      @(12444),
      @(12444),
      @"B5 (技能)攻击 A5 1点,还剩12443点",
      ],
  ],
      @(3),
      ],
  @[
      @(1),
      @(0),
      @(13),
      @(1),
      @(2613),
      @(105),
      @(1),
      @(0),
      @(8),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(1),
      @(1),
      @(2663),
      @(2664),
      @(2961),
      @"A1 (普通)暴击 B5 1点,还剩2663点",
      ],
  ],
      @(4),
      ],
  @[
      @(1),
      @(0),
      @(14),
      @(9),
      @(2611),
      @(19),
      @(2),
      @(0),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(1),
      @(1),
      @(2662),
      @(2663),
      @(2961),
      @"A2 (普通)暴击 B5 1点,还剩2662点",
      ],
  ],
      @(4),
      ],
  @[
      @(1),
      @(1),
      @(15),
      @(10),
      @(2612),
      @(53),
      @(3),
      @(0),
      @(7),
  @[
  @[
      @(2613),
      @(105),
      @(1),
      @(1),
      @(0),
      @(46),
      @(96),
      @(50),
      @(408),
      @"A3 (一般)治疗 A1 46点,还剩96点",
      ],
  ],
      @(4),
      ],
  @[
      @(1),
      @(0),
      @(16),
      @(9),
      @(7),
      @(1),
      @(5),
      @(0),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(258),
      @(2404),
      @(2662),
      @(2961),
      @"A5 (普通)攻击 B5 258点,还剩2404点",
      ],
  ],
      @(4),
      ],
  @[
      @(0),
      @(0),
      @(7),
      @(1),
      @(0),
      @(2),
      @(5),
      @(0),
      @(2),
  @[
  @[
      @(2613),
      @(105),
      @(1),
      @(1),
      @(0),
      @(159),
      @(0),
      @(96),
      @(408),
      @"B5 (普通)攻击 A1 159点,还剩0点",
      ],
  @[
      @(2611),
      @(19),
      @(2),
      @(1),
      @(0),
      @(134),
      @(780),
      @(914),
      @(1224),
      @"B5 (普通)攻击 A2 134点,还剩780点",
      ],
  @[
      @(2612),
      @(53),
      @(3),
      @(1),
      @(0),
      @(141),
      @(93),
      @(234),
      @(612),
      @"B5 (普通)攻击 A3 141点,还剩93点",
      ],
  ],
      @(4),
      ],
  @[
      @(1),
      @(0),
      @(17),
      @(9),
      @(2611),
      @(19),
      @(2),
      @(0),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(1),
      @(2403),
      @(2404),
      @(2961),
      @"A2 (普通)攻击 B5 1点,还剩2403点",
      ],
  ],
      @(5),
      ],
  @[
      @(1),
      @(1),
      @(18),
      @(10),
      @(2612),
      @(53),
      @(3),
      @(0),
      @(7),
  @[
  @[
      @(2611),
      @(19),
      @(2),
      @(1),
      @(0),
      @(46),
      @(826),
      @(780),
      @(1224),
      @"A3 (一般)治疗 A2 46点,还剩826点",
      ],
  ],
      @(5),
      ],
  @[
      @(1),
      @(0),
      @(19),
      @(9),
      @(7),
      @(1),
      @(5),
      @(0),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(265),
      @(2138),
      @(2403),
      @(2961),
      @"A5 (普通)攻击 B5 265点,还剩2138点",
      ],
  ],
      @(5),
      ],
  @[
      @(0),
      @(0),
      @(8),
      @(1),
      @(0),
      @(2),
      @(5),
      @(0),
      @(2),
  @[
  @[
      @(2611),
      @(19),
      @(2),
      @(1),
      @(0),
      @(128),
      @(698),
      @(826),
      @(1224),
      @"B5 (普通)攻击 A2 128点,还剩698点",
      ],
  @[
      @(2612),
      @(53),
      @(3),
      @(1),
      @(0),
      @(147),
      @(0),
      @(93),
      @(612),
      @"B5 (普通)攻击 A3 147点,还剩0点",
      ],
  ],
      @(5),
      ],
  @[
      @(1),
      @(0),
      @(20),
      @(4),
      @(2611),
      @(19),
      @(2),
      @(1),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(1),
      @(2137),
      @(2138),
      @(2961),
      @"A2 (技能)攻击 B5 1点,还剩2137点",
      ],
  ],
      @(6),
      ],
  @[
      @(1),
      @(0),
      @(21),
      @(4),
      @(7),
      @(1),
      @(5),
      @(1),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(298),
      @(1839),
      @(2137),
      @(2961),
      @"A5 (技能)攻击 B5 298点,还剩1839点",
      ],
  ],
      @(6),
      ],
  @[
      @(0),
      @(0),
      @(9),
      @(4),
      @(0),
      @(2),
      @(5),
      @(1),
      @(2),
  @[
  @[
      @(2611),
      @(19),
      @(2),
      @(0),
      @(-1),
      @(0),
      @(698),
      @(698),
      @(1224),
      @"B5 没命中 A2",
      ],
  @[
      @(7),
      @(1),
      @(5),
      @(1),
      @(0),
      @(1),
      @(12442),
      @(12443),
      @(12444),
      @"B5 (技能)攻击 A5 1点,还剩12442点",
      ],
  ],
      @(6),
      ],
  @[
      @(1),
      @(0),
      @(22),
      @(9),
      @(2611),
      @(19),
      @(2),
      @(0),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(1),
      @(1838),
      @(1839),
      @(2961),
      @"A2 (普通)攻击 B5 1点,还剩1838点",
      ],
  ],
      @(7),
      ],
  @[
      @(1),
      @(0),
      @(23),
      @(9),
      @(7),
      @(1),
      @(5),
      @(0),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(270),
      @(1568),
      @(1838),
      @(2961),
      @"A5 (普通)攻击 B5 270点,还剩1568点",
      ],
  ],
      @(7),
      ],
  @[
      @(0),
      @(0),
      @(10),
      @(1),
      @(0),
      @(2),
      @(5),
      @(0),
      @(2),
  @[
  @[
      @(2611),
      @(19),
      @(2),
      @(1),
      @(0),
      @(135),
      @(563),
      @(698),
      @(1224),
      @"B5 (普通)攻击 A2 135点,还剩563点",
      ],
  ],
      @(7),
      ],
  @[
      @(1),
      @(0),
      @(24),
      @(9),
      @(2611),
      @(19),
      @(2),
      @(0),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(1),
      @(1567),
      @(1568),
      @(2961),
      @"A2 (普通)攻击 B5 1点,还剩1567点",
      ],
  ],
      @(8),
      ],
  @[
      @(1),
      @(0),
      @(25),
      @(9),
      @(7),
      @(1),
      @(5),
      @(0),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(257),
      @(1310),
      @(1567),
      @(2961),
      @"A5 (普通)攻击 B5 257点,还剩1310点",
      ],
  ],
      @(8),
      ],
  @[
      @(0),
      @(0),
      @(11),
      @(1),
      @(0),
      @(2),
      @(5),
      @(0),
      @(2),
  @[
  @[
      @(2611),
      @(19),
      @(2),
      @(1),
      @(0),
      @(136),
      @(427),
      @(563),
      @(1224),
      @"B5 (普通)攻击 A2 136点,还剩427点",
      ],
  ],
      @(8),
      ],
  @[
      @(1),
      @(0),
      @(26),
      @(4),
      @(2611),
      @(19),
      @(2),
      @(1),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(1),
      @(1309),
      @(1310),
      @(2961),
      @"A2 (技能)攻击 B5 1点,还剩1309点",
      ],
  ],
      @(9),
      ],
  @[
      @(1),
      @(0),
      @(27),
      @(4),
      @(7),
      @(1),
      @(5),
      @(1),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(305),
      @(1004),
      @(1309),
      @(2961),
      @"A5 (技能)攻击 B5 305点,还剩1004点",
      ],
  ],
      @(9),
      ],
  @[
      @(0),
      @(0),
      @(12),
      @(4),
      @(0),
      @(2),
      @(5),
      @(1),
      @(2),
  @[
  @[
      @(2611),
      @(19),
      @(2),
      @(0),
      @(-1),
      @(0),
      @(427),
      @(427),
      @(1224),
      @"B5 没命中 A2",
      ],
  @[
      @(7),
      @(1),
      @(5),
      @(1),
      @(0),
      @(1),
      @(12441),
      @(12442),
      @(12444),
      @"B5 (技能)攻击 A5 1点,还剩12441点",
      ],
  ],
      @(9),
      ],
  @[
      @(1),
      @(0),
      @(28),
      @(9),
      @(2611),
      @(19),
      @(2),
      @(0),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(1),
      @(1003),
      @(1004),
      @(2961),
      @"A2 (普通)攻击 B5 1点,还剩1003点",
      ],
  ],
      @(10),
      ],
  @[
      @(1),
      @(0),
      @(29),
      @(9),
      @(7),
      @(1),
      @(5),
      @(0),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(249),
      @(754),
      @(1003),
      @(2961),
      @"A5 (普通)攻击 B5 249点,还剩754点",
      ],
  ],
      @(10),
      ],
  @[
      @(0),
      @(0),
      @(13),
      @(1),
      @(0),
      @(2),
      @(5),
      @(0),
      @(2),
  @[
  @[
      @(2611),
      @(19),
      @(2),
      @(1),
      @(0),
      @(127),
      @(300),
      @(427),
      @(1224),
      @"B5 (普通)攻击 A2 127点,还剩300点",
      ],
  ],
      @(10),
      ],
  @[
      @(1),
      @(0),
      @(30),
      @(9),
      @(2611),
      @(19),
      @(2),
      @(0),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(1),
      @(753),
      @(754),
      @(2961),
      @"A2 (普通)攻击 B5 1点,还剩753点",
      ],
  ],
      @(11),
      ],
  @[
      @(1),
      @(0),
      @(31),
      @(9),
      @(7),
      @(1),
      @(5),
      @(0),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(256),
      @(497),
      @(753),
      @(2961),
      @"A5 (普通)攻击 B5 256点,还剩497点",
      ],
  ],
      @(11),
      ],
  @[
      @(0),
      @(0),
      @(14),
      @(1),
      @(0),
      @(2),
      @(5),
      @(0),
      @(2),
  @[
  @[
      @(2611),
      @(19),
      @(2),
      @(1),
      @(0),
      @(136),
      @(164),
      @(300),
      @(1224),
      @"B5 (普通)攻击 A2 136点,还剩164点",
      ],
  ],
      @(11),
      ],
  @[
      @(1),
      @(0),
      @(32),
      @(4),
      @(2611),
      @(19),
      @(2),
      @(1),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(1),
      @(496),
      @(497),
      @(2961),
      @"A2 (技能)攻击 B5 1点,还剩496点",
      ],
  ],
      @(12),
      ],
  @[
      @(1),
      @(0),
      @(33),
      @(4),
      @(7),
      @(1),
      @(5),
      @(1),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(280),
      @(216),
      @(496),
      @(2961),
      @"A5 (技能)攻击 B5 280点,还剩216点",
      ],
  ],
      @(12),
      ],
  @[
      @(0),
      @(0),
      @(15),
      @(4),
      @(0),
      @(2),
      @(5),
      @(1),
      @(2),
  @[
  @[
      @(2611),
      @(19),
      @(2),
      @(1),
      @(0),
      @(122),
      @(42),
      @(164),
      @(1224),
      @"B5 (技能)攻击 A2 122点,还剩42点",
      ],
  @[
      @(7),
      @(1),
      @(5),
      @(1),
      @(0),
      @(1),
      @(12440),
      @(12441),
      @(12444),
      @"B5 (技能)攻击 A5 1点,还剩12440点",
      ],
  ],
      @(12),
      ],
  @[
      @(1),
      @(0),
      @(34),
      @(9),
      @(2611),
      @(19),
      @(2),
      @(0),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(1),
      @(215),
      @(216),
      @(2961),
      @"A2 (普通)攻击 B5 1点,还剩215点",
      ],
  ],
      @(13),
      ],
  @[
      @(1),
      @(0),
      @(35),
      @(9),
      @(7),
      @(1),
      @(5),
      @(0),
      @(1),
  @[
  @[
      @(0),
      @(2),
      @(5),
      @(1),
      @(0),
      @(267),
      @(0),
      @(215),
      @(2961),
      @"A5 (普通)攻击 B5 267点,还剩0点",
      ],
  ],
      @(13),
      ],
  ],
            @"enemy" : @{
                    @"heros" : @[
  @{
      @"id" : @(0),
      @"hero_id" : @(215),
      @"hero_level" : @(1),
      @"is_captain" : @(1),
      @"position" : @(1),
      },
  @{
      @"id" : @(0),
      @"hero_id" : @(2),
      @"hero_level" : @(1),
      @"is_captain" : @(0),
      @"position" : @(2),
      },
  @{
      @"id" : @(0),
      @"hero_id" : @(3),
      @"hero_level" : @(1),
      @"is_captain" : @(0),
      @"position" : @(3),
      },
  ],
                    @"tower" : @{
                            @"tower_level" : @(1),
                            @"id" : @(0),
                            @"position" : @(5),
                            @"tower_id" : @(2),
                            },
                    },
            @"settlement" : @{
                    @"get_tower_xp" : @(500),
                    @"rewards" : @{
                            @"current_rewards" : @(2),
                            @"total_silve" : @(68550),
                            @"show_rewards" : @[
                                    @(2),
                                    @(3),
                                    @(5),
                                    @(6),
                                    @(8),
                                    @(18),
                                    @(23),
                                    @(47),
                                    @(50),
                                    ],
                            },
                    @"get_xp" : @(500),
                    @"get_silver" : @(500),
                    @"total_exploit" : @(20),
                    @"next_level_need_xp" : @(1465),
                    @"current_pvp" : @(18),
                    @"current_pve" : @(19),
                    @"pvp_cost" : @(1),
                    @"current_level" : @(9),
                    @"get_devote" : @(100),
                    @"get_exploit" : @(3),
                    @"tower" : @{
                            @"total_tower_xp" : @(2912),
                            @"current_tower_level" : @(5),
                            @"tower_ush_id" : @(7),
                            },
                    },
            @"win" : @(1),
            @"last_round_count" : @(13),
            };
}

- (NSString *)createDemoForData:(id)data
{
    return [XCDemoPrinter stringFromData:data];
}

@end
