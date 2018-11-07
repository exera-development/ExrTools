//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try font.validate()
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 colors.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 4 files.
  struct file {
    /// Resource file `MavenPro-Black.ttf`.
    static let mavenProBlackTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "MavenPro-Black", pathExtension: "ttf")
    /// Resource file `MavenPro-Bold.ttf`.
    static let mavenProBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "MavenPro-Bold", pathExtension: "ttf")
    /// Resource file `MavenPro-Medium.ttf`.
    static let mavenProMediumTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "MavenPro-Medium", pathExtension: "ttf")
    /// Resource file `MavenPro-Regular.ttf`.
    static let mavenProRegularTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "MavenPro-Regular", pathExtension: "ttf")
    
    /// `bundle.url(forResource: "MavenPro-Black", withExtension: "ttf")`
    static func mavenProBlackTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.mavenProBlackTtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "MavenPro-Bold", withExtension: "ttf")`
    static func mavenProBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.mavenProBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "MavenPro-Medium", withExtension: "ttf")`
    static func mavenProMediumTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.mavenProMediumTtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "MavenPro-Regular", withExtension: "ttf")`
    static func mavenProRegularTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.mavenProRegularTtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 4 fonts.
  struct font: Rswift.Validatable {
    /// Font `MavenPro-Black`.
    static let mavenProBlack = Rswift.FontResource(fontName: "MavenPro-Black")
    /// Font `MavenPro-Bold`.
    static let mavenProBold = Rswift.FontResource(fontName: "MavenPro-Bold")
    /// Font `MavenPro-Medium`.
    static let mavenProMedium = Rswift.FontResource(fontName: "MavenPro-Medium")
    /// Font `MavenPro-Regular`.
    static let mavenProRegular = Rswift.FontResource(fontName: "MavenPro-Regular")
    
    /// `UIFont(name: "MavenPro-Black", size: ...)`
    static func mavenProBlack(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: mavenProBlack, size: size)
    }
    
    /// `UIFont(name: "MavenPro-Bold", size: ...)`
    static func mavenProBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: mavenProBold, size: size)
    }
    
    /// `UIFont(name: "MavenPro-Medium", size: ...)`
    static func mavenProMedium(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: mavenProMedium, size: size)
    }
    
    /// `UIFont(name: "MavenPro-Regular", size: ...)`
    static func mavenProRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: mavenProRegular, size: size)
    }
    
    static func validate() throws {
      if R.font.mavenProBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'MavenPro-Bold' could not be loaded, is 'MavenPro-Bold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.mavenProRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'MavenPro-Regular' could not be loaded, is 'MavenPro-Regular.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.mavenProMedium(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'MavenPro-Medium' could not be loaded, is 'MavenPro-Medium.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.mavenProBlack(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'MavenPro-Black' could not be loaded, is 'MavenPro-Black.ttf' added to the UIAppFonts array in this targets Info.plist?") }
    }
    
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 0 images.
  struct image {
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 0 reuse identifiers.
  struct reuseIdentifier {
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 0 storyboards.
  struct storyboard {
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      // There are no resources to validate
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R {
  struct nib {
    fileprivate init() {}
  }
  
  struct storyboard {
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
