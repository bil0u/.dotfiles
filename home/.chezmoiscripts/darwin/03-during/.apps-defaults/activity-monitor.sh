# Set columns displayed
defaults write com.apple.ActivityMonitor "UserColumnsPerTab v6.0" '{0=(Architecture,UID,PID,Command,PowerScore,CPUUsage,CPUTime,Threads,IdleWakeUps,GPUUsage,GPUTime,);1=(Command,anonymousMemory,Threads,Ports,PID,UID,);2=(Command,PowerScore,12HRPower,AppSleep,graphicCard,powerAssertion,UID,);3=(Command,bytesWritten,bytesRead,PID,UID,);4=(Command,txBytes,rxBytes,txPackets,rxPackets,PID,UID,);5=(Name,LastHour,LastDay,LastWeek,LastMonth,);6=(Command,GPUUsage,GPUTime,PID,UID,);}'
# Set columns width
defaults write com.apple.ActivityMonitor "Column Width" '{CPU={12HRPower=80;AppSleep=70;Architecture=63;AveragePowerScore=120;CPUTime=81;CPUUsage="103.5";Command="472.5";GPUTime="94.5";GPUUsage=75;IdleWakeUps=98;InstantOff=86;PID=40;Ports=48;PowerScore="79.5";Private=88;PurgeableMem=104;ResidentSize=72;Sandbox=58;Shared=88;Threads=60;UID=80;anonymousMemory=64;bytesRead=92;bytesWritten=92;compressedMemory=110;powerAssertion=96;restricted=96;rxBytes=70;rxPackets=80;txBytes=80;txPackets=80;};}'

# Regular app icon in dock
defaults write com.apple.ActivityMonitor IconType -int 0
# Frequent updates (2s)
defaults write com.apple.ActivityMonitor UpdatePeriod -int 2
# Keep processor window on top
defaults write com.apple.ActivityMonitor OnTop -bool true
# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 100
# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string CPUUsage
defaults write com.apple.ActivityMonitor SortDirection -int 0
