desc 'Run the tests'
task :test do
  require_binary 'xcodebuild', 'brew install xcodebuild'
  require_binary 'xcpretty', 'bundle install'
  sh 'xcodebuild test -project Imgix.xcodeproj -scheme Imgix -destination \'platform=iOS Simulator,name=iPhone 4s,OS=latest\' | bundle exec xcpretty --color; exit ${PIPESTATUS[0]}'
end

task :default => :test

desc 'Print test coverage of the last test run.'
task :coverage do
  require_binary 'slather', 'bundle install'
  sh 'slather coverage -s'
end

desc 'Generate documentation'
task :doc do
  require_binary 'appledoc', 'brew install homebrew/versions/appledoc22; brew link --force homebrew/versions/appledoc22'

  options = [
    '--create-html',
    '--no-create-docset',
    '--output Documentation',
    '--project-name Imgix',
    "--project-version '#{version}'",
    "--project-company 'Sam Soffes'",
    '--company-id com.samsoffes'
  ]

  system "appledoc #{options.join(' ')} Imgix"
end


private

def require_binary(binary, install)
  if `which #{binary}`.length == 0
    fail "\nERROR: #{binary} isn't installed. Please install #{binary} with the following command:\n\n    $ #{install}\n\n"
  end
end

def version
  begin
    require 'plist'
    Plist::parse_xml('Imgix/Info.plist')['CFBundleShortVersionString']
  rescue LoadError
    fail "\nERROR: You need to run Bundler. Please run the following command:\n\n    $ bundle install\n\nYou may need to install Bundler with `gem install bundler`.\n"
  end
end
