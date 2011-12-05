#!/usr/bin/env ruby

$finished=false
$wakeuptime=2000

if ARGV.length>=1
  puts "wakeup at #{ARGV[0].to_i}"
  $wakeuptime = ARGV[0].to_i
else
  puts "Please specify wakeuptime in Format HHMM"
  exit
end

if ARGV.length>=2
  $wakeupstring = ARGV[1]
else
  $wakeupstring = "gang uf de bus!"
end

while not $finished do
  stdout = `#{"date +%H%M"}`
  #puts stdout
  if stdout.to_i >= $wakeuptime
    $finished = true
  end
  sleep 1
end


system("kdialog --msgbox \"#{$wakeupstring}\"")
