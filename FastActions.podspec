Pod::Spec.new do |spec|

  spec.name         = "FastActions"
  spec.version      = "0.2.0"
  spec.summary      = "FastActions is a powerful and pure Swift implemented library for action handler."

  spec.description  = <<-DESC
  					          FastActions is a powerful and pure Swift implemented library for action handler.
                   DESC

  spec.homepage     = "https://github.com/dengyhgit/FastActions"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "DengYonghao" => "cbyniypeu@163.com" }
  spec.social_media_url   = "https://twitter.com/dengyonghao2"

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

  spec.requires_arc = true

end
