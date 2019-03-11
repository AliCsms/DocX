//
//  NSAttributedString+DocX.swift
//  DocXWriter
//
//  Created by Morten Bertz on 2019/03/10.
//  Copyright © 2019 telethon k.k. All rights reserved.
//

import Foundation

extension NSAttributedString:DocX{}

extension NSAttributedString{
    var paragraphRanges:[Range<String.Index>]{
        var ranges=[Range<String.Index>]()
        self.string.enumerateSubstrings(in: self.string.startIndex..<self.string.endIndex, options: [.byParagraphs], {_, range, rangeIncludingSeperators, _ in
            ranges.append(range)
        })
        return ranges
    }
    
    var usesVerticalForms:Bool{
        var vertical=false
        
        self.enumerateAttribute(.verticalForms, in: NSRange(location: 0, length: self.length), options: [.longestEffectiveRangeNotRequired], using: {attributes, _, stop in
            vertical=true
            stop.pointee=true
        })
        self.enumerateAttribute(.verticalGlyphForm, in: NSRange(location: 0, length: self.length), options: [.longestEffectiveRangeNotRequired], using: {attributes, _, stop in
            vertical=true
            stop.pointee=true
        })
        
        return vertical
    }
}


extension NSAttributedString.Key{
    static let ruby=NSAttributedString.Key(kCTRubyAnnotationAttributeName as String)
    static let verticalForms=NSAttributedString.Key(kCTVerticalFormsAttributeName as String)
}




