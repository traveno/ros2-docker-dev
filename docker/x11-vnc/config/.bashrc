#!/bin/bash
alias nv="nvim"

if [ -f "/root/.first_login" ]; then
  rm -f /root/.first_login
  cat << EOF
Welcome to the ROS BOX!
-----------------------
This is a super minimal environment. Right click on the background to open the
launch menu. For windows that you can't resize, hold ALT and right-click drag
one of the corners. Not much else to see really. Any ROS nodes you launch in the
dev_environment container will appear here (assuming they have a GUI).
         _   _                                  
       /u@) (@\\                        ┌───────────────────────────────────┐
   nn      Y                           │                                   │
   'Y _____H____       ◄───────────────┤  What's up dog. I've been stuck   │
    \\V | -["]- |___,,                  │  here for a while. Oh you too?    │
     \\\\| T'T'T |___nn                  │  Let's use my SLAM mapping and    │
     | | | | | |   UU                  │  LIDAR functions to get the hell  │
    /\` \`\\WALL.E \`\\                     │  out!                             │
   / /A  \\   / A\\ \\                    │                                   │
   L_____J   L____J                    └───────────────────────────────────┘
                                                                            
-----------------------
EOF
fi