desc 'Run the tests'
task :test do
  if `which xcodebuild`.length == 0
    fail "\nERROR: xcodebuild isn't installed. Please install xcodebuild build with the following command:\n\n    $ brew install xcodebuild\n\n"
  end
  sh 'xcodebuild test -project Imgix.xcodeproj -scheme Imgix -destination \'platform=iOS Simulator,name=iPhone 4s,OS=latest\' | xcpretty --color; exit ${PIPESTATUS[0]}'
end

desc 'Print test coverage of the last test run.'
task :coverage do
  sh 'slather coverage -s'
end

task :default => :test
