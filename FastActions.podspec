Pod::Spec.new do |spec|

  spec.name         = "FastActions"
  spec.version      = "0.2.0"
  spec.summary      = "FastActions is a powerful and pure Swift implemented library for action handler."

  spec.description  = <<-DESC
  					          The purpose of FastActions is to provide a more convenient way for handle action. FastActions currently only provides some basic functionality, and it has a lot of room for improvement. We will provide more features later to make it more complete.
                   DESC

  spec.homepage     = "https://github.com/dengyhgit/FastActions"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "DengYonghao" => "cbyniypeu@163.com" }
  # spec.social_media_url   = "https://twitter.com/dengyonghao2"

  spec.swift_version = "4.2"
  # spec.swift_versions = ['4.0', '4.2', '5.0']

  spec.ios.deployment_target = "9.0"
  spec.tvos.deployment_target = "10.0"
  spec.osx.deployment_target = "10.12"
  # spec.watchos.deployment_target = "3.0"

  spec.source       = { :git => "https://github.com/dengyhgit/FastActions.git", :tag => "#{spec.version}" }
  spec.source_files  = ["Sources/**/*.swift", "Sources/FastActions.h"]
  spec.public_header_files = ["Sources/FastActions.h"]
  spec.exclude_files = "Sources/Exclude"

  spec.osx.exclude_files = [
      "Sources/Extensions/UIControl+FastActions.swift", 
      "Sources/Extensions/UIGestureRecognizer+FastActions.swift",
      "Sources/Extensions/UIView+FastActions.swift"
    ]
  spec.watchos.exclude_files = [
      
    ]
  spec.ios.exclude_files = [

    ]
  spec.tvos.exclude_files = [
      "Sources/Extensions/UIControl+FastActions.swift", 
      "Sources/Extensions/UIGestureRecognizer+FastActions.swift",
      "Sources/Extensions/UIView+FastActions.swift"
    ]

  spec.requires_arc = true

end
