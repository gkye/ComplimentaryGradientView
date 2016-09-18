#
# Be sure to run `pod lib lint ComplimentaryGradientView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ComplimentaryGradientView'
<<<<<<< HEAD
  s.version          = '0.1.0'
=======
  s.version          = '0.1.1'
>>>>>>> 81d9d137abfc84b01b10115f7fd45ceacd5211ca
  s.summary          = 'Create complementary gradients generated from dominant and prominent colors in supplied image.'

  s.description      = 'Create complementary gradients generated from dominant and prominent colors in supplied image. Inspired by Grade.js'

  s.homepage         = 'https://github.com/gkye/ComplimentaryGradientView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '=' => 'qwstnz@gmail.com' }
  s.source           = { :git => 'https://github.com/gkye/ComplimentaryGradientView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/kyegeorge'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Source/**/*'

end
