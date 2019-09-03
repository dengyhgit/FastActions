Pod::Spec.new do |spec|

  spec.name         = "FastActions"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of FastActions."

  spec.description  = <<-DESC
  					          FastActions is a powerful and pure Swift implemented library for action handler.
                   DESC

  spec.homepage     = "https://github.com/dengyhgit/FastActions"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  spec.license      = { :type => "MIT", :file => "LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  spec.author             = { "DengYonghao" => "cbyniypeu@163.com" }
  # spec.social_media_url   = "https://twitter.com/dengyonghao"

 

  spec.swift_version = "4.2"
  # spec.swift_versions = ['4.0', '4.2', '5.0']

  spec.ios.deployment_target = "9.0"
  spec.tvos.deployment_target = "10.0"
  spec.osx.deployment_target = "10.12"
  spec.watchos.deployment_target = "3.0"

  spec.source       = { :git => "https://github.com/dengyhgit/FastActions.git", :tag => "#{spec.version}" }
  spec.source_files  = ["Sources/**/*.swift", "Sources/FastActions.h"]
  spec.public_header_files = ["Sources/FastActions.h"]
  spec.exclude_files = "Sources/Exclude"

  spec.requires_arc = true

end
