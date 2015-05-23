desc 'Run the tests'
task :test do
  sh "xcodebuild test -project Imgix.xcodeproj -scheme Imgix -destination 'platform=iOS Simulator,name=iPhone 4s,OS=latest' | xcpretty --color; exit ${PIPESTATUS[0]}"
end

task :default => :test
