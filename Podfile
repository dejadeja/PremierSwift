# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'PremierSwift' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for PremierSwift
 pod 'Alamofire', '~> 4.5'
 pod 'RealmSwift'

plugin 'cocoapods-keys', {
  :project => 'PremierSwift',
  :keys => [
    "MovieAPIKey"
  ]
}

  target 'PremierSwiftTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
