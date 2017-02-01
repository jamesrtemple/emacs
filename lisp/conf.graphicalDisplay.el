;;Setup options that are invalid in the terminal
;;or that I only want in graphical version
(when (display-graphic-p)
  (scroll-bar-mode 0)                              ;;Set Scroll bars on or off
  (tool-bar-mode 0)                                ;;Set toolbar off
  (fringe-mode 15)                                  ;;Enable fringes
  (set-frame-size (selected-frame) 160 60) 
)
