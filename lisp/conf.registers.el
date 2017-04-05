(defhydra hydra-register-menu (:color blue :hint nil)
"
POINTS
_p_: Save Point         _j_: Jump

TEXT
_c_: Copy Text          _i_: Insert Text       _a_: Append Text        _r_: Prepend Text

WINDOWS
_w_: Save Windows       _f_: Save Frames

BOOKMARKS
_b_: Set Bookmark       _g_: Go to Bookmark    _l_: List Bookmarks     _s_: Save Bookmarks

_q_: Cancel
"
  ("p" point-to-register)
  ("j" jump-to-register)
  ("c" copy-to-register)
  ("i" insert-register)
  ("a" increment-register)
  ("r" prepend-to-register)
  ("w" window-configuration-to-register)
  ("f" frameset-to-register)
  ("b" bookmark-set)
  ("g" bookmark-go)
  ("l" list-bookmarks)
  ("s" bookmark-save)
  ("q" nil))

(global-set-key (kbd "s-r") 'hydra-register-menu/body)
