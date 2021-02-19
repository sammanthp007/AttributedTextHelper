import UIKit

public protocol AttributedTextHelping {
    /// For setting attributed string that are titles of their section
    func getAttributedSystemFontForTitle(for rawString: String?) -> NSAttributedString?
    
    /// To be used when using custom fonts styling in the app. Usually the above convenience
    /// methods should be used to maintain consistency in style across app
    func getAttributedSystemFontString(
        for rawString: String?,
        color textColor: UIColor,
        size fontSize: CGFloat,
        weight: UIFont.Weight,
        trait: UIFontDescriptor.SymbolicTraits?
    ) -> NSAttributedString?
}

public class AttributedTextHelper: AttributedTextHelping {
    public static let shared: AttributedTextHelping = AttributedTextHelper()
    private init() {}
    
    public func getAttributedSystemFontString(
        for rawString: String?,
        color textColor: UIColor,
        size fontSize: CGFloat,
        weight: UIFont.Weight = UIFont.Weight.regular,
        trait: UIFontDescriptor.SymbolicTraits?
    ) -> NSAttributedString? {
        guard let rawString = rawString else { return nil }
        
        var font =  UIFont.systemFont(ofSize: fontSize, weight: weight)
        if let trait = trait,
           let descriptor = font.fontDescriptor.withSymbolicTraits(trait)
        {
            font = UIFont(descriptor: descriptor, size: 0)
        }
        
        let attrs = [
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.font: font
        ]
        let attributedString = NSAttributedString(string: rawString, attributes: attrs)
        return attributedString
    }
    
    public func getAttributedSystemFontForTitle(for rawString: String?) -> NSAttributedString? {
        guard let rawString = rawString else { return nil }
        
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22.0, weight: UIFont.Weight.semibold)
        ]
        let attributedString = NSAttributedString(string: rawString, attributes: attrs)
        return attributedString
    }
}
