Pod::Spec.new do |s|
  s.name         = "NNAddressBook"
  s.version      = "0.2.0"
  s.summary      = "AddressBook Library"
  s.homepage     = "https://github.com/noughts/NNAddressBook"
  s.author       = { "noughts" => "noughts@gmail.com" }
  s.source       = { :git => "https://github.com/noughts/NNAddressBook.git", :tag => "0.2.0" }
  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.platform = :ios
  s.requires_arc = true
  s.framework  = 'AddressBook'
  s.source_files = 'NNAddressBook'
end
